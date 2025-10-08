# from init
export REBUILD=${REBUILD-true}
export SKIP_CHECKS=${SKIP_CHECKS-true}

CI_TYPE=${CI_TYPE:-jenkins}

# from buildah-rhtap
TAG=$(git rev-parse HEAD)
export IMAGE_URL=${IMAGE_URL-quay.io/redhat-tssc/task-runner:1.7:$CI_TYPE-$TAG}
export IMAGE=${IMAGE-$IMAGE_URL}

export DOCKERFILE=${DOCKERFILE-}
export CONTEXT=${CONTEXT-}
export TLSVERIFY=${TLSVERIFY-true}
export BUILD_ARGS=${BUILD_ARGS-""}
export BUILD_ARGS_FILE=${BUILD_ARGS_FILE-""}

# from ACS_*.*
export DISABLE_ACS=${DISABLE_ACS-false}
# Optionally set ROX_CENTRAL_ENDPOINT here instead of configuring a Jenkins secret
export ROX_CENTRAL_ENDPOINT="central-rhacs-operator.apps.rosa.rhtap-services.xmdt.p3.openshiftapps.com:443"
export INSECURE_SKIP_TLS_VERIFY=${INSECURE_SKIP_TLS_VERIFY-true}

# for gitops, if acs scans are set, we still may not want that repo 
# to be updates so include an option to disable

export DISABLE_GITOPS_UPDATE=${DISABLE_GITOPS_UPDATE-false}
export GITOPS_REPO_URL=https://github.com/xjiangorg/python-offnqfzt-gitops

export PARAM_IMAGE=${PARAM_IMAGE-$IMAGE}
# Recompute this every time, otherwise it will be set BEFORE the file exists
# and be stuck at latest
export PARAM_IMAGE_DIGEST=$(cat "$BASE_RESULTS/buildah-rhtap/IMAGE_DIGEST" 2>/dev/null || echo "latest")

# From Summary
export SOURCE_BUILD_RESULT_FILE=${SOURCE_BUILD_RESULT_FILE-""}

# gather images params
export IMAGE_REGISTRY_USER="xinjiang"
export COSIGN_PUBLIC_KEY="LS0tLS1CRUdJTiBQVUJMSUMgS0VZLS0tLS0KTUZrd0V3WUhLb1pJemowQ0FRWUlLb1pJemowREFRY0RRZ0FFMzlvSFV2REljbWFZQ3kxeVY0TGloUFVwL25mRgo2ckpUT3RrVWF4dXJYY2dsR0JndXlpTjVUTEp1QkptL2Vua3JMOWJzVTVaUHVKQTdTakRLcFJmTUlRPT0KLS0tLS1FTkQgUFVCTElDIEtFWS0tLS0tCg=="

export TARGET_BRANCH=${TARGET_BRANCH-""}
# enterprise contract
export POLICY_CONFIGURATION=${POLICY_CONFIGURATION-"github.com/conforma/config//rhtap-v0.6"}
#internal, assumes jenkins is local openshift
export REKOR_HOST=${REKOR_HOST-https://rekor-server-tssc-tas.apps.rosa.xjiang0925419.tz6b.p3.openshiftapps.com}
export IGNORE_REKOR=${IGNORE_REKOR-false}
export INFO=${INFO-true}
export STRICT=${STRICT-true}
export EFFECTIVE_TIME=${EFFECTIVE_TIME-now}
export HOMEDIR=${HOMEDIR-$(pwd)}
export TUF_MIRROR=${TUF_MIRROR-https://tuf-tssc-tas.apps.rosa.xjiang0925419.tz6b.p3.openshiftapps.com}

export CUSTOM_ROOT_CA=${CUSTOM_ROOT_CA-""}

# Allow PR to succeed even if TAS vars not configured
export FAIL_IF_TRUSTIFICATION_NOT_CONFIGURED=false

export SBOMS_DIR=results/sboms