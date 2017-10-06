Install the application<br>

Copy the application to the server<br>

Go to the server/blog/application/config/config.php <br>
  change : $IP_ADDR = '192.168.1.2'; to the IP address of you server <br>

Go to the server/blog/application/config/database.php <br>
  'hostname' => 'localhost',<br>
  'username' => 'root',<br>
  'password' => 'mysqladmin',<br>
  'database' => 'blog',<br>
  ....<br>
  put you database host name, database user and password<br>



Launch the application <br>
  Open you web browser and enter the url : server/blog/index.php/blog/<br>
  
