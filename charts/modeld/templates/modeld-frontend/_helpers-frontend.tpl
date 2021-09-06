{{/*
modela-frontend fullname
*/}}
{{- define "modela.frontendFullname" -}}
modela-frontend
{{- end }}

{{/*
modela-frontend common labels
*/}}
{{- define "modela.frontendLabels" -}}
{{ include "modela.labels" . }}
app.kubernetes.io/component: modela-frontend
{{- end }}

{{/*
modela-frontend selector labels
*/}}
{{- define "modela.frontendSelectorLabels" -}}
{{ include "modela.selectorLabels" . }}
app.kubernetes.io/component: modela-frontend
{{- end }}

{{/*
modela-frontend image
*/}}
{{- define "modela.frontendImage" -}}
{{- $dict := dict "modela" .Values.modela.image "service" .Values.frontend.image "global" .Values.global.image "defaultVersion" .Chart.AppVersion -}}
modela-frontend
{{- end }}

{{/*
modela-frontend priority class name
*/}}
{{- define "modela.frontendPriorityClassName" -}}
{{- $pcn := coalesce .Values.global.priorityClassName .Values.frontend.priorityClassName -}}
{{- if $pcn }}
priorityClassName: {{ $pcn }}
{{- end }}
{{- end }}