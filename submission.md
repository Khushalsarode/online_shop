## Submission details and description
- Changing and setting up an port for local host testing
   Modified an vite.config.js file as followed:
   `
   export default defineConfig({
  base: "/",
  plugins: [react()],
  preview: {
   port: 3000,
   strictPort: true,
  },
  server: {
   port: 3000,
   strictPort: true,
   host: true,
   origin: "http://0.0.0.0:8080",
  },
 });
`
 

- Testing app locally
open terminal type in project folder location: `npm install`
To run application: `npm run dev`

- Created an docker file for containerizing an react application 
`./Dockerfile`

TO run dockerfile:
`
docker build -t myreactapp .
docker run -p 8080:3000 myreactapp
`

-Use Docker Scout for docker image and vunerability scan
`
docker scout quickview myreactapp
docker scout cves --details myreactapp:latest
`

- created an dockercompose file for the learning demonstration and local testing
`./docker-compose.yml`

To run compose files:
`docker-compose -f .\docker-compose.yml up`

- created an flow for to push images to docker registry using action
`./.github/workflow/dockerpushflow.yml`

- Add secerts for flow:
Settings → Secrets and variables → Actions
Click New repository secret
`DOCKER_HUB_USERNAME`: Your Docker Hub username
`DOCKER_HUB_ACCESS_TOKEN`: A Docker Hub access token (generated from Docker Hub)

