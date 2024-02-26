# welcome to coding with github copilot ✨

## what is this repository?
Play around with GH Copilot and learn it's capabilities.

## pre-requisites
1. create a [github account](https://github.com/signup)  
2. get access to github copilot
    1. microsofties can request access to gh copilot [here](https://repos.opensource.microsoft.com/orgs/MicrosoftCopilot)
    2. everyone else can buy a licence [here](https://copilot.github.com/) (it's free for students + teachers!)
3. setup
    1. gh codespaces
        1. in this github repository click on code & create codespace on main ![create codespaces on main](./images/on-main.png)
    2. local 
        1. install the needed extensions for your ide
            1. [vscode](https://marketplace.visualstudio.com/items?itemName=GitHub.copilot)
            2. [visual studio](https://marketplace.visualstudio.com/items?itemName=GitHub.copilotvs)
            3. [jetbrains ides](https://plugins.jetbrains.com/plugin/17718-github-copilot)
        2. install everything needed on your local pc (but not today - we use gh codespaces!)

## tasks

### warm-up (use copilot inline): playing around with html, css and javascript
1. create an API endpoint that returns a menu with at least 5 items

2. create an endpoint to create an order. The API should return the total price

3. copy the following code
```python
@app.route('/menu/<string:id>')
def participants(item_id): 
    connect = sqlite3.connect('database.db') 
    cursor = connect.cursor() 
    cursor.execute('SELECT * FROM menu WHERE id =' + item_id + ';')
  
    data = cursor.fetchall()

    return jsonify({'status': data}) 
``` 
to your code, select it and ask copilot chat if there are any issues with it.

4. create a Dockerfile

> tip: if you do not know how to do something, just ask github copilot chat for help :) 

### main tasks (use github copilot chat): deployment
1. open the az-deploy.sh and create an azure deployment for your app with azure cli
    1. create a resource group
    1. create an azure container registry
    1. get the ID for the container registry and store it in a variable
    1. build a container image with the container registry
    1. create a managed identity
    1. get the id of the managed identity and store it in a variable
    1. get the clientId of the managed identity and store it in a variable
    1. create a role assignment, the assignee is the client id of the managed identity, the role is `AcrPull` and the scope is the id of the container registry
    1. create a container apps environment
    1. create a container app with the registry-identity (id from the managed identity), the registry-server (your-registry-name.azurecr.io), the image (your-registry-name.azurecr.io/your-image-name:latest) and the port (80)

### bonus tasks: testing, tbd...
1. ask github copilot to write a (or a few) tests for your api

# Additional reading

## Official resources
- (Copilot trust center)[https://resources.github.com/copilot-trust-center/]
- (Copilot Hackathon)[https://github.com/microsoft/CopilotHackathon]

## Other resources
- (GitHub Copilot Patterns & Exercises)[https://patterns.hattori.dev/]
- (Build an e-commerce website using GitHub Copilot Chat)[https://github.com/mosabami/createwithcopilot/blob/main/README.md]
- (Using GitHub Copilot to quickly build a Node.js application with Azure Cosmos DB and App Service)[https://moaw.dev/workshop/?src=gh%3Aazure-samples%2Fcopilot-nodejs-todo%2Fmain%2Fdocs%2F&step=0]