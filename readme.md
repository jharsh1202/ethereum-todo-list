<h2>Installation</h2>

<h3>Way 1 (Recommended):</h3>
    Use this ready to use docker image.
          
    docker pull 2017003525/blockchain-development
    docker run -it --name ethereum_todo_list -p 8576:8545 -p 80:3000 -p 81:3001 2017003525/blockchain-development

To open more terminals for this container run,

    docker exec -it ethereum_todo_list bash

<h3>Way 2: (Longer method, create docker image from scratch): </h3>

    docker run -it ubuntu
    docker run -it --name ethereum_todo_list -p 8576:8545 -p 80:3000 -p 81:3001 ubuntu

on your container execute below:

    apt-get update && apt-get upgrade 
    apt-get install sudo build-essential python3 wget curl
    
Then install nvm from https://github.com/nvm-sh/nvm#install--update-script

On above link there must be these two commands but with updated versions 

    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

then install node and npm with:

    nvm install node
    node install npm
    npm install npm
 
after executing 

    nvm install-latest-npm

you'll find a statement to update npm to the latest version, execute that command, which should look like, `npm install -g npm@8.6.0`, after that install truffle

    npm install -g truffle

there will be a permission issue in executing above command for which you've to execute 

    sudo chown -R $(whoami) <path to node_modules directory>

**Note:** the above command has path to `node_modules` you need to find the path to your node_modules from your error. in my case it was `/root/.nvm/versions/node/v17.9.0/lib/node_modules/` so i executed, `sudo chown -R $(whoami) /root/.nvm/versions/node/v17.9.0/lib/node_modules/`<br>

retry `npm install -g truffle`

after this you should be done with installation, but you would face problems where you couldn't execute the truffle file. 
for this just allow your truffle file to be executed by running: 
`chmod u+x <path to truffle>` you may find the path to truffle with which truffle, execute as below.

`chmod u+x /root/.nvm/versions/node/v17.9.0/bin/truffle`

For Ganache installation:

    npm install ganache --global

To your package.json add, 

    "scripts": {
      "ganache": "ganache --wallet.seed myCustomSeed"
    }
   

<h1>Execution</h1>

Execute Ganache, this will start your personal blockchain network on your local device.
 
    npm run ganache -h 0.0.0.0

you should be able to see output something like `RPC Listening on 0.0.0.0:8545`

now execute truffle console, make sure you add correct port number like above `8545` in file `truffle-config.js` of your code, when you use it.
 
Now for development and deployment of your own smart contracts, execute in your project directory ie. <path/eth-todo-list> 
    
    truffle console

Again in in your project directory ie. <path/eth-todo-list>, execute

    npm run dev

Now you should be able to access the todolist UI with browser on your host OS with 
    
    http://localhost/

Now you need to configure metamask extension to be able to access your blockchain through your browser.


