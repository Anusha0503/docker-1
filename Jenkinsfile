node {
        def REPOSITORY = params.REPOSITORY
        def APPLICATION = params.APPLICATION
        def PORT = params.PORT
      
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
               sh "docker tag dockersampleimage:latest $REPOSITORY/$APPLICATION:$BUILD_NUMBER "
               sh " docker push $REPOSITORY/$APPLICATION:$BUILD_NUMBER "
               sh "docker pull $REPOSITORY/$APPLICATION:$BUILD_NUMBER"
     }
    
          
        
      stage ('deploy'){
          def dockerRun = "docker run -d -p $PORT:8000 mydocker1405/springboot1:v1"
          sshagent(['webserver1id']) {

            sh" ssh -o StrictHostKeyChecking=no ubuntu@54.167.220.76 ${dockerRun} "
            }
      }
} 
   
  






