node {

  stage ('checkout'){
           git branch: 'main', credentialsId: 'gitcredentials', url: 'https://github.com/Anusha0503/docker-1.git'
 
         }

   stage ('build'){ 
        withMaven(globalMavenSettingsConfig: '', jdk: 'java', maven: 'maven', mavenSettingsConfig: '', traceability: true) {
        sh 'mvn clean package'
                  }
              }
   stage ('docker build image') {
        sh " pwd "
        sh " ls "
        sh " docker build  -t dockersampleimage ."
        
                       }
     
     stage ('docker tag&Push image'){

               sh " docker login -u mydocker1405 -p Password@123  "
               sh "docker tag dockersampleimage:latest mydocker1405/springboot1:$BUILD_NUMBER "
               sh " docker push mydocker1405/springboot1:$BUILD_NUMBER "
               sh "docker pull mydocker1405/springboot1:6"
     }
    
          
        
      stage ('deploy'){
          def dockerRun = "docker run -d -p 8043:8000 mydocker1405/springboot1:v1"
          sshagent(['webserver1id']) {

            sh" ssh -o StrictHostKeyChecking=no ubuntu@54.167.220.76 ${dockerRun} "
            }
      }
} 
   
  






