{{/*
modeld-controlplane fullname
*/}}
{{- define "modeld.controlplaneFullname" -}}
{{ include "modeld.fullname" . }}-controlplane
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
{{- $dict := dict "modeld" .Values.modeld.image "service" .Values.controlplane.image "global" .Values.global.image "defaultVersion" .Chart.AppVersion -}}
{{- include "modeld.modeldImage" $dict -}}
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