# frozen_string_literal: true

require_relative "environment"
require_relative "types_export"
require_relative "requests"
require_relative "tmdb_ryanstep/types/auth_create_request_token_response"
require_relative "tmdb_ryanstep/types/auth_create_access_token_response"
require_relative "tmdb_ryanstep/types/auth_logout_response"
require_relative "tmdb_ryanstep/types/list_details_response"
require_relative "tmdb_ryanstep/types/list_update_response"
require_relative "tmdb_ryanstep/types/list_create_response"
require_relative "tmdb_ryanstep/types/list_clear_response"
require_relative "tmdb_ryanstep/types/list_delete_response"
require_relative "tmdb_ryanstep/types/list_add_items_response"
require_relative "tmdb_ryanstep/types/list_update_items_response"
require_relative "tmdb_ryanstep/types/list_remove_items_response"
require_relative "tmdb_ryanstep/types/list_item_status_request_media_type"
require_relative "tmdb_ryanstep/types/list_item_status_response"
require_relative "tmdb_ryanstep/types/account_lists_response"
require_relative "tmdb_ryanstep/types/account_favorite_movies_request_sort_by"
require_relative "tmdb_ryanstep/types/account_favorite_movies_response"
require_relative "tmdb_ryanstep/types/account_favorite_tv_request_sort_by"
require_relative "tmdb_ryanstep/types/account_favorite_tv_response"
require_relative "tmdb_ryanstep/types/account_tv_recommendations_response"
require_relative "tmdb_ryanstep/types/account_movie_recommendations_response"
require_relative "tmdb_ryanstep/types/account_movie_watchlist_request_sort_by"
require_relative "tmdb_ryanstep/types/account_movie_watchlist_response"
require_relative "tmdb_ryanstep/types/account_tv_watchlist_request_sort_by"
require_relative "tmdb_ryanstep/types/account_tv_watchlist_response"
require_relative "tmdb_ryanstep/types/account_rated_movies_request_sort_by"
require_relative "tmdb_ryanstep/types/account_rated_movies_response"
require_relative "tmdb_ryanstep/types/account_rated_tv_request_sort_by"
require_relative "tmdb_ryanstep/types/account_rated_tv_response"

module TmdbApiClient
  class Client
    # @param base_url [String]
    # @param environment [TmdbApiClient::Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param api_key [String]
    # @return [TmdbApiClient::Client]
    def initialize(api_key:, base_url: nil, environment: TmdbApiClient::Environment::PRODUCTION, max_retries: nil,
                   timeout_in_seconds: nil)
      @request_client = TmdbApiClient::RequestClient.new(
        base_url: base_url,
        environment: environment,
        max_retries: max_retries,
        timeout_in_seconds: timeout_in_seconds,
        api_key: api_key
      )
    end

    #
    # @param raw_body [String]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::AuthCreateRequestTokenResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.auth_create_request_token(raw_body: "RAW_BODY")
    def auth_create_request_token(raw_body:, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request_options&.additional_body_parameters || {}), RAW_BODY: raw_body }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/4/auth/request_token"
      end
      TmdbApiClient::AuthCreateRequestTokenResponse.from_json(json_object: response.body)
    end

    #
    # @param raw_body [String]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::AuthCreateAccessTokenResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.auth_create_access_token(raw_body: "RAW_BODY")
    def auth_create_access_token(raw_body:, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request_options&.additional_body_parameters || {}), RAW_BODY: raw_body }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/4/auth/access_token"
      end
      TmdbApiClient::AuthCreateAccessTokenResponse.from_json(json_object: response.body)
    end

    # Log out of a session.
    #
    # @param raw_body [String]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::AuthLogoutResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.auth_logout(raw_body: "RAW_BODY")
    def auth_logout(raw_body:, request_options: nil)
      response = @request_client.conn.delete do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request_options&.additional_body_parameters || {}), RAW_BODY: raw_body }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/4/auth/access_token"
      end
      TmdbApiClient::AuthLogoutResponse.from_json(json_object: response.body)
    end

    # Retrieve a list by id.
    #
    # @param list_id [Integer]
    # @param language [String]
    # @param page [Integer]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::ListDetailsResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.list_details(list_id: 1)
    def list_details(list_id:, language: nil, page: nil, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "language": language,
          "page": page
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/4/list/#{list_id}"
      end
      TmdbApiClient::ListDetailsResponse.from_json(json_object: response.body)
    end

    # Update the details of a list.
    #
    # @param list_id [Integer]
    # @param raw_body [String]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::ListUpdateResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.list_update(list_id: 1, raw_body: "RAW_BODY")
    def list_update(list_id:, raw_body:, request_options: nil)
      response = @request_client.conn.put do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request_options&.additional_body_parameters || {}), RAW_BODY: raw_body }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/4/list/#{list_id}"
      end
      TmdbApiClient::ListUpdateResponse.from_json(json_object: response.body)
    end

    # Create a new list.
    #
    # @param raw_body [String]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::ListCreateResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.list_create(raw_body: "RAW_BODY")
    def list_create(raw_body:, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request_options&.additional_body_parameters || {}), RAW_BODY: raw_body }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/4/list"
      end
      TmdbApiClient::ListCreateResponse.from_json(json_object: response.body)
    end

    # Clear all of the items on a list.
    #
    # @param list_id [Integer]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::ListClearResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.list_clear(list_id: 1)
    def list_clear(list_id:, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/4/list/#{list_id}/clear"
      end
      TmdbApiClient::ListClearResponse.from_json(json_object: response.body)
    end

    # Delete a list.
    #
    # @param list_id [Integer]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::ListDeleteResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.list_delete(list_id: 1)
    def list_delete(list_id:, request_options: nil)
      response = @request_client.conn.delete do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/4/#{list_id}"
      end
      TmdbApiClient::ListDeleteResponse.from_json(json_object: response.body)
    end

    # Add items to a list.
    #
    # @param list_id [Integer]
    # @param raw_body [String]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::ListAddItemsResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.list_add_items(list_id: 1, raw_body: "RAW_BODY")
    def list_add_items(list_id:, raw_body:, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request_options&.additional_body_parameters || {}), RAW_BODY: raw_body }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/4/list/#{list_id}/items"
      end
      TmdbApiClient::ListAddItemsResponse.from_json(json_object: response.body)
    end

    # Update an individual item on a list
    #
    # @param list_id [String]
    # @param raw_body [String]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::ListUpdateItemsResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.list_update_items(list_id: "list_id", raw_body: "RAW_BODY")
    def list_update_items(list_id:, raw_body:, request_options: nil)
      response = @request_client.conn.put do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request_options&.additional_body_parameters || {}), RAW_BODY: raw_body }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/4/list/#{list_id}/items"
      end
      TmdbApiClient::ListUpdateItemsResponse.from_json(json_object: response.body)
    end

    # Remove items from a list
    #
    # @param list_id [Integer]
    # @param raw_body [String]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::ListRemoveItemsResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.list_remove_items(list_id: 1, raw_body: "RAW_BODY")
    def list_remove_items(list_id:, raw_body:, request_options: nil)
      response = @request_client.conn.delete do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request_options&.additional_body_parameters || {}), RAW_BODY: raw_body }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/4/list/#{list_id}/items"
      end
      TmdbApiClient::ListRemoveItemsResponse.from_json(json_object: response.body)
    end

    # Check if an item is on a list.
    #
    # @param list_id [Integer]
    # @param media_id [Integer]
    # @param media_type [TmdbApiClient::ListItemStatusRequestMediaType]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::ListItemStatusResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.list_item_status(
    #    list_id: 1,
    #    media_id: 1,
    #    media_type: EMPTY
    #  )
    def list_item_status(list_id:, media_id:, media_type:, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "media_id": media_id,
          "media_type": media_type
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/4/list/#{list_id}/item_status"
      end
      TmdbApiClient::ListItemStatusResponse.from_json(json_object: response.body)
    end

    # Get the custom lists that a user has created.
    #
    # @param account_object_id [String]
    # @param page [Integer]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::AccountListsResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.account_lists(account_object_id: "account_object_id")
    def account_lists(account_object_id:, page: nil, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = { **(request_options&.additional_query_parameters || {}), "page": page }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/4/account/#{account_object_id}/lists"
      end
      TmdbApiClient::AccountListsResponse.from_json(json_object: response.body)
    end

    # Get a users list of favourite movies.
    #
    # @param account_object_id [String]
    # @param page [Integer]
    # @param language [String]
    # @param sort_by [TmdbApiClient::AccountFavoriteMoviesRequestSortBy]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::AccountFavoriteMoviesResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.account_favorite_movies(account_object_id: "account_object_id")
    def account_favorite_movies(account_object_id:, page: nil, language: nil, sort_by: nil, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "page": page,
          "language": language,
          "sort_by": sort_by
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/4/account/#{account_object_id}/movie/favorites"
      end
      TmdbApiClient::AccountFavoriteMoviesResponse.from_json(json_object: response.body)
    end

    # Get a users list of favourite TV shows.
    #
    # @param account_object_id [String]
    # @param page [Integer]
    # @param language [String]
    # @param sort_by [TmdbApiClient::AccountFavoriteTvRequestSortBy]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::AccountFavoriteTvResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.account_favorite_tv(account_object_id: "account_object_id")
    def account_favorite_tv(account_object_id:, page: nil, language: nil, sort_by: nil, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "page": page,
          "language": language,
          "sort_by": sort_by
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/4/account/#{account_object_id}/tv/favorites"
      end
      TmdbApiClient::AccountFavoriteTvResponse.from_json(json_object: response.body)
    end

    # Get a users list of recommended TV shows.
    #
    # @param account_object_id [String]
    # @param page [Integer]
    # @param language [String]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::AccountTvRecommendationsResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.account_tv_recommendations(account_object_id: "account_object_id")
    def account_tv_recommendations(account_object_id:, page: nil, language: nil, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "page": page,
          "language": language
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/4/account/#{account_object_id}/tv/recommendations"
      end
      TmdbApiClient::AccountTvRecommendationsResponse.from_json(json_object: response.body)
    end

    # Get a users list of recommended movies.
    #
    # @param account_object_id [String]
    # @param page [Integer]
    # @param language [String]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::AccountMovieRecommendationsResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.account_movie_recommendations(account_object_id: "account_object_id")
    def account_movie_recommendations(account_object_id:, page: nil, language: nil, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "page": page,
          "language": language
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/4/account/#{account_object_id}/movie/recommendations"
      end
      TmdbApiClient::AccountMovieRecommendationsResponse.from_json(json_object: response.body)
    end

    # Get a users movie watchlist.
    #
    # @param account_object_id [String]
    # @param page [Integer]
    # @param language [String]
    # @param sort_by [TmdbApiClient::AccountMovieWatchlistRequestSortBy]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::AccountMovieWatchlistResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.account_movie_watchlist(account_object_id: "account_object_id")
    def account_movie_watchlist(account_object_id:, page: nil, language: nil, sort_by: nil, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "page": page,
          "language": language,
          "sort_by": sort_by
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/4/account/#{account_object_id}/movie/watchlist"
      end
      TmdbApiClient::AccountMovieWatchlistResponse.from_json(json_object: response.body)
    end

    # Get a users TV watchlist.
    #
    # @param account_object_id [String]
    # @param page [Integer]
    # @param language [String]
    # @param sort_by [TmdbApiClient::AccountTvWatchlistRequestSortBy]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::AccountTvWatchlistResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.account_tv_watchlist(account_object_id: "account_object_id")
    def account_tv_watchlist(account_object_id:, page: nil, language: nil, sort_by: nil, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "page": page,
          "language": language,
          "sort_by": sort_by
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/4/account/#{account_object_id}/tv/watchlist"
      end
      TmdbApiClient::AccountTvWatchlistResponse.from_json(json_object: response.body)
    end

    # Get a users rated movies.
    #
    # @param account_object_id [String]
    # @param page [Integer]
    # @param language [String]
    # @param sort_by [TmdbApiClient::AccountRatedMoviesRequestSortBy]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::AccountRatedMoviesResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.account_rated_movies(account_object_id: "account_object_id")
    def account_rated_movies(account_object_id:, page: nil, language: nil, sort_by: nil, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "page": page,
          "language": language,
          "sort_by": sort_by
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/4/account/#{account_object_id}/movie/rated"
      end
      TmdbApiClient::AccountRatedMoviesResponse.from_json(json_object: response.body)
    end

    # Get a users rated TV shows.
    #
    # @param account_object_id [String]
    # @param page [Integer]
    # @param language [String]
    # @param sort_by [TmdbApiClient::AccountRatedTvRequestSortBy]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::AccountRatedTvResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.account_rated_tv(account_object_id: "account_object_id")
    def account_rated_tv(account_object_id:, page: nil, language: nil, sort_by: nil, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "page": page,
          "language": language,
          "sort_by": sort_by
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/4/account/#{account_object_id}/tv/rated"
      end
      TmdbApiClient::AccountRatedTvResponse.from_json(json_object: response.body)
    end

    #
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [Void]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.getting_started
    def getting_started(request_options: nil)
      @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/"
      end
    end
  end

  class AsyncClient
    # @param base_url [String]
    # @param environment [TmdbApiClient::Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param api_key [String]
    # @return [TmdbApiClient::AsyncClient]
    def initialize(api_key:, base_url: nil, environment: TmdbApiClient::Environment::PRODUCTION, max_retries: nil,
                   timeout_in_seconds: nil)
      @async_request_client = TmdbApiClient::AsyncRequestClient.new(
        base_url: base_url,
        environment: environment,
        max_retries: max_retries,
        timeout_in_seconds: timeout_in_seconds,
        api_key: api_key
      )
    end

    #
    # @param raw_body [String]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::AuthCreateRequestTokenResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.auth_create_request_token(raw_body: "RAW_BODY")
    def auth_create_request_token(raw_body:, request_options: nil)
      response = @async_request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request_options&.additional_body_parameters || {}), RAW_BODY: raw_body }.compact
        req.url "#{@async_request_client.get_url(request_options: request_options)}/4/auth/request_token"
      end
      TmdbApiClient::AuthCreateRequestTokenResponse.from_json(json_object: response.body)
    end

    #
    # @param raw_body [String]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::AuthCreateAccessTokenResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.auth_create_access_token(raw_body: "RAW_BODY")
    def auth_create_access_token(raw_body:, request_options: nil)
      response = @async_request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request_options&.additional_body_parameters || {}), RAW_BODY: raw_body }.compact
        req.url "#{@async_request_client.get_url(request_options: request_options)}/4/auth/access_token"
      end
      TmdbApiClient::AuthCreateAccessTokenResponse.from_json(json_object: response.body)
    end

    # Log out of a session.
    #
    # @param raw_body [String]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::AuthLogoutResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.auth_logout(raw_body: "RAW_BODY")
    def auth_logout(raw_body:, request_options: nil)
      response = @async_request_client.conn.delete do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request_options&.additional_body_parameters || {}), RAW_BODY: raw_body }.compact
        req.url "#{@async_request_client.get_url(request_options: request_options)}/4/auth/access_token"
      end
      TmdbApiClient::AuthLogoutResponse.from_json(json_object: response.body)
    end

    # Retrieve a list by id.
    #
    # @param list_id [Integer]
    # @param language [String]
    # @param page [Integer]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::ListDetailsResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.list_details(list_id: 1)
    def list_details(list_id:, language: nil, page: nil, request_options: nil)
      response = @async_request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "language": language,
          "page": page
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/4/list/#{list_id}"
      end
      TmdbApiClient::ListDetailsResponse.from_json(json_object: response.body)
    end

    # Update the details of a list.
    #
    # @param list_id [Integer]
    # @param raw_body [String]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::ListUpdateResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.list_update(list_id: 1, raw_body: "RAW_BODY")
    def list_update(list_id:, raw_body:, request_options: nil)
      response = @async_request_client.conn.put do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request_options&.additional_body_parameters || {}), RAW_BODY: raw_body }.compact
        req.url "#{@async_request_client.get_url(request_options: request_options)}/4/list/#{list_id}"
      end
      TmdbApiClient::ListUpdateResponse.from_json(json_object: response.body)
    end

    # Create a new list.
    #
    # @param raw_body [String]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::ListCreateResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.list_create(raw_body: "RAW_BODY")
    def list_create(raw_body:, request_options: nil)
      response = @async_request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request_options&.additional_body_parameters || {}), RAW_BODY: raw_body }.compact
        req.url "#{@async_request_client.get_url(request_options: request_options)}/4/list"
      end
      TmdbApiClient::ListCreateResponse.from_json(json_object: response.body)
    end

    # Clear all of the items on a list.
    #
    # @param list_id [Integer]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::ListClearResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.list_clear(list_id: 1)
    def list_clear(list_id:, request_options: nil)
      response = @async_request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/4/list/#{list_id}/clear"
      end
      TmdbApiClient::ListClearResponse.from_json(json_object: response.body)
    end

    # Delete a list.
    #
    # @param list_id [Integer]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::ListDeleteResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.list_delete(list_id: 1)
    def list_delete(list_id:, request_options: nil)
      response = @async_request_client.conn.delete do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/4/#{list_id}"
      end
      TmdbApiClient::ListDeleteResponse.from_json(json_object: response.body)
    end

    # Add items to a list.
    #
    # @param list_id [Integer]
    # @param raw_body [String]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::ListAddItemsResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.list_add_items(list_id: 1, raw_body: "RAW_BODY")
    def list_add_items(list_id:, raw_body:, request_options: nil)
      response = @async_request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request_options&.additional_body_parameters || {}), RAW_BODY: raw_body }.compact
        req.url "#{@async_request_client.get_url(request_options: request_options)}/4/list/#{list_id}/items"
      end
      TmdbApiClient::ListAddItemsResponse.from_json(json_object: response.body)
    end

    # Update an individual item on a list
    #
    # @param list_id [String]
    # @param raw_body [String]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::ListUpdateItemsResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.list_update_items(list_id: "list_id", raw_body: "RAW_BODY")
    def list_update_items(list_id:, raw_body:, request_options: nil)
      response = @async_request_client.conn.put do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request_options&.additional_body_parameters || {}), RAW_BODY: raw_body }.compact
        req.url "#{@async_request_client.get_url(request_options: request_options)}/4/list/#{list_id}/items"
      end
      TmdbApiClient::ListUpdateItemsResponse.from_json(json_object: response.body)
    end

    # Remove items from a list
    #
    # @param list_id [Integer]
    # @param raw_body [String]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::ListRemoveItemsResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.list_remove_items(list_id: 1, raw_body: "RAW_BODY")
    def list_remove_items(list_id:, raw_body:, request_options: nil)
      response = @async_request_client.conn.delete do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request_options&.additional_body_parameters || {}), RAW_BODY: raw_body }.compact
        req.url "#{@async_request_client.get_url(request_options: request_options)}/4/list/#{list_id}/items"
      end
      TmdbApiClient::ListRemoveItemsResponse.from_json(json_object: response.body)
    end

    # Check if an item is on a list.
    #
    # @param list_id [Integer]
    # @param media_id [Integer]
    # @param media_type [TmdbApiClient::ListItemStatusRequestMediaType]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::ListItemStatusResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.list_item_status(
    #    list_id: 1,
    #    media_id: 1,
    #    media_type: EMPTY
    #  )
    def list_item_status(list_id:, media_id:, media_type:, request_options: nil)
      response = @async_request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "media_id": media_id,
          "media_type": media_type
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/4/list/#{list_id}/item_status"
      end
      TmdbApiClient::ListItemStatusResponse.from_json(json_object: response.body)
    end

    # Get the custom lists that a user has created.
    #
    # @param account_object_id [String]
    # @param page [Integer]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::AccountListsResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.account_lists(account_object_id: "account_object_id")
    def account_lists(account_object_id:, page: nil, request_options: nil)
      response = @async_request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = { **(request_options&.additional_query_parameters || {}), "page": page }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/4/account/#{account_object_id}/lists"
      end
      TmdbApiClient::AccountListsResponse.from_json(json_object: response.body)
    end

    # Get a users list of favourite movies.
    #
    # @param account_object_id [String]
    # @param page [Integer]
    # @param language [String]
    # @param sort_by [TmdbApiClient::AccountFavoriteMoviesRequestSortBy]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::AccountFavoriteMoviesResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.account_favorite_movies(account_object_id: "account_object_id")
    def account_favorite_movies(account_object_id:, page: nil, language: nil, sort_by: nil, request_options: nil)
      response = @async_request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "page": page,
          "language": language,
          "sort_by": sort_by
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/4/account/#{account_object_id}/movie/favorites"
      end
      TmdbApiClient::AccountFavoriteMoviesResponse.from_json(json_object: response.body)
    end

    # Get a users list of favourite TV shows.
    #
    # @param account_object_id [String]
    # @param page [Integer]
    # @param language [String]
    # @param sort_by [TmdbApiClient::AccountFavoriteTvRequestSortBy]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::AccountFavoriteTvResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.account_favorite_tv(account_object_id: "account_object_id")
    def account_favorite_tv(account_object_id:, page: nil, language: nil, sort_by: nil, request_options: nil)
      response = @async_request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "page": page,
          "language": language,
          "sort_by": sort_by
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/4/account/#{account_object_id}/tv/favorites"
      end
      TmdbApiClient::AccountFavoriteTvResponse.from_json(json_object: response.body)
    end

    # Get a users list of recommended TV shows.
    #
    # @param account_object_id [String]
    # @param page [Integer]
    # @param language [String]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::AccountTvRecommendationsResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.account_tv_recommendations(account_object_id: "account_object_id")
    def account_tv_recommendations(account_object_id:, page: nil, language: nil, request_options: nil)
      response = @async_request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "page": page,
          "language": language
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/4/account/#{account_object_id}/tv/recommendations"
      end
      TmdbApiClient::AccountTvRecommendationsResponse.from_json(json_object: response.body)
    end

    # Get a users list of recommended movies.
    #
    # @param account_object_id [String]
    # @param page [Integer]
    # @param language [String]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::AccountMovieRecommendationsResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.account_movie_recommendations(account_object_id: "account_object_id")
    def account_movie_recommendations(account_object_id:, page: nil, language: nil, request_options: nil)
      response = @async_request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "page": page,
          "language": language
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/4/account/#{account_object_id}/movie/recommendations"
      end
      TmdbApiClient::AccountMovieRecommendationsResponse.from_json(json_object: response.body)
    end

    # Get a users movie watchlist.
    #
    # @param account_object_id [String]
    # @param page [Integer]
    # @param language [String]
    # @param sort_by [TmdbApiClient::AccountMovieWatchlistRequestSortBy]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::AccountMovieWatchlistResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.account_movie_watchlist(account_object_id: "account_object_id")
    def account_movie_watchlist(account_object_id:, page: nil, language: nil, sort_by: nil, request_options: nil)
      response = @async_request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "page": page,
          "language": language,
          "sort_by": sort_by
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/4/account/#{account_object_id}/movie/watchlist"
      end
      TmdbApiClient::AccountMovieWatchlistResponse.from_json(json_object: response.body)
    end

    # Get a users TV watchlist.
    #
    # @param account_object_id [String]
    # @param page [Integer]
    # @param language [String]
    # @param sort_by [TmdbApiClient::AccountTvWatchlistRequestSortBy]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::AccountTvWatchlistResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.account_tv_watchlist(account_object_id: "account_object_id")
    def account_tv_watchlist(account_object_id:, page: nil, language: nil, sort_by: nil, request_options: nil)
      response = @async_request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "page": page,
          "language": language,
          "sort_by": sort_by
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/4/account/#{account_object_id}/tv/watchlist"
      end
      TmdbApiClient::AccountTvWatchlistResponse.from_json(json_object: response.body)
    end

    # Get a users rated movies.
    #
    # @param account_object_id [String]
    # @param page [Integer]
    # @param language [String]
    # @param sort_by [TmdbApiClient::AccountRatedMoviesRequestSortBy]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::AccountRatedMoviesResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.account_rated_movies(account_object_id: "account_object_id")
    def account_rated_movies(account_object_id:, page: nil, language: nil, sort_by: nil, request_options: nil)
      response = @async_request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "page": page,
          "language": language,
          "sort_by": sort_by
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/4/account/#{account_object_id}/movie/rated"
      end
      TmdbApiClient::AccountRatedMoviesResponse.from_json(json_object: response.body)
    end

    # Get a users rated TV shows.
    #
    # @param account_object_id [String]
    # @param page [Integer]
    # @param language [String]
    # @param sort_by [TmdbApiClient::AccountRatedTvRequestSortBy]
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [TmdbApiClient::AccountRatedTvResponse]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.account_rated_tv(account_object_id: "account_object_id")
    def account_rated_tv(account_object_id:, page: nil, language: nil, sort_by: nil, request_options: nil)
      response = @async_request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "page": page,
          "language": language,
          "sort_by": sort_by
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/4/account/#{account_object_id}/tv/rated"
      end
      TmdbApiClient::AccountRatedTvResponse.from_json(json_object: response.body)
    end

    #
    # @param request_options [TmdbApiClient::RequestOptions]
    # @return [Void]
    # @example
    #  api = TmdbApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TmdbApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.getting_started
    def getting_started(request_options: nil)
      @async_request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/"
      end
    end
  end
end
