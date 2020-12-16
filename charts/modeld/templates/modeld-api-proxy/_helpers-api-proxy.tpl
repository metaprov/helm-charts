{{/*
modeld-apiProxy fullname
*/}}
{{- define "modeld.apiProxyFullname" -}}
{{ include "modeld.fullname" . }}-query-apiProxy
{{- end }}

{{/*
modeld-apiProxy common labels
*/}}
{{- define "modeld.apiProxyLabels" -}}
{{ include "modeld.labels" . }}
app.kubernetes.io/component: modeld-apiProxy
{{- end }}

{{/*
modeld-apiProxy selector labels
*/}}
{{- define "modeld.apiProxySelectorLabels" -}}
{{ include "modeld.selectorLabels" . }}
app.kubernetes.io/component: modeld-apiProxy
{{- end }}

{{/*
modeld-apiProxy image
*/}}
{{- define "modeld.apiProxyImage" -}}
{{- $dict := dict "modeld" .Values.modeld.image "service" .Values.apiProxy.image "global" .Values.global.image "defaultVersion" .Chart.AppVersion -}}
{{- include "modeld.modeldImage" $dict -}}
{{- end }}

{{/*
modeld-apiProxy priority class name
*/}}
{{- define "modeld.apiProxyPriorityClassName" -}}
{{- $pcn := coalesce .Values.global.priorityClassName .Values.apiProxy.priorityClassName -}}
{{- if $pcn }}
priorityClassName: {{ $pcn }}
{{- end }}
{{- end }}