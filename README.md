## Dags Construction Services - Project Documentation
This document outlines the technical details of the **Dags Construction Services** project. The project consists of a simple static website of dags construction.

![Docker Hub Screenshot](https://github.com/user-attachments/assets/c29e6aef-ce10-468c-8620-4f91f3445b5e)

---
**Deployment Section** that explains how to containerize the Dags Construction Service  project using Docker, push the image to my DockerHub repo, and deploy it using both Docker and Kubernetes. This includes a detailed `Dockerfile`, instructions on pushing the image, and deploying it for web access.

---

## Deployment

This section details the steps to containerize the **Dags Construction Service** project, push the image to DockerHub, and deploy it using Docker and Kubernetes.

### Prerequisites
Before we begin, ensure you have the following installed:
- [Docker](https://docs.docker.com/get-docker/)
- [Kubernetes CLI (`kubectl`)](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- A DockerHub account (username: `dagadufelix`)

---

### Step 1: Create the Dockerfile

Create a `Dockerfile` in my project root directory with the following content:

```Dockerfile
# Use the official Nginx image
FROM nginx:alpine

# Copy all files from the current directory into the Nginx web root
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]

```

#### Dockerfile Breakdown:
- **Base Image**: We're using the lightweight `nginx:alpine` image to serve the static HTML and CSS files.
- **Working Directory**: We set the working directory inside the container to `/usr/share/nginx/html` (the default directory for serving static files in Nginx).
- **Copy Files**: We copy the HTML and CSS files into the Nginx folder for serving.
- **Expose Port 80**: The container exposes port 80, so the application will be accessible via this port.
- **CMD**: The default command runs Nginx to serve the files.


---

### Step 2: Build the Docker Image

In the project root, where the `Dockerfile` is located, I will run the following command to build the Docker image:

```bash
docker build -t dagadufelix/dags-construction:latest .
```

This command:
- Builds the image from the `Dockerfile`.
- Tags it as `dagadufelix/dags-construction:latest`, which refers to my DockerHub repo `dagadufelix` with the image name `dags-construction`.

---

### Step 3: Verify Image is Built
I can verify if the image is built by:
1. **Listing Images**: Docker images can be listed by running:
```bash
docker image ls
```

> Output: 
>
```
REPOSITORY                         TAG       IMAGE ID       CREATED         SIZE
dagadufelix/dags-construction     latest    e2b762e4b1bc   4 minutes ago   44.7MB
```
---

### Step 4: Running the Docker Container

Next, I will now run the Docker container locally to verify that everything is working as expected.


```bash
docker run -d -p 8080:80 dagadufelix/dags-construction:latest
```

This command:
- Runs the container in detached mode (`-d`).
- Maps port `8080` on my local(host) machine to port `80` in the container (`-p 8080:80`).

I can now access the Cafe Menu by visiting `http://localhost:8080` in my browser.<p>
![alt text](https://github.com/user-attachments/assets/5ee2e041-706d-45b9-86ab-b3b78dee2b11)

---
### Step 5: Push the Docker Image to DockerHub
Having confirmed the image was built successfully, I will push it to my Dockerhub repository.
1. Log in to my DockerHub account via the command line:

```bash
docker login -u <reponame>
```

After logging in, push the Docker image to my DockerHub repository:

```bash
docker push "dagadufelix/dags-construction:latest
```

This will upload the image to DockerHub, making it publicly accessible in my repo.

![<alt text>]("![Fonicy - Google Chrome 9_25_2024 4_31_47 PM](https://github.com/user-attachments/assets/baac987d-b043-469e-8e62-363f8d6525bf)

---

### Step 6: Deploying to Kubernetes

1. **Create a Kubernetes Deployment YAML**:
   
   I need to create a file called `deployment.yaml` with the following content:<p>

   
---

   #### Explanation:
   - **Deployment**: Creates a deployment that runs 3 replicas of the Docker container from the image `dagadufelix/dags-construction`.
   - **Service**: Exposes the deployment as a service of type `LoadBalancer` that listens on port 80.

2. **Deploy the Application**:
   
   Apply the Kubernetes configuration using the following command:

   ```bash
   kubectl apply -f deployment.yaml
   ```
    

3. **Access the Application**:
   
   Get the deployment and running application (pod):
   ```bash
   kubectl get deploy
   ```
   > Output:
   ```
   NAME                            READY   UP-TO-DATE   AVAILABLE      AGE
   dags-construction-deployment    3/3       3            3           8m22s
   ```
  ![<alt text>]("![Screenshot 9_25_2024 9_02_26 PM](https://github.com/user-attachments/assets/6f23ae0a-6178-4105-9eba-a2b161c1588a)
---

### Step 7: Cleanup

If you want to stop the container or remove the Kubernetes deployment, follow these steps:

1. **For Docker**:
   - Views containers running:
     ```
     docker container ls
     ```
     

   - Stop and remove the container:
     ```bash
     docker rm -f <container-id>
     ```

2. **For Kubernetes**:
   - Delete the deployment and service:
     ```bash
     kubectl delete -f deployment.yaml
     ```

---

### Summary

In this section, we covered:
- How to create a `Dockerfile` and build a Docker image for the Dags Construction project.
- How to push the Docker image to DockerHub.
- How to run the project using Docker locally and Kubernetes in a cloud environment.

---
### Conclusion:
This documentation provides an overview of the building and application from scratch with the code and its functionality, helping to understand the structure and styling used in the Dags Construction project. Also, discusses how to build the containerise the application with docker and deploy it with either Docker or 

## Related Shots from Dags Construction Project

![Fonicy and 5 more pages - Profile 1 - Microsoft​ Edge 9_26_2024 4_23_13 PM](https://github.com/user-attachments/assets/dc4a6126-327c-4d4f-8943-252c0a9524e3)
![Fonicy and 5 more pages - Profile 1 - Microsoft​ Edge 9_26_2024 4_23_28 PM](https://github.com/user-attachments/assets/0c7972ec-fc26-4fdf-9fbb-be63e9b0c6a3)
![Fonicy and 5 more pages - Profile 1 - Microsoft​ Edge 9_26_2024 4_23_47 PM](https://github.com/user-attachments/assets/17868432-93e2-48ec-995e-8104b3c59753)
![Fonicy and 5 more pages - Profile 1 - Microsoft​ Edge 9_26_2024 4_24_06 PM](https://github.com/user-attachments/assets/f515cec3-c343-43e9-bb9d-0ce3b33e30f9)
![Fonicy and 5 more pages - Profile 1 - Microsoft​ Edge 9_26_2024 4_24_18 PM](https://github.com/user-attachments/assets/7b89ac9e-b965-425c-80d3-a1cda34a2bea)
![Fonicy and 5 more pages - Profile 1 - Microsoft​ Edge 9_26_2024 4_24_41 PM](https://github.com/user-attachments/assets/4b6131ff-9694-4dd3-8a38-5d3ae35f176a)





Kubernetes. 
