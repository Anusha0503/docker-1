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
     stage ('deploy'){
       sh " docker run -d -p 8065:8000 dockersampleimage  "
     }
   }

  
   
  





}
