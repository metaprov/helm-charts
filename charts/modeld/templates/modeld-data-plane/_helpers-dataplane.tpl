{{/*
modela-dataplane fullname
*/}}
{{- define "modela.dataplaneFullname" -}}
modela-dataplane
{{- end }}

{{/*
modela-dataplane common labels
*/}}
{{- define "modela.dataplaneLabels" -}}
{{ include "modela.labels" . }}
app.kubernetes.io/component: modela-dataplane
{{- end }}

{{/*
modela-dataplane selector labels
*/}}
{{- define "modela.dataplaneSelectorLabels" -}}
{{ include "modela.selectorLabels" . }}
app.kubernetes.io/component: modela-dataplane
{{- end }}

{{/*
modela-dataplane image
*/}}
{{- define "modela.dataplaneImage" -}}
{{- $dict := dict "modela" .Values.modela.image "service" .Values.dataplane.image "global" .Values.global.image "defaultVersion" .Chart.AppVersion -}}
modela-dataplane
{{- end }}

{{/*
modela-dataplane priority class name
*/}}
{{- define "modela.dataplanePriorityClassName" -}}
{{- $pcn := coalesce .Values.global.priorityClassName .Values.dataplane.priorityClassName -}}
{{- if $pcn }}
priorityClassName: {{ $pcn }}
{{- end }}
{{- end }}