{{/*
Expand the name of the chart.
*/}}
{{- define "modela.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "modela.fullname" -}}
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
{{- define "modela.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "modela.labels" -}}
helm.sh/chart: {{ include "modela.chart" . }}
{{ include "modela.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "modela.selectorLabels" -}}
app.kubernetes.io/name: {{ include "modela.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Docker image name for modela
*/}}
{{- define "modela.modelaImage" -}}
{{- $registry := coalesce .global.registry .service.registry .modela.registry -}}
{{- $repository := coalesce .service.repository .modela.repository -}}
{{- $tag := coalesce .service.tag .modela.tag .defaultVersion | toString -}}
{{- printf "%s/%s:%s" $registry $repository $tag -}}
{{- end -}}

{{/*
Docker image name
*/}}
{{- define "modela.image" -}}
{{- $registry := coalesce .global.registry .service.registry -}}
{{- $tag := .service.tag | toString -}}
{{- printf "%s/%s:%s" $registry .service.repository (.service.tag | toString) -}}
{{- end -}}


{{/*
modela-cloud image
*/}}
{{- define "modela.cloudImage" -}}
modela-clouds
{{- end }}

