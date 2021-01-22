{{/*
modeld-controlplane fullname
*/}}
{{- define "modeld.controlplaneFullname" -}}
modeld-controlplane
{{- end }}

{{/*
modeld-controlplane common labels
*/}}
{{- define "modeld.controlplaneLabels" -}}
{{ include "modeld.labels" . }}
app.kubernetes.io/component: modeld-controlplane
{{- end }}

{{/*
modeld-controlplane selector labels
*/}}
{{- define "modeld.controlplaneSelectorLabels" -}}
{{ include "modeld.selectorLabels" . }}
app.kubernetes.io/component: modeld-controlplane
{{- end }}

{{/*
modeld-controlplane image
*/}}
{{- define "modeld.controlplaneImage" -}}
modeld-controlplane
{{- end }}

{{/*
modeld-controlplane priority class name
*/}}
{{- define "modeld.controlplanePriorityClassName" -}}
{{- $pcn := coalesce .Values.global.priorityClassName .Values.controlplane.priorityClassName -}}
{{- if $pcn }}
priorityClassName: {{ $pcn }}
{{- end }}
{{- end }}