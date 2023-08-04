node {

  stage ('checkout'){
           git branch: 'main', credentialsId: 'gitcredentials', url: 'https://github.com/Anusha0503/docker-1.git'
 
         }

   stage ('build'){ 
        withMaven(globalMavenSettingsConfig: '', jdk: 'java', maven: 'maven', mavenSettingsConfig: '', traceability: true) {
    sh 'mvn clean package'
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
     }
   }

  
   
  





}
