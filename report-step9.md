# Report Step 9

1. git clone https://github.com/Koffi94/Teaching-HEIGVD-RES-2019-Labo-HTTPInfra.git HTTP-Infra`

2. `git checkout -b fb-ui-management`

3. In the main directory, run the `deploy.sh` script.

4. We add the following command in the script that allow to manage containers in a web administration page :<br/> 
`docker run -d -p 9000:9000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer`

5. Log into the application with these creds :<br/>
  login : `admin`<br/>
  pass : `12341234`

  ![](./images/Step9/portainer.png)

