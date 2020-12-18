{{/*
modeld-dataplane fullname
*/}}
{{- define "modeld.dataplaneFullname" -}}
modeld-dataplane
{{- end }}

{{/*
modeld-dataplane common labels
*/}}
{{- define "modeld.dataplaneLabels" -}}
{{ include "modeld.labels" . }}
app.kubernetes.io/component: modeld-dataplane
{{- end }}

{{/*
modeld-dataplane selector labels
*/}}
{{- define "modeld.dataplaneSelectorLabels" -}}
{{ include "modeld.selectorLabels" . }}
app.kubernetes.io/component: modeld-dataplane
{{- end }}

{{/*
modeld-dataplane image
*/}}
{{- define "modeld.dataplaneImage" -}}
{{- $dict := dict "modeld" .Values.modeld.image "service" .Values.dataplane.image "global" .Values.global.image "defaultVersion" .Chart.AppVersion -}}
modeld-dataplane
{{- end }}

{{/*
modeld-dataplane priority class name
*/}}
{{- define "modeld.dataplanePriorityClassName" -}}
{{- $pcn := coalesce .Values.global.priorityClassName .Values.dataplane.priorityClassName -}}
{{- if $pcn }}
priorityClassName: {{ $pcn }}
{{- end }}
{{- end }}