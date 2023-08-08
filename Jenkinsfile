node {
        def REPOSITORY = params.REPOSITORY
        def IMAGE_NAME = params.IMAGE_NAME
        def PORT = params.PORT
        def USER_NAME = params.USER_NAME
        def PASSWORD = params.PASSWORD
      
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

               sh " docker login -u $USER_NAME -p $PASSWORD valuemomentum.jfrog.io "
               sh "docker tag dockersampleimage:latest $REPOSITORY/$IMAGE_NAME:$BUILD_NUMBER "
               sh " docker push $REPOSITORY/$IMAGE_NAME:$BUILD_NUMBER "
               sh "docker pull $REPOSITORY/$IMAGE_NAME:$BUILD_NUMBER"
     }
    
          
        
      stage ('deploy'){
              def dockerRun = "docker run -d -p $PORT:8000 $REPOSITORY/$IMAGE_NAME:$BUILD_NUMBER"
              sh " docker logout"
             sh " docker login -u $USER_NAME -p $PASSWORD valuemomentum.jfrog.io "
             sshagent(['webserver1id']) {
                sh" ssh -o StrictHostKeyChecking=no ubuntu@54.167.220.76 ${dockerRun} "
            }
      }
} 
   
  






