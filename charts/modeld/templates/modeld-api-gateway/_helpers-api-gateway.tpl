{{/*
modeld-apiGateway fullname
*/}}
{{- define "modeld.apiGatewayFullname" -}}
{{ include "modeld.fullname" . }}-apiGateway
{{- end }}

{{/*
modeld-apiGateway common labels
*/}}
{{- define "modeld.apiGatewayLabels" -}}
{{ include "modeld.labels" . }}
app.kubernetes.io/component: modeld-apiGateway
{{- end }}

{{/*
modeld-apiGateway selector labels
*/}}
{{- define "modeld.apiGatewaySelectorLabels" -}}
{{ include "modeld.selectorLabels" . }}
app.kubernetes.io/component: modeld-apiGateway
{{- end }}

{{/*
modeld-apiGateway image
*/}}
{{- define "modeld.apiGatewayImage" -}}
{{- $dict := dict "modeld" .Values.modeld.image "service" .Values.apiGateway.image "global" .Values.global.image "defaultVersion" .Chart.AppVersion -}}
{{- include "modeld.modeldImage" $dict -}}
{{- end }}

{{/*
modeld-apiGateway priority class name
*/}}
{{- define "modeld.apiGatewayPriorityClassName" -}}
{{- $pcn := coalesce .Values.global.priorityClassName .Values.apiGateway.priorityClassName -}}
{{- if $pcn }}
priorityClassName: {{ $pcn }}
{{- end }}
{{- end }}