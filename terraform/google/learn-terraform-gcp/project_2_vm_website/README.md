Creates the infrastructure for hosting a website on VM.

Still requires SSH to VM to do below:
- sudo apt-get update
- sudo apt-get install apache2 php7.0
- echo '<!doctype html><html><body><h1>Hello World!</h1></body></html>' | sudo tee /var/www/html/index.html

Then you can visit the website:
- http://[vm_external_ip]