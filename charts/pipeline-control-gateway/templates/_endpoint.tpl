{{- /*
A helper to return the NR endpoint to send data to
*/ -}}
{{- define "nrKubernetesOtel.endpoint" -}}
{{- if include "newrelic.common.nrStaging" . -}}
    "https://staging-otlp.nr-data.net"
{{- else -}}
    {{- if hasPrefix "eu" (include "newrelic.common.license._licenseKey" . ) -}}
        "https://otlp.eu01.nr-data.net"
    {{- else -}}
        "https://otlp.nr-data.net"
    {{- end -}}
{{- end -}}
{{- end -}}


{{- /*
A helper to return the NR GRPC endpoint to send data to
*/ -}}
{{- define "nrKubernetesOtel.grpc.endpoint" -}}
{{- if include "newrelic.common.nrStaging" . -}}
    "staging-otlp.nr-data.net:443"
{{- else -}}
    {{- if hasPrefix "eu" (include "newrelic.common.license._licenseKey" . ) -}}
        "otlp.eu01.nr-data.net:443"
    {{- else -}}
        "otlp.nr-data.net:443"
    {{- end -}}
{{- end -}}
{{- end -}}