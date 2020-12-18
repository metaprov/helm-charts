{{/*
modeld-frontend fullname
*/}}
{{- define "modeld.frontendFullname" -}}
modeld-frontend
{{- end }}

{{/*
modeld-frontend common labels
*/}}
{{- define "modeld.frontendLabels" -}}
{{ include "modeld.labels" . }}
app.kubernetes.io/component: modeld-frontend
{{- end }}

{{/*
modeld-frontend selector labels
*/}}
{{- define "modeld.frontendSelectorLabels" -}}
{{ include "modeld.selectorLabels" . }}
app.kubernetes.io/component: modeld-frontend
{{- end }}

{{/*
modeld-frontend image
*/}}
{{- define "modeld.frontendImage" -}}
{{- $dict := dict "modeld" .Values.modeld.image "service" .Values.frontend.image "global" .Values.global.image "defaultVersion" .Chart.AppVersion -}}
modeld-frontend
{{- end }}

{{/*
modeld-frontend priority class name
*/}}
{{- define "modeld.frontendPriorityClassName" -}}
{{- $pcn := coalesce .Values.global.priorityClassName .Values.frontend.priorityClassName -}}
{{- if $pcn }}
priorityClassName: {{ $pcn }}
{{- end }}
{{- end }}