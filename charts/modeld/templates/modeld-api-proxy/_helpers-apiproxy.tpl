{{/*
modela-apiproxy fullname
*/}}
{{- define "modela.apiproxyFullname" -}}
modela-apiproxy
{{- end }}

{{/*
modela-apiproxy common labels
*/}}
{{- define "modela.apiproxyLabels" -}}
{{ include "modela.labels" . }}
app.kubernetes.io/component: modela-apiproxy
{{- end }}

{{/*
modela-apiproxy selector labels
*/}}
{{- define "modela.apiproxySelectorLabels" -}}
{{ include "modela.selectorLabels" . }}
app.kubernetes.io/component: modela-apiproxy
{{- end }}

{{/*
modela-apiproxy image
*/}}
{{- define "modela.apiproxyImage" -}}
modela-api-proxy
{{- end }}

{{/*
modela-apiproxy priority class name
*/}}
{{- define "modela.apiproxyPriorityClassName" -}}
{{- $pcn := coalesce .Values.global.priorityClassName .Values.apiproxy.priorityClassName -}}
{{- if $pcn }}
priorityClassName: {{ $pcn }}
{{- end }}
{{- end }}