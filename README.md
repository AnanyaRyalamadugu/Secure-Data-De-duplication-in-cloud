# Secure-Data-De-duplication-in-cloud
Data de-duplication refers to a technique for eliminating redundant data in a data set. In the process of de-duplication, extra copies of the same data are deleted, leaving only one copy to be stored. The data is analyzed to identify duplicate byte patterns and ensure the single instance is indeed the only file. Then, duplicates are replaced with a reference that points to the stored chunk. It is a process that eliminates excessive copies of data and significantly decreases storage capacity requirements. De-duplication can be run as an inline process as the data is being written into the storage system and/or as a background process to eliminate duplicates after the data is written to disk.


According to the phase when de-duplication iscarried out, relevant techniques can be divided into two categories.
1.	Server-side de-duplication: Users trivially upload their data to the cloud, and the server will be responsible for detecting and striking out reduplicated data on its own. Though such an idea preserved the functionality of de-duplication, massive bandwidth will be consumed to transmit unnecessary data. 
2.	Client-aided de-duplication: Before uploading, the client calculates the hash function of data for cloud retrieval. Once received the hash value, cloud server checks if the same label exists within its local storage system. If so, the server will instruct to cancel the actual upload process and mark the client as an owner of the corresponding data. Since hash values are always abbreviated, the method could significantly cut down both storage space and transmission overhead. 
Concerning security issues of client-aided data de-duplication, cloud servers are supposed to be honest, but also curious, which may interest in the privacy outsourced by users. Therefore, clients are apt to upload their data in the form of cipher-texts. 

There are three main objectives of the project. They are: 

•	To refrain the client from uploading reduplicative files.
•	To overcome the security problems that are faced in convergence encryption system.
•	To alleviate the conflicts between functionality and security, the system and security models are defined.


![image](https://user-images.githubusercontent.com/57436714/123446854-eb393c80-d5f6-11eb-8574-0684365dbb11.png)


The proposed application consists of three entities – client, key server and cloud server.The reason behind introducing a key server is to make sure that nothing about the user’s plaintext can be learned from uploaded information.

Modules:
The three modules in the application which are client, key server and cloud server perform various activities which are defined as the following:

1.	Client:The client can perform four operations -login, file upload, file download and logout. The client logs into the system by providing the username and password if account exists already. Otherwise, the client can register and then login. The client selects a file for uploading after which they compute the hash value of it using the Secure Hash Algorithm – 256 (SHA-256). This hash value is sent to the cloud server which checks for duplication. If there is no duplication, the client requests the key server for Convergent Key (CK). After receiving CK along with label, the client can encrypt the file using the AES algorithm and upload it to the cloud. If there is duplication, client proves ownership. After ownership is verified, client can decrypt the files using the CK and download them and logout of the system.

2.	Key Server:The key server performs three functions – login, handling key requests and logout. The key requests from the client along with the hash code will be forwarded to the key server. These requests can be viewed by the key server in the key request tab after logging in by providing credentials i.e., username and password. The key server which is responsible for generating the CK, does so by signing the hash value it receives from the client using the blind signature. In order to sign the hash code, key server takes the hash code and a random 6-digit integer, converts the hash code into bytes and generates the secret key using Hashed Message Authentication Code SHA-1 algorithm (HMAC-SHA1). Throughout the process the content in the file is not revealed.Then, it sends the CK and the file label to the user. The CK is the one finally used for encryption process.

3.	Cloud Server:The cloud server acts as an agency to conserve user’s data. It is responsible for checking duplication and verifying the ownership of the file using the PoW protocol. When the client tries to upload a file after generating hash code, the cloud server immediately checks if an entry with the same hash code is present in the server. If so, it prevents the client from uploading the file and directs the client for proof of ownership.While verifying the ownership, the client enters a challenge value. The cloud server logs into the system using the credentials and if it finds that the challenge value provided by the client matches the challenge value in the server, it verifies the client as the owner of the file. The client can then proceed with file decryption and download. Moreover, the cloud server is also responsible for saving the file labels in encrypted format for retrieval and access control. 

Amazon Web Services (AWS) has been used for the accessibility of the application in multiple devices. This procedure is implemented by deploying the project into AWS where Amazon Relational Database Services (RDS) for Database and Elastic Beanstalk for deploying are used.
RDS:This service enables database creation for storing the application data andconnecting MySQL database from the application.
Elastic Beanstalk: AWS Elastic Beanstalk is an easy-to-use service for deploying and scaling web applications and services developed with Java and servers such as Apache Tomcat.
From successful implementation of AWS, user will be provided with aUniform Resource Locator (URL) as the output.
URL:http://securede-duplication-env.eba-rtyiaami.us-east-2.elasticbeanstalk.com/

