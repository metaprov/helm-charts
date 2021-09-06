{{/*
modela-controlplane fullname
*/}}
{{- define "modela.controlplaneFullname" -}}
modela-controlplane
{{- end }}

{{/*
modela-controlplane common labels
*/}}
{{- define "modela.controlplaneLabels" -}}
{{ include "modela.labels" . }}
app.kubernetes.io/component: modela-controlplane
{{- end }}

{{/*
modela-controlplane selector labels
*/}}
{{- define "modela.controlplaneSelectorLabels" -}}
{{ include "modela.selectorLabels" . }}
app.kubernetes.io/component: modela-controlplane
{{- end }}

{{/*
modela-controlplane image
*/}}
{{- define "modela.controlplaneImage" -}}
modela-controlplane
{{- end }}

{{/*
modela-controlplane priority class name
*/}}
{{- define "modela.controlplanePriorityClassName" -}}
{{- $pcn := coalesce .Values.global.priorityClassName .Values.controlplane.priorityClassName -}}
{{- if $pcn }}
priorityClassName: {{ $pcn }}
{{- end }}
{{- end }}