# Graphite Event Concourse CI Resource

This resource can be used to create Graphite events from a Concourse CI pipeline. These events can be used to create annotations in Grafana so you can graph when deploys happened.

## Source Configuration

* `url`: *Required.* The graphite server URL, e.g.
`http://my-graphite.com`. `/events/` is appended to the end to form the event API endpoint.

## Behavior

### `out`: Create a Graphite event.

#### Parameters

See http://graphite.readthedocs.io/en/latest/events.html#adding-events for more detail on these fields.

* `what`: *Optional.* The event name.

* `tags`: *Optional.* The event tags.

* `data`: *Optional.* The event data.

## Example

``` yaml
resource_types:
  - name: graphite-event
    type: docker-image
    source:
      repository: mm62/graphite-event-resource

resources:
  - name: graphite-event
    type: graphite-event
    source:
      url: http://my-graphite.com

jobs:
  - name: deploy
    plan:
      - put: graphite-event
        params:
          what: <a href="$ATC_EXTERNAL_URL/builds/$BUILD_ID">$BUILD_PIPELINE_NAME / $BUILD_JOB_NAME</a>
          tags: server1
          data: server1 deployed
```
