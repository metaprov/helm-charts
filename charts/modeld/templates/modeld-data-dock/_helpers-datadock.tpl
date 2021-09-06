{{/*
modela-datadock fullname
*/}}
{{- define "modela.datadockFullname" -}}
modela-datadock
{{- end }}

{{/*
modela-datadock common labels
*/}}
{{- define "modela.datadockLabels" -}}
{{ include "modela.labels" . }}
app.kubernetes.io/component: modela-datadock
{{- end }}

{{/*
modela-datadock selector labels
*/}}
{{- define "modela.datadockSelectorLabels" -}}
{{ include "modela.selectorLabels" . }}
app.kubernetes.io/component: modela-datadock
{{- end }}

{{/*
modela-datadock image
*/}}
{{- define "modela.datadockImage" -}}
{{- $dict := dict "modela" .Values.modela.image "service" .Values.datadock.image "global" .Values.global.image "defaultVersion" .Chart.AppVersion -}}
modela-datadock
{{- end }}

{{/*
modela-datadock priority class name
*/}}
{{- define "modela.datadockPriorityClassName" -}}
{{- $pcn := coalesce .Values.global.priorityClassName .Values.datadock.priorityClassName -}}
{{- if $pcn }}
priorityClassName: {{ $pcn }}
{{- end }}
{{- end }}