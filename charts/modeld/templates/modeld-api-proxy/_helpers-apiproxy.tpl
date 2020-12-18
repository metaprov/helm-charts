{{/*
modeld-apiproxy fullname
*/}}
{{- define "modeld.apiproxyFullname" -}}
modeld-apiproxy
{{- end }}

{{/*
modeld-apiproxy common labels
*/}}
{{- define "modeld.apiproxyLabels" -}}
{{ include "modeld.labels" . }}
app.kubernetes.io/component: modeld-apiproxy
{{- end }}

{{/*
modeld-apiproxy selector labels
*/}}
{{- define "modeld.apiproxySelectorLabels" -}}
{{ include "modeld.selectorLabels" . }}
app.kubernetes.io/component: modeld-apiproxy
{{- end }}

{{/*
modeld-apiproxy image
*/}}
{{- define "modeld.apiproxyImage" -}}
modeld-api-proxy
{{- end }}

{{/*
modeld-apiproxy priority class name
*/}}
{{- define "modeld.apiproxyPriorityClassName" -}}
{{- $pcn := coalesce .Values.global.priorityClassName .Values.apiproxy.priorityClassName -}}
{{- if $pcn }}
priorityClassName: {{ $pcn }}
{{- end }}
{{- end }}