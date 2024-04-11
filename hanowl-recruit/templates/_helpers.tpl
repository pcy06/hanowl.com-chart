{{/*
Common labels
*/}}
{{- define "hanowl-recruit.labels" -}}
helm.sh/chart: {{ .Chart.Name }}
{{ include "hanowl-recruit.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "hanowl-recruit.selectorLabels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


{{- define "hanowl-recruit.ingress.annotations" -}}
{{- range $key, $value := .Values.ingress.annotations }}
{{ $key }}: {{ $value }}
{{- end }}
{{- if .Values.ingress.tls.enabled }}
cert-manager.io/issuer: {{ .Values.ingress.tls.certManagerIssuer }}
{{- end }}
{{- end }}