{{/*
modeld-apiGateway fullname
*/}}
{{- define "modeld.apigatewayFullname" -}}
 modeld-apigateway
{{- end }}

{{/*
modeld-apiGateway common labels
*/}}
{{- define "modeld.apigatewayLabels" -}}
{{ include "modeld.labels" . }}
app.kubernetes.io/component: modeld-apigateway
{{- end }}

{{/*
modeld-apiGateway selector labels
*/}}
{{- define "modeld.apigatewaySelectorLabels" -}}
{{ include "modeld.selectorLabels" . }}
app.kubernetes.io/component: modeld-apigateway
{{- end }}

{{/*
modeld-apigateway image
*/}}
{{- define "modeld.apigatewayImage" -}}
modeld-apigateway
{{- end }}

{{/*
modeld-apigateway priority class name
*/}}
{{- define "modeld.apigatewayPriorityClassName" -}}
{{- $pcn := coalesce .Values.global.priorityClassName .Values.apigateway.priorityClassName -}}
{{- if $pcn }}
priorityClassName: {{ $pcn }}
{{- end }}
{{- end }}