module AssociationAttriQuery
  def method_missing(name, *args)
      method = name.to_s
      belongs_to_class_names = collect_associations(:belongs_to)

      belongs_to_class_names.each do |related_class_name|
        if method =~ /^#{related_class_name}_(.*)/
#          attribute = method.sub(/^#{related_class_name}_/, "")
          return self.send(related_class_name).send($1)
        end
      end

      has_many_class_names = collect_associations(:has_many)

      has_many_class_names += collect_associations(:has_and_belongs_to_many)

      has_many_class_names.each do |related_class_name|
        if method =~ /^#{related_class_name}_(.*)/
          return self.send(related_class_name).collect do |record|
            record.send($1)
          end
        end
      end

      super
  end
  private
    def collect_associations relations
      return self.class.reflect_on_all_associations(relations).collect do |association|
        association.name
      end
    end
end

ActiveRecord::Base.send(:include, AssociationAttriQuery)