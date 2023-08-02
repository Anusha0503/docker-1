node {

  stage ('checkout'){
           git branch: 'main', credentialsId: 'git_creds', url: 'https://github.com/kunchamrajkumar/spring-boot-docker-basic.git'
 
         }

   stage ('build'){ 
        withMaven(globalMavenSettingsConfig: '', jdk: 'java', maven: 'maven', mavenSettingsConfig: '', traceability: true) {
    sh 'mvn clean package'
           }
   stage ('docker build image') {
        sh " pwd "
        sh " ls "
        sh " docker build -t dockersampleimage ."
        
  }
     stage ('deploy'){
       sh " docker run -d -p 8085:8000 dockersampleimage  "
     }
   }

  
   
  





}
