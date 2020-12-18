{{/*
Expand the name of the chart.
*/}}
{{- define "modeld.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "modeld.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "modeld.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "modeld.labels" -}}
helm.sh/chart: {{ include "modeld.chart" . }}
{{ include "modeld.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "modeld.selectorLabels" -}}
app.kubernetes.io/name: {{ include "modeld.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Docker image name for modeld
*/}}
{{- define "modeld.modeldImage" -}}
{{- $registry := coalesce .global.registry .service.registry .modeld.registry -}}
{{- $repository := coalesce .service.repository .modeld.repository -}}
{{- $tag := coalesce .service.tag .modeld.tag .defaultVersion | toString -}}
{{- printf "%s/%s:%s" $registry $repository $tag -}}
{{- end -}}

{{/*
Docker image name
*/}}
{{- define "modeld.image" -}}
{{- $registry := coalesce .global.registry .service.registry -}}
{{- $tag := .service.tag | toString -}}
{{- printf "%s/%s:%s" $registry .service.repository (.service.tag | toString) -}}
{{- end -}}


{{/*
modeld-cloud image
*/}}
{{- define "modeld.cloudImage" -}}
modeld-clouds
{{- end }}

