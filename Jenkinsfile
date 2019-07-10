stage('Build') {
 node {
    build 'pipeline-jenkins-example'
    }
  }
stage ('Test') {
   node {
	build 'rf-govph-v2-branch'
   }
  }
