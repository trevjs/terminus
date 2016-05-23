Feature: Clearing a site's cache
  In order to keep my site running smoothly and see new changes
  As a user
  I need to be able to clear my site's cache.

  Background: I am authenticated and I have a site named [[test_site_name]]
    Given I am authenticated
    And a site named "[[test_site_name]]"

  @vcr site_clear-cache
  Scenario: Clear the dev environment's cache
    When I run "terminus site clear-cache --site=[[test_site_name]] --env=dev"
    Then I should get "."
    Then I should get:
    """
    Clearing caches for "dev"
    """

  @vcr site_clear-cache_framework-and-varnish
  Scenario: Clear the dev environment's cache, its framework cache, and its Varnish cache
    When I run "terminus site clear-cache --site=[[test_site_name]] --env=dev --clear-framework-cache --clear-varnish-cache"
    Then I should get "."
    Then I should get:
    """
    Clearing caches for "dev"
    """
