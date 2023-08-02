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
        sh " docker build -t dockersampleimage -f folder1/Dockerfile  "
        
  }
     stage ('deploy'){
       sh " docker run -d -p 8085:8000 dockersampleimage  "
     }
   }

  
   
  





}
