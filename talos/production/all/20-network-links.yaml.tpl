---
apiVersion: v1alpha1
kind: LinkAliasConfig
name: ethSel0
selector:
  match: glob("{{ .Node.Data.macAddr }}", mac(link.hardware_addr))
---
apiVersion: v1alpha1
kind: BondConfig
name: bond0
links:
  - ethSel0
bondMode: active-backup
mtu: {{ .Node.Data.mtu }}
---
apiVersion: v1alpha1
kind: VLANConfig
name: bond0.20
parent: bond0
vlanID: 20
mtu: {{ .Node.Data.mtu }}
addresses:
  - address: "{{ .Node.IP }}/24"
routes:
  - gateway: "192.168.20.1"
{{- if eq .Node.Role "control-plane" }}
---
apiVersion: v1alpha1
kind: Layer2VIPConfig
link: bond0.20
name: "192.168.20.20"
{{- end }}