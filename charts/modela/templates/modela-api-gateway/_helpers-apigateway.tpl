{{/*
modela-apiGateway fullname
*/}}
{{- define "modela.apigatewayFullname" -}}
 modela-apigateway
{{- end }}

{{/*
modela-apiGateway common labels
*/}}
{{- define "modela.apigatewayLabels" -}}
{{ include "modela.labels" . }}
app.kubernetes.io/component: modela-apigateway
{{- end }}

{{/*
modela-apiGateway selector labels
*/}}
{{- define "modela.apigatewaySelectorLabels" -}}
{{ include "modela.selectorLabels" . }}
app.kubernetes.io/component: modela-apigateway
{{- end }}

{{/*
modela-apigateway image
*/}}
{{- define "modela.apigatewayImage" -}}
modela-apigateway
{{- end }}

{{/*
modela-apigateway priority class name
*/}}
{{- define "modela.apigatewayPriorityClassName" -}}
{{- $pcn := coalesce .Values.global.priorityClassName .Values.apigateway.priorityClassName -}}
{{- if $pcn }}
priorityClassName: {{ $pcn }}
{{- end }}
{{- end }}