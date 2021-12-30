local ddb = import 'ddb.docker.libjsonnet';

ddb.Compose({
	"services": {
		"runner": ddb.Image("gitlab/gitlab-runner:alpine")
		    + ddb.Binary("gitlab-runner")
		    + {
		        volumes:[
		            ddb.path.project + '/config:/etc/gitlab-runner',
		            "/var/run/docker.sock:/var/run/docker.sock"
		        ]
            },
    }
})
