# Introduction to Cloud Computing

**Slides :** https://docs.google.com/presentation/d/1rVdcJq4k5CQZ4s2lDwNrjPDRz71bIWLtvB38Nd3i2no/edit?usp=sharing

**Cloud computing** refers to the delivery of computing services — such as servers, storage, databases, networking, software, and more — over the Internet (“the cloud”) on a pay-as-you-go basis.

Instead of buying, owning, and maintaining physical data centers and servers, you can **rent computing power and storage** from a cloud provider (like Microsoft Azure, AWS, or Google Cloud) and **scale it as needed**.

## Cloud Service Models

**Link :** https://learn.microsoft.com/en-us/training/modules/describe-cloud-service-types/

### Basic Quizz

**1) Which cloud service model provides you with virtual machines, storage, and networks, but you manage the operating system and applications?**

A) SaaS (Software as a Service)  
B) IaaS (Infrastructure as a Service)  
C) PaaS (Platform as a Service)  
D) DaaS (Desktop as a Service)  


**2) In which cloud service model does the provider manage everything including the application, while the user only uses the software through a browser?**  

A) IaaS  
B) PaaS  
C) SaaS  
D) CaaS  


## Cloud Security & Shared Responsibility  

**Link :** https://learn.microsoft.com/en-us/azure/security/fundamentals/shared-responsibility  

### Basic Quizz

**1) Who is responsible for maintaining and securing the physical servers hosting Azure SQL Database?**

A) The client (your company)  
B) Microsoft Azure  
C) An external contractor hired by the client  
D) The internal development team  


**2) In case of a breach caused by misconfigured access rules to Azure SQL Database, who is responsible?**  

A) Microsoft Azure only  
B) The client only  
C) Both Microsoft Azure and the client  
D) No one, it is an unknown vulnerability  


**3) Which cloud model allows developers to build, test, and deploy applications without worrying about managing servers or infrastructure?**  

A) IaaS  
B) SaaS  
C) PaaS  
D) FaaS  


**4) In the Shared Responsibility Model, who is mainly responsible for patching the operating system in a PaaS environment?**  

A) The cloud provider  
B) The customer  
C) Both provider and customer equally  
D) Neither, it is automatic without responsibility  


</br>
</br>

If you are interested in an additional short course regarding Microsoft Azure look [here](https://app.datacamp.com/learn/courses/understanding-microsoft-azure).

## OWASP Cloud Top 10

Please check out before proceeding further [OWASP Cloud-Native Application Security Top 10](https://owasp.org/www-project-cloud-native-application-security-top-10/)

## Cloud security 


Cloud-native applications, while offering agility and scalability, introduce a new set of security challenges. The OWASP Cloud-Native Application Security Top 10 highlights the most critical vulnerabilities commonly found in modern cloud environments, from misconfigurations and insecure pipelines to flawed identity and access management practices.

Before deep diving into Cloud Top 10. Let us understand the basics of a directory service for identity and access managemnt which is Active Directory or now the Entra ID in Azure.

Follow this to learn the basics 

https://youtu.be/fbSVgC8nGz4?si=Y_MjTB_Ym8wSAZ8m
https://youtu.be/0qZzcK1mHwA?si=Gpfb-VbN7RWA8PGr



## Cloud top 10  hands on


| CNAS ID  | Vulnerability Title                                                           |
|----------|-------------------------------------------------------------------------------|
|[CNAS-1](./CNAS-1.md)  | Insecure cloud, container or orchestration configuration         | 
|[CNAS-2](./CNAS-2.md)  | Injection flaws (app layer, cloud events, cloud services)        | 
|[CNAS-3](./CNAS-3.md)  | Improper authentication & authorization                          | 
|[CNAS-4](./CNAS-4.md)  | CI/CD pipeline & software supply chain flaws                     | 
|[CNAS-5](./CNAS-5.md)  |  Insecure secrets storage                                          | 
|[CNAS-6](./CNAS-6.md)  | Over-permissive or insecure network policies                     | 
|[CNAS-7](./CNAS-7.md)  | Using components with known vulnerabilities                      | 
|[CNAS-8](./CNAS-8.md)  | Improper assets management                                       | 
|[CNAS-9](./CNAS-9.md)  | Inadequate ‘compute’ resource quota limits                       | 
|[CNAS-10](./CNAS-10.md)| Ineffective logging & monitoring (e.g. runtime activity)         | 



  

