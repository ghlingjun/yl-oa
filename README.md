OA
=====

The OA system for YunLing Co.    

How to use this OA system?  
1. This system could run on windows OS, but use a Linux OS is the best choice.  
2. Before use thie system, the first is to install the Ruby(version 1.9.3) and the Rails(version 3.2.3).  
3. Open the Terminal, and change the directory to the project directory. Then run [bundle install], make everything is OK.  
4. run [rake db:setup], this task will create the database, load the schema and initialize it with the seed data.  
5. run [rake db:seed], which initialize the db.  
6. run [thin start -d &] to start the server. Than you can visit the OA system by http://localhost:3000, And access by the user[root] and password[admin]  
