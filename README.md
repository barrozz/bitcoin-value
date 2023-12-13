
Vendor OPS assignment 
----------------------------------------
Overall Setup: 
1. Create an Azure account for yourself. 
Specifics: 
1. Utilize Azure and AKS (Azure Kubernetes Service). 
2. Establish a Kubernetes (K8S) cluster with Role-Based Access Control (RBAC) enabled. 
3. Develop two APIs within two services, namely Service A and Service B. 
4. API Service Invocation: 
   a. Implement an Ingress controller in the cluster to redirect traffic based on the URL: xxx/service-A or xxx/service-B. 
   b. Configure services to provide the current bitcoin value in dollars using a web API, indicating their service name 
and timestamp (rounded to minutes). 
      Example: GET /ServiceA -> "Service A, bitcoin value is 4.00$ for ‘19-11-23 2:30UTC’". 
   c. Enforce a policy to prevent Service-A from communicating with Service-B. 
5. Background Job: 
   a. For Service A, create a script/application that retrieves the bitcoin value in dollars from a web API every minute 
and prints it. Additionally, every 10 minutes, print the average value of the last 10 minutes. 
 
General Guidelines: 
1. Treat this as a process for setting up a "production-ready" cluster in every sense. The cluster buildout should be 
automated and fully repeatable, with Pods utilizing liveness and readiness. 
2. Ensure the code is supportable. 
3. Share cluster templates and YAML files as a GitHub repository or a zip file. 
