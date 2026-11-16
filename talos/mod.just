set quiet
set shell := ['bash', '-euo', 'pipefail', '-c']
set script-interpreter := ['bash', '-euo', 'pipefail']
set default-list
set default-script

[doc('Commands for the Production cluster')]
[group('Clusters')]
mod? production "production"

[doc('Commands for the Testing cluster')]
[group('Clusters')]
mod? testing "testing"