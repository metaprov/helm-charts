{{/*
modeld-datadock fullname
*/}}
{{- define "modeld.datadockFullname" -}}
modeld-datadock
{{- end }}

{{/*
modeld-datadock common labels
*/}}
{{- define "modeld.datadockLabels" -}}
{{ include "modeld.labels" . }}
app.kubernetes.io/component: modeld-datadock
{{- end }}

{{/*
modeld-datadock selector labels
*/}}
{{- define "modeld.datadockSelectorLabels" -}}
{{ include "modeld.selectorLabels" . }}
app.kubernetes.io/component: modeld-datadock
{{- end }}

{{/*
modeld-datadock image
*/}}
{{- define "modeld.datadockImage" -}}
{{- $dict := dict "modeld" .Values.modeld.image "service" .Values.datadock.image "global" .Values.global.image "defaultVersion" .Chart.AppVersion -}}
modeld-datadock
{{- end }}

{{/*
modeld-datadock priority class name
*/}}
{{- define "modeld.datadockPriorityClassName" -}}
{{- $pcn := coalesce .Values.global.priorityClassName .Values.datadock.priorityClassName -}}
{{- if $pcn }}
priorityClassName: {{ $pcn }}
{{- end }}
{{- end }}