def MAVEN_HOME
pipeline {
    agent { 
                label 'mac'
            }
    stages {
    
    	stage('Initialize the variables') {
            // Each stage is made up of steps
            steps{
                script{
                    MAVEN_HOME="C:\Tng\apache-maven-3.6.0\bin\mvn"
                }
            }                
        }
        
        stage('Unit Test') {
            agent { 
                label 'mac'
            }
            steps {
                cmd 'C:\Tng\apache-maven-3.6.0\bin\mvn test'
            }
            
        }
        stage('Mutation Test') {
            agent { 
                label 'mac'
            }
            steps {
                cmd 'C:\Tng\apache-maven-3.6.0\bin\mvn org.pitest:pitest-maven:mutationCoverage'
            }
        }
        stage('Checkstyle Analysis') {
            agent { 
                label 'mac'
            }
            steps {
                cmd 'C:\Tng\apache-maven-3.6.0\bin\mvnn checkstyle:checkstyle'
            }
        }
        stage('Code Coverage Analysis') {
            agent { 
                label 'mac'
            }
            steps {
                cmd 'C:\Tng\apache-maven-3.6.0\bin\mvn jacoco:report'
            }
            post {
                always {
                    step([
		              $class           : 'JacocoPublisher',
		              execPattern      : 'target/jacoco.exec',
		              classPattern     : 'target/classes/main',
		              sourcePattern    : 'src/main/java',
		              exclusionPattern : '**/*Test.class'
		          ])
                }
            }
        }
        stage('Sonarqube Analysis') {
            agent { 
                label 'mac'
            }
            steps {
                sh 'C:\Tng\apache-maven-3.6.0\bin\mvn sonar:sonar -Dsonar.host.url=http://localhost:8080'
            }
        }
        
    }
}