; ModuleID = 'simplex_program'
target triple = "x86_64-apple-macosx14.0.0"

declare ptr @malloc(i64)
declare void @free(ptr)
declare void @intrinsic_println(ptr)
declare void @intrinsic_print(ptr)
declare void @"print_i64"(i64)
declare ptr @intrinsic_int_to_string(i64)
declare ptr @intrinsic_string_new(ptr)
declare ptr @intrinsic_string_from_char(i64)
declare i64 @intrinsic_string_len(ptr)
declare ptr @intrinsic_string_concat(ptr, ptr)
declare ptr @intrinsic_string_slice(ptr, i64, i64)
declare i64 @intrinsic_string_char_at(ptr, i64)
declare i1 @intrinsic_string_eq(ptr, ptr)
declare i64 @intrinsic_string_to_int(ptr)
declare i64 @"String_from"(i64)
declare i64 @"String_len"(i64)
declare ptr @intrinsic_vec_new()
declare void @intrinsic_vec_push(ptr, ptr)
declare ptr @intrinsic_vec_get(ptr, i64)
declare i64 @intrinsic_vec_len(ptr)
declare void @intrinsic_vec_set(ptr, i64, ptr)
declare ptr @intrinsic_vec_pop(ptr)
declare void @intrinsic_vec_clear(ptr)
declare void @intrinsic_vec_remove(ptr, i64)
declare ptr @intrinsic_get_args()
declare ptr @intrinsic_read_file(ptr)
declare void @intrinsic_write_file(ptr, ptr)
declare ptr @store_ptr(ptr, i64, ptr)
declare ptr @store_i64(ptr, i64, i64)
declare ptr @load_ptr(ptr, i64)
declare i64 @load_i64(ptr, i64)
; Timing intrinsics
declare i64 @intrinsic_get_time_ms()
declare i64 @intrinsic_get_time_us()
declare i64 @intrinsic_get_time_ns()
; Arena allocator intrinsics
declare ptr @intrinsic_arena_create(i64)
declare ptr @intrinsic_arena_alloc(ptr, i64)
declare void @intrinsic_arena_reset(ptr)
declare void @intrinsic_arena_free(ptr)
declare i64 @intrinsic_arena_used(ptr)
; StringBuilder intrinsics
declare ptr @intrinsic_sb_new()
declare ptr @intrinsic_sb_new_cap(i64)
declare void @intrinsic_sb_append(ptr, ptr)
declare void @intrinsic_sb_append_char(ptr, i64)
declare void @intrinsic_sb_append_i64(ptr, i64)
declare ptr @intrinsic_sb_to_string(ptr)
declare void @intrinsic_sb_clear(ptr)
declare void @intrinsic_sb_free(ptr)
declare i64 @intrinsic_sb_len(ptr)
; File I/O intrinsics
declare ptr @intrinsic_getenv(ptr)
declare i64 @intrinsic_file_exists(ptr)
declare i64 @intrinsic_is_file(ptr)
declare i64 @intrinsic_is_directory(ptr)
declare i64 @intrinsic_file_size(ptr)
declare i64 @intrinsic_file_mtime(ptr)
declare i64 @intrinsic_remove_path(ptr)
declare i64 @intrinsic_mkdir_p(ptr)
declare ptr @intrinsic_get_cwd()
declare i64 @intrinsic_set_cwd(ptr)
declare ptr @intrinsic_list_dir(ptr)
declare ptr @intrinsic_path_join(ptr, ptr)
declare ptr @intrinsic_path_dirname(ptr)
declare ptr @intrinsic_path_basename(ptr)
declare ptr @intrinsic_path_extension(ptr)
declare i64 @file_copy(ptr, ptr)
declare i64 @file_rename(ptr, ptr)
declare void @stderr_write(ptr)
declare void @stderr_writeln(ptr)
; Error handling intrinsics
declare void @intrinsic_panic(ptr)
declare void @intrinsic_print_stack_trace()
; Process intrinsics
declare i64 @intrinsic_process_run(ptr)
declare ptr @intrinsic_process_output(ptr)
; Phase 20: REPL/I/O intrinsics
declare ptr @intrinsic_read_line()
declare i64 @intrinsic_is_tty()
declare i64 @intrinsic_stdin_has_data()
declare i64 @intrinsic_string_hash(ptr)
declare i64 @intrinsic_string_find(ptr, ptr, i64)
declare ptr @intrinsic_string_trim(ptr)
declare ptr @intrinsic_string_split(ptr, ptr)
declare i64 @intrinsic_string_starts_with(ptr, ptr)
declare i64 @intrinsic_string_ends_with(ptr, ptr)
declare i64 @intrinsic_string_contains(ptr, ptr)
declare ptr @intrinsic_string_replace(ptr, ptr, ptr)
declare ptr @intrinsic_string_lines(ptr)
declare ptr @intrinsic_string_join(ptr, ptr)
declare ptr @intrinsic_string_to_lowercase(ptr)
declare ptr @intrinsic_string_to_uppercase(ptr)
declare i64 @intrinsic_string_compare(ptr, ptr)
declare i64 @intrinsic_copy_file(ptr, ptr)
declare ptr @intrinsic_get_home_dir()
declare i64 @cli_getenv(i64)
declare i64 @"env_get"(i64)
declare i64 @file_read(i64)
declare void @file_write(i64, i64)
declare i64 @remove_path(i64)
declare i64 @f64_parse(ptr)
declare i64 @"make_sx_string"(i64)
; SLM native bindings
declare i64 @"slm_native_load"(i64, i64, i64)
declare i64 @"slm_native_unload"(i64)
declare i64 @"slm_native_create_context"(i64, i64)
declare i64 @"slm_native_destroy_context"(i64)
declare i64 @"slm_native_tokenize"(i64, i64)
declare i64 @"slm_native_infer"(i64, i64, i64)
declare i64 @"slm_native_generate"(i64, i64, i64, i64)
declare i64 @"slm_native_embed"(i64, i64)
declare i64 @"slm_native_similarity"(i64, i64)
declare i64 @"slm_native_context_size"(i64)
declare i64 @"slm_native_embedding_size"(i64)
declare i64 @"slm_native_get_model_info"(i64)
; Generator intrinsics
declare i64 @generator_yield(i64)
declare i64 @generator_new(i64)
declare i64 @generator_next(i64)
declare i64 @generator_done(i64)
; Belief guard intrinsics
declare i64 @belief_guard_get_confidence(i64)
declare i64 @belief_guard_get_derivative(i64)
declare i64 @belief_register(i64, double, double)
declare i64 @belief_update(i64, double)
declare i64 @belief_update_dual(i64, double, double)
declare double @belief_get_value(i64)
declare i64 @belief_register_i64(i64, i64, i64)
declare i64 @belief_update_i64(i64, i64)
declare i64 @belief_update_dual_i64(i64, i64, i64)
; Belief suspend/wake intrinsics
declare i64 @belief_suspend_receive(i64, i64, i64, i64, i64, double, i64, i64)
declare i64 @belief_cancel_suspend(i64)
declare i64 @belief_suspended_count()
declare i64 @belief_get_actor_suspends(i64)
declare i64 @belief_clear_actor_suspends(i64)
declare i64 @belief_suspend_get_belief(i64)
declare i64 @belief_suspend_get_actor(i64)
declare i64 @belief_suspend_get_duration_ms(i64)
declare i64 @future_poll(i64)
declare i64 @future_ready(i64)
declare i64 @future_pending()
declare i64 @executor_run(i64)
declare i64 @executor_spawn(i64)
declare i64 @block_on(i64)
declare i64 @async_join(i64, i64)
declare i64 @join_result1(i64)
declare i64 @join_result2(i64)
declare i64 @async_select(i64, i64)
declare i64 @select_result(i64)
declare i64 @select_which(i64)
declare i64 @async_timeout(i64, i64)
declare i64 @timeout_result(i64)
declare i64 @timeout_expired(i64)
declare i64 @time_now_ms()
declare i64 @pin_new(i64, i64)
declare i64 @pin_new_uninit(i64)
declare i64 @pin_get(i64)
declare i64 @pin_get_mut(i64)
declare i64 @pin_is_pinned(i64)
declare void @pin_ref(i64)
declare void @pin_unref(i64)
declare void @pin_set_self_ref(i64, i64)
declare i64 @pin_check_self_ref(i64, i64)
declare i64 @intrinsic_call0(i64)
declare i64 @intrinsic_call1(i64, i64)
declare i64 @intrinsic_call2(i64, i64, i64)
declare i64 @intrinsic_call3(i64, i64, i64, i64)
declare i64 @scope_new()
declare i64 @scope_spawn(i64, i64)
declare i64 @scope_poll(i64)
declare i64 @scope_join(i64)
declare i64 @scope_get_result(i64, i64)
declare void @scope_cancel(i64)
declare i64 @scope_count(i64)
declare i64 @scope_completed(i64)
declare void @scope_free(i64)
declare i64 @nursery_run(i64, i64)
declare i64 @actor_get_status(i64)
declare i64 @actor_get_exit_reason(i64)
declare i64 @actor_get_error_code(i64)
declare void @actor_set_error(i64, i64, i64)
declare void @actor_stop(i64)
declare void @actor_kill(i64)
declare void @actor_crash(i64, i64, i64)
declare void @actor_set_on_error(i64, i64)
declare void @actor_set_on_exit(i64, i64)
declare void @actor_set_supervisor(i64, i64)
declare i64 @actor_get_supervisor(i64)
declare i64 @actor_get_restart_count(i64)
declare void @actor_increment_restart(i64)
declare i64 @actor_is_alive(i64)
declare i64 @circuit_breaker_new(i64, i64, i64)
declare i64 @circuit_breaker_allow(i64)
declare void @circuit_breaker_success(i64)
declare void @circuit_breaker_failure(i64)
declare i64 @circuit_breaker_state(i64)
declare void @circuit_breaker_reset(i64)
declare i64 @retry_policy_new(i64, i64, i64, i64)
declare void @retry_policy_set_jitter(i64, i64)
declare i64 @retry_policy_should_retry(i64)
declare i64 @retry_policy_next_delay(i64)
declare void @retry_policy_reset(i64)
declare i64 @retry_policy_count(i64)
declare i64 @actor_link(i64, i64)
declare void @actor_unlink(i64, i64)
declare i64 @actor_monitor(i64, i64)
declare void @actor_demonitor(i64)
declare void @actor_propagate_exit(i64, i64)
declare i64 @actor_is_linked(i64, i64)
declare i64 @actor_spawn_link(i64, i64, i64)
declare i64 @actor_get_links_count(i64)
declare i64 @actor_send_down(i64, i64, i64)
; Phase 23.1: Supervision Trees
declare i64 @supervisor_new(i64, i64, i64)
declare i64 @supervisor_add_child(i64, i64, i64, i64, i64)
declare i64 @supervisor_start(i64)
declare void @supervisor_stop(i64)
declare i64 @supervisor_handle_exit(i64, i64, i64)
declare i64 @supervisor_child_count(i64)
declare i64 @supervisor_child_status(i64, i64)
declare i64 @supervisor_child_handle(i64, i64)
declare void @supervisor_free(i64)
declare i64 @strategy_one_for_one()
declare i64 @strategy_one_for_all()
declare i64 @strategy_rest_for_one()
declare i64 @child_permanent()
declare i64 @child_temporary()
declare i64 @child_transient()
; Phase 23.2: Work-Stealing Scheduler
declare i64 @scheduler_new(i64)
declare i64 @scheduler_start(i64)
declare i64 @scheduler_submit(i64, i64, i64)
declare i64 @scheduler_submit_local(i64, i64, i64, i64)
declare void @scheduler_stop(i64)
declare void @scheduler_free(i64)
declare i64 @scheduler_worker_count(i64)
declare i64 @scheduler_queue_size(i64)
declare i64 @scheduler_worker_idle(i64, i64)
; Phase 23.3: Lock-Free Mailbox
declare i64 @mailbox_new(i64)
declare i64 @mailbox_send(i64, i64)
declare i64 @mailbox_ask(i64, i64)
declare i64 @mailbox_recv(i64)
declare i64 @mailbox_try_recv(i64)
declare i64 @mailbox_size(i64)
declare i64 @mailbox_empty(i64)
declare i64 @mailbox_full(i64)
declare void @mailbox_close(i64)
declare i64 @mailbox_is_closed(i64)
declare void @mailbox_free(i64)
; Phase 23.6: Actor Discovery and Registry
declare i64 @registry_register(i64, i64)
declare void @registry_unregister(i64)
declare i64 @registry_lookup(i64)
declare i64 @registry_count()
declare i64 @registry_set_metadata(i64, i64)
declare i64 @registry_get_metadata(i64)
; Phase 23.7: Backpressure and Flow Control
declare i64 @flow_controller_new(i64, i64, i64)
declare i64 @flow_check(i64)
declare i64 @flow_acquire(i64)
declare void @flow_release(i64)
declare i64 @flow_is_signaling(i64)
declare i64 @flow_current(i64)
declare i64 @flow_high_watermark(i64)
declare i64 @flow_low_watermark(i64)
declare void @flow_reset(i64)
declare void @flow_free(i64)
declare i64 @flow_mode_drop()
declare i64 @flow_mode_block()
declare i64 @flow_mode_signal()
declare void @intrinsic_exit(i64)
; Phase 1 Stdlib: Option
declare i64 @"option_some"(i64)
declare i64 @"option_none"()
declare i64 @"option_is_some"(i64)
declare i64 @"option_is_none"(i64)
declare i64 @"option_unwrap"(i64)
declare i64 @"option_expect"(i64, i64)
declare i64 @"option_unwrap_or"(i64, i64)
declare i64 @"option_map"(i64, i64)
; Phase 1 Stdlib: Result
declare i64 @"result_ok"(i64)
declare i64 @"result_err"(i64)
declare i64 @"result_is_ok"(i64)
declare i64 @"result_is_err"(i64)
declare i64 @"result_unwrap"(i64)
declare i64 @"result_unwrap_err"(i64)
declare i64 @"result_unwrap_or"(i64, i64)
declare i64 @"result_ok_or"(i64, i64)
; Phase 1 Stdlib: Vec extensions
declare i64 @"vec_sum"(i64)
declare i64 @"vec_find"(i64, i64)
declare i64 @"vec_contains"(i64, i64)
declare i64 @"vec_reverse"(i64)
declare i64 @"vec_clone"(i64)
declare i64 @"vec_first"(i64)
declare i64 @"vec_last"(i64)
declare i64 @"vec_pop"(i64)
declare i64 @"vec_set"(i64, i64, i64)
declare i64 @"vec_clear"(i64)
declare i64 @"vec_remove"(i64, i64)
; Phase 1 Stdlib: HashMap
declare i64 @"hashmap_new"()
declare i64 @"hashmap_insert"(i64, i64, i64)
declare i64 @"hashmap_get"(i64, i64)
declare i64 @"hashmap_remove"(i64, i64)
declare i64 @"hashmap_contains"(i64, i64)
declare i64 @"hashmap_len"(i64)
declare i64 @"hashmap_clear"(i64)
declare i64 @"hashmap_keys"(i64)
declare i64 @"hashmap_values"(i64)
; Phase 1 Stdlib: HashSet
declare i64 @"hashset_new"()
declare i64 @"hashset_insert"(i64, i64)
declare i64 @"hashset_remove"(i64, i64)
declare i64 @"hashset_contains"(i64, i64)
declare i64 @"hashset_len"(i64)
declare i64 @"hashset_clear"(i64)
; Phase 1 Stdlib: JSON
declare i64 @"json_parse_simple"(i64)
declare i64 @"json_stringify"(i64)
declare i64 @"json_get_sx"(i64, i64)
declare i64 @"json_keys"(i64)
declare i64 @"json_is_string"(i64)
declare i64 @"json_is_object"(i64)
declare i64 @"json_is_array"(i64)
declare i64 @"json_as_string"(i64)
declare i64 @"json_as_array"(i64)
declare i64 @"json_object_new"()
declare i64 @"json_array_new"()
declare i64 @"json_object_set"(i64, i64, i64)
declare i64 @"json_array_push"(i64, i64)
declare i64 @"json_string"(i64)
declare i64 @"json_string_sx"(i64)
declare i64 @"json_array_len"(i64)
declare i64 @"json_object_len"(i64)
declare i64 @"json_as_i64"(i64)
declare i64 @"json_get_index"(i64, i64)
declare i64 @"json_is_null"(i64)
declare i64 @"json_object_key_at"(i64, i64)
declare i64 @"json_object_value_at"(i64, i64)
declare i64 @"json_object_set_sx"(i64, i64, i64)
; Phase 3: HTTP Client/Server
declare i64 @"http_request_new"(i64, i64)
declare i64 @"http_request_header"(i64, i64, i64)
declare i64 @"http_request_body"(i64, i64)
declare i64 @"http_request_send"(i64)
declare i64 @"http_request_free"(i64)
declare i64 @"http_response_status"(i64)
declare i64 @"http_response_body"(i64)
declare i64 @"http_response_header"(i64, i64)
declare i64 @"http_response_free"(i64)
declare i64 @"http_server_new"(i64)
declare i64 @"http_server_route"(i64, i64, i64, i64)
declare i64 @"http_server_start"(i64)
declare i64 @"http_server_stop"(i64)
declare i64 @"http_server_free"(i64)
; Phase 3: SQL Database
declare i64 @"sql_open"(i64)
declare void @"sql_close"(i64)
declare i64 @"sql_exec"(i64, i64)
declare i64 @"sql_query"(i64, i64)
declare i64 @"sql_prepare"(i64, i64)
declare i64 @"sql_bind_int"(i64, i64, i64)
declare i64 @"sql_bind_text"(i64, i64, i64)
declare i64 @"sql_bind_float"(i64, i64, double)
declare i64 @"sql_bind_null"(i64, i64)
declare i64 @"sql_bind_blob"(i64, i64, i64, i64)
declare i64 @"sql_step"(i64)
declare i64 @"sql_column_int"(i64, i64)
declare i64 @"sql_column_text"(i64, i64)
declare double @"sql_column_float"(i64, i64)
declare i64 @"sql_column_blob"(i64, i64)
declare i64 @"sql_column_blob_len"(i64, i64)
declare i64 @"sql_column_is_null"(i64, i64)
declare void @"sql_finalize"(i64)
declare i64 @"sql_begin"(i64)
declare i64 @"sql_commit"(i64)
declare i64 @"sql_rollback"(i64)
declare i64 @"sql_last_insert_id"(i64)
; Phase 3: UUID
declare i64 @"uuid_v4"()
declare i64 @"uuid_nil"()
declare i64 @"uuid_is_nil"(i64)
declare i64 @"uuid_is_valid"(i64)
; Phase 3: TOML
declare i64 @"toml_parse"(i64)
declare i64 @"toml_get"(i64, i64)
declare i64 @"toml_get_string"(i64, i64)
declare i64 @"toml_get_int"(i64, i64)
declare double @"toml_get_float"(i64, i64)
declare i64 @"toml_get_bool"(i64, i64)
declare i64 @"toml_get_array"(i64, i64)
declare i64 @"toml_get_table"(i64, i64)
declare i64 @"toml_set_string"(i64, i64, i64)
declare i64 @"toml_set_int"(i64, i64, i64)
declare i64 @"toml_set_float"(i64, i64, double)
declare i64 @"toml_set_bool"(i64, i64, i64)
declare i64 @"toml_stringify"(i64)
declare i64 @"toml_table_new"()
declare i64 @"toml_free"(i64)
; Phase G: AI Features
declare i64 @model_infer(i64)
declare i64 @model_load(i64)
declare i64 @model_embed(i64, i64)
declare i64 @model_classify(i64, i64)
declare void @model_unload(i64)
; AI Vector Operations
declare i64 @vector_new(i64, i64)
declare i64 @vector_len(i64)
declare double @vector_get(i64, i64)
declare void @vector_set(i64, i64, double)
declare double @vector_dot(i64, i64)
declare i64 @vector_add(i64, i64)
declare i64 @vector_sub(i64, i64)
declare i64 @vector_scale(i64, double)
declare double @vector_norm(i64)
declare i64 @vector_normalize(i64)
declare double @vector_cosine_similarity(i64, i64)
; AI Tensor Operations
declare i64 @tensor_new(i64, i64)
declare i64 @tensor_shape(i64)
declare i64 @tensor_rank(i64)
declare double @tensor_get(i64, i64)
declare void @tensor_set(i64, i64, double)
declare i64 @tensor_matmul(i64, i64)
declare i64 @tensor_add(i64, i64)
declare i64 @tensor_transpose(i64)
declare i64 @tensor_reshape(i64, i64)
; Specialist Operations
declare i64 @specialist_query(i64, i64)
declare i64 @specialist_stream(i64, i64)
declare void @specialist_set_context(i64, i64)
declare i64 @specialist_get_context(i64)
; Hive Operations
declare i64 @hive_route(i64, i64)
declare void @hive_add_specialist(i64, i64)
declare void @hive_remove_specialist(i64, i64)
declare i64 @hive_consensus(i64, i64)
declare i64 @"sx_int_to_f64"(i64)
declare i64 @"sx_f64_to_int"(i64)
declare i64 @"sx_f64_add"(i64, i64)
declare i64 @"sx_f64_sub"(i64, i64)
declare i64 @"sx_f64_mul"(i64, i64)
declare i64 @"sx_f64_div"(i64, i64)
declare i64 @"sx_f64_mod"(i64, i64)
declare i64 @"sx_f64_gt"(i64, i64)
declare i64 @"sx_f64_lt"(i64, i64)
declare i64 @"sx_f64_ge"(i64, i64)
declare i64 @"sx_f64_le"(i64, i64)
declare i64 @"sx_f64_eq"(i64, i64)
declare i64 @"sx_f64_ne"(i64, i64)
declare i64 @"f64_neg"(i64)
declare i64 @"json_parse"(i64)
declare i64 @"json_get"(i64, i64)
declare i64 @"json_set"(i64, i64, i64)
declare i64 @"string_from"(i64)
declare i64 @"infer"(i64, i64)
declare i64 @"path_exists"(i64)
declare i64 @"tanh_f64"(i64)
declare i64 @"contract_result_violation_type"(i64)
declare i64 @"activation_record"(i64, i64)
declare i64 @"neural_reset_pruning"()
declare i64 @"device_type"(i64)
declare i64 @"lazy_branch_count"(i64)
declare i64 @"lazy_context_new"()
declare i64 @"lazy_context_free"(i64)
declare i64 @"lazy_dominant_branch"(i64)
declare i64 @"lazy_executed_count"(i64)
declare i64 @"lazy_mark_executed"(i64, i64)
declare i64 @"lazy_should_execute"(i64, i64)
declare i64 @"activation_tracker_init"()
declare i64 @"activation_tracking_enabled"()
declare i64 @"neural_gate_new"(i64, i64, i64, i64)
declare i64 @"neural_gate_with_contract"(i64, i64, i64, i64, i64)
declare i64 @"neural_gate_execute_on_device"(i64, i64, i64)
declare i64 @"gate_bind_device"(i64, i64)
declare i64 @"gate_get_device"(i64)
declare i64 @"gate_has_explicit_binding"(i64)
declare i64 @"dead_path_analyzer_new"()
declare i64 @"dead_path_analyzer_free"(i64)
declare i64 @"dead_path_add_edge"(i64, i64, i64)
declare i64 @"dead_path_mark_entry"(i64, i64)
declare i64 @"dead_path_propagate"(i64)
declare i64 @"dead_path_reachable_count"(i64)
declare i64 @"graph_new"()
declare i64 @"graph_free"(i64)
declare i64 @"graph_add_node"(i64, i64)
declare i64 @"graph_add_edge"(i64, i64, i64)
declare i64 @"graph_partition"(i64, i64)
declare i64 @"graph_partition_count"(i64)
declare i64 @"graph_partition_device"(i64, i64)
declare i64 @"pruning_context_new"()
declare i64 @"pruning_context_free"(i64)
declare i64 @"pruning_add_gate"(i64, i64, i64)
declare i64 @"pruning_execute"(i64)
declare i64 @"pruning_is_pruned"(i64, i64)
declare i64 @"pruning_ratio"(i64)
declare i64 @"pruning_reason"(i64, i64)
declare i64 @"pruning_total_count"(i64)
declare i64 @"structured_pruner_new"()
declare i64 @"structured_pruner_free"(i64)
declare i64 @"speculative_context_new"()
declare i64 @"speculative_context_free"(i64)
declare i64 @"speculative_add_branch"(i64, i64, i64)
declare i64 @"speculative_get_result"(i64, i64)
declare i64 @"speculative_set_result"(i64, i64, i64)
declare i64 @"speculative_weighted_result"(i64)
declare i64 @"speculative_memory_used"(i64)
declare i64 @"speculative_gc"(i64)
declare i64 @"optimization_stats_calculate"(i64, i64)
declare i64 @"optimization_stats_free"(i64)
declare i64 @"optimization_speedup"(i64)
declare i64 @"optimization_size_reduction"(i64)
declare i64 @"dual_variable"(i64)
declare i64 @"dual_constant"(i64)
declare i64 @"dual_add"(i64, i64)
declare i64 @"dual_mul"(i64, i64)
declare i64 @"dual_div"(i64, i64)
declare i64 @"dual_mul_scalar"(i64, i64)
declare i64 @"dual_sin"(i64)
declare i64 @"dual_cos"(i64)
declare i64 @"dual_exp"(i64)
declare i64 @"dual_ln"(i64)
declare i64 @"dual_sqrt"(i64)
declare i64 @"dual_tanh"(i64)
declare i64 @"dual_sigmoid"(i64)
declare i64 @"dual_powi"(i64, i64)
declare i64 @"int_hashset_new"()
declare i64 @"int_hashset_insert"(i64, i64)
declare i64 @"int_hashset_contains"(i64, i64)
declare i64 @"int_hashset_len"(i64)
declare i64 @"not_approx_eq"(i64, i64, i64)
declare i64 @"transfer_queue_init"(i64)
declare i64 @"sxiter_from_vec"(i64)
declare i64 @"sxiter_collect_vec"(i64)
declare i64 @"sxiter_filter"(i64, i64)
declare i64 @"wref_registry_init"()
declare i64 @"wref_new"(i64, i64, i64)
declare i64 @"wref_ptr"(i64)
declare i64 @"wref_weight"(i64)
declare i64 @"wref_count"()
declare i64 @"wref_state"(i64)
declare i64 @"wref_retain"(i64)
declare i64 @"wref_release"(i64)
declare i64 @"wref_is_allocated"(i64)
declare i64 @"wref_collapse"(i64)
declare i64 @"wref_set_weight"(i64, i64)
declare i64 @"wref_set_mode"(i64)
declare i64 @"wref_get_mode"()
declare i64 @"wref_set_weight_threshold"(i64)
declare i64 @"wref_get_weight_threshold"()
declare i64 @"wref_gc"()
declare i64 @"wref_gc_total_runs"()
declare i64 @"wref_gc_total_collected"()
declare i64 @"wref_gc_last_collected"()
declare i64 @"wref_bytes_allocated"()
declare i64 @"device_registry_init"()
declare i64 @"contract_violation_count"()
declare i64 @"contract_set_violation_handler"(i64)
declare i64 @"neural_gate_weight"(i64)
declare i64 @"lazy_eval"(i64)
declare i64 @"lazy_best_branch"(i64)
declare i64 @"print_f64"(i64)
declare i64 @"device_register"(i64, i64, i64, i64, i64, i64)
declare i64 @"lazy_add_branch"(i64, i64)
declare i64 @"contract_result_satisfied"(i64)
declare i64 @"neural_set_temperature"(i64)
declare i64 @"activation_rate_get"(i64)
declare i64 @"neural_register_gate_weight"(i64, i64, i64)
declare i64 @"ckpt_context_fork"(i64)
declare i64 @"ckpt_context_merge"(i64, i64)
declare i64 @"sqrt_f64"(i64)
declare i64 @"ckpt_save"(i64)
declare i64 @"contract_result_ok"()
declare i64 @"neural_get_temperature"()
declare i64 @"activation_mean_get"(i64)
declare i64 @"neural_prune_by_weight_magnitude"(i64)
declare i64 @"activation_gate_count"()
declare i64 @"ckpt_restore"(i64)
declare i64 @"contract_result_new"(i64, i64)
declare i64 @"contract_result_free"(i64)
declare i64 @"device_get_default"()
declare i64 @"grad_tape_temperature"(i64)
declare i64 @"json_object_has"(i64, i64)
declare i64 @"neural_is_gate_pruned"(i64)
declare i64 @"ln_f64"(i64)
declare i64 @"device_get"(i64)
declare i64 @"ckpt_count"()
declare i64 @"contract_in_range"(i64, i64, i64)
declare i64 @"grad_tape_set_training"(i64, i64)
declare i64 @"activation_epoch_current"()
declare i64 @"neural_get_pruned_gate_count"()
declare i64 @"exp_f64"(i64)
declare i64 @"sin_f64"(i64)
declare i64 @"json_is_number"(i64)
declare i64 @"string_to_lowercase"(i64)
declare i64 @"string_split_whitespace"(i64)
declare i64 @"device_count"()
declare i64 @"ckpt_context_new"()
declare i64 @"ckpt_context_free"(i64)
declare i64 @"ckpt_context_save"(i64)
declare i64 @"ckpt_context_restore"(i64)
declare i64 @"contract_get_panic_mode"()
declare i64 @"contract_set_panic_mode"(i64)
declare i64 @"grad_tape_set_temperature"(i64, i64)
declare i64 @"activation_epoch_advance"(i64)
declare i64 @"neural_get_gate_count"()
declare i64 @"json_is_bool"(i64)
; v0.13.0 Runtime
declare i64 @"print_string"(i64)
declare i64 @"file_delete"(i64)
declare i64 @"cos_f64"(i64)
declare i64 @"pow_f64"(i64, i64)
declare i64 @"neural_set_training_mode"(i64)
declare i64 @"neural_get_training_mode"()
declare i64 @"neural_sigmoid"(i64)
declare i64 @"neural_register_gate"(i64)
declare i64 @"neural_clear_gate_registry"()
declare i64 @"neural_gate_count"()
declare i64 @"grad_tape_new"()
declare i64 @"grad_tape_free"(i64)
declare i64 @"grad_tape_len"(i64)
declare i64 @"grad_tape_record"(i64, i64)
declare i64 @"contract_check_requires"(i64, i64, i64)
declare i64 @"contract_check_ensures"(i64, i64, i64)
declare i64 @"contract_check_invariant"(i64, i64, i64)
declare i64 @"device_available"(i64)
declare i64 @"activation_count_inc"(i64)
declare i64 @"activation_count_get"(i64)
declare i64 @"ckpt_branch_start"()
declare i64 @"ckpt_branch_end"(i64)
declare i64 @"anneal_exponential"(i64, i64)
declare i64 @"anneal_linear"(i64, i64)
declare i64 @"json_null"()
declare i64 @"json_bool"(i64)
declare i64 @"json_number_i64"(i64)
declare i64 @"json_number_f64"(i64)
declare i64 @"json_array"()
declare i64 @"json_object"()
declare i64 @"json_as_bool"(i64)
declare i64 @"HashMap_new"()
declare i64 @"hashmap_is_empty"(i64)
declare i64 @"timer_start"()
declare i64 @"timer_elapsed_us"(i64)
declare i64 @"timer_elapsed_ms"(i64)
declare i64 @"timer_elapsed_s"(i64)
declare i64 @"timer_close"(i64)
declare i64 @"timer_record_to"(i64, i64)
declare i64 @"logger_new"()
declare i64 @"logger_global"()
declare i64 @"logger_set_level"(i64, i64)
declare i64 @"logger_set_console"(i64, i64)
declare i64 @"logger_set_file"(i64, i64)
declare i64 @"logger_set_json"(i64, i64)
declare i64 @"logger_add_context"(i64, i64, i64)
declare i64 @"logger_close"(i64)
declare i64 @"log_debug"(i64)
declare i64 @"log_info"(i64)
declare i64 @"log_warn"(i64)
declare i64 @"log_error"(i64)
declare i64 @"log_fatal"(i64)
declare i64 @"log_with_field"(i64, i64, i64)
declare i64 @"log_with_span"(i64, i64)
declare i64 @"counter_new"(i64)
declare i64 @"counter_inc"(i64)
declare i64 @"counter_add"(i64, i64)
declare i64 @"counter_add_label"(i64, i64, i64)
declare i64 @"counter_value"(i64)
declare i64 @"gauge_new"(i64)
declare i64 @"gauge_set"(i64, i64)
declare i64 @"gauge_inc"(i64)
declare i64 @"gauge_dec"(i64)
declare i64 @"gauge_add"(i64, i64)
declare i64 @"gauge_value"(i64)
declare i64 @"histogram_new"(i64)
declare i64 @"histogram_observe"(i64, i64)
declare i64 @"histogram_count"(i64)
declare i64 @"histogram_sum"(i64)
declare i64 @"histogram_mean"(i64)
declare i64 @"histogram_min"(i64)
declare i64 @"histogram_max"(i64)
declare i64 @"histogram_to_json"(i64)
declare i64 @"metrics_registry_new"()
declare i64 @"metrics_registry_global"()
declare i64 @"metrics_registry_count"(i64)
declare i64 @"metrics_registry_close"(i64)
declare i64 @"metrics_export_json"(i64)
declare i64 @"metrics_export_prometheus"(i64)
declare i64 @"span_start"(i64)
declare i64 @"span_start_child"(i64, i64)
declare i64 @"span_end"(i64)
declare i64 @"span_close"(i64)
declare i64 @"span_id"(i64)
declare i64 @"span_trace_id"(i64)
declare i64 @"span_duration_us"(i64)
declare i64 @"span_set_attribute"(i64, i64, i64)
declare i64 @"span_set_status"(i64, i64)
declare i64 @"span_add_event"(i64, i64)
declare i64 @"span_to_json"(i64)
declare i64 @"tracer_new"()
declare i64 @"tracer_active_spans"(i64)
declare i64 @"tracer_close"(i64)

declare i64 @"println"(i64)
declare i64 @"print"(i64)
define i64 @"abs_f64"(i64 %x) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t0 = load i64, ptr %local.x
  %t1 = call i64 @f64_parse(ptr @.str.exp_invariants.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = load i64, ptr %local.x
  %t6 = xor i64 %t5, -9223372036854775808
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t7 = phi i64 [ %t4, %then0_end ], [ %t6, %else0_end ]
  ret i64 %t7
}

define i64 @"test_single_constraint"() nounwind {
entry:
  %local.mut.8 = alloca i64
  %local.mut.9 = alloca i64
  %local.mut.10 = alloca i64
  %local.lr.11 = alloca i64
  %local.steps.12 = alloca i64
  %local.mut.13 = alloca i64
  %local.boundary.14 = alloca i64
  %local.mut.15 = alloca i64
  %local.g0.16 = alloca i64
  %local.g1.17 = alloca i64
  %local.g2.18 = alloca i64
  %t19 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.1)
  %t20 = ptrtoint ptr %t19 to i64
  %t21 = inttoptr i64 %t20 to ptr
  call void @intrinsic_println(ptr %t21)
  %t22 = load i64, ptr %local.w0
  %t23 = call i64 @f64_parse(ptr @.str.exp_invariants.2)
  store i64 %t23, ptr %local.f64
  %t24 = load i64, ptr %local.w1
  %t25 = call i64 @f64_parse(ptr @.str.exp_invariants.3)
  store i64 %t25, ptr %local.f64
  %t26 = load i64, ptr %local.w2
  %t27 = call i64 @f64_parse(ptr @.str.exp_invariants.4)
  %t28 = xor i64 %t27, -9223372036854775808
  store i64 %t28, ptr %local.f64
  %t29 = call i64 @f64_parse(ptr @.str.exp_invariants.5)
  store i64 %t29, ptr %local.lr.11
  store i64 5000, ptr %local.steps.12
  %t30 = load i64, ptr %local.violations
  store i64 0, ptr %local.i64
  %t31 = call i64 @f64_parse(ptr @.str.exp_invariants.6)
  store i64 %t31, ptr %local.boundary.14
  %t32 = load i64, ptr %local.step
  store i64 0, ptr %local.i64
  br label %loop1
loop1:
  %t33 = load i64, ptr %local.step
  %t34 = load i64, ptr %local.steps.12
  %t35 = icmp slt i64 %t33, %t34
  %t36 = zext i1 %t35 to i64
  %t37 = icmp ne i64 %t36, 0
  br i1 %t37, label %body1, label %endloop1
body1:
  %t38 = call i64 @f64_parse(ptr @.str.exp_invariants.7)
  %t39 = load i64, ptr %local.w0
  %t40 = call i64 @f64_parse(ptr @.str.exp_invariants.8)
  %t41 = call i64 @"sx_f64_add"(i64 %t39, i64 %t40)
  %t42 = call i64 @"sx_f64_mul"(i64 %t38, i64 %t41)
  store i64 %t42, ptr %local.g0.16
  %t43 = call i64 @f64_parse(ptr @.str.exp_invariants.9)
  %t44 = load i64, ptr %local.w1
  %t45 = call i64 @"sx_f64_mul"(i64 %t43, i64 %t44)
  store i64 %t45, ptr %local.g1.17
  %t46 = call i64 @f64_parse(ptr @.str.exp_invariants.10)
  %t47 = load i64, ptr %local.w2
  %t48 = call i64 @"sx_f64_mul"(i64 %t46, i64 %t47)
  store i64 %t48, ptr %local.g2.18
  %t49 = load i64, ptr %local.w0
  %t50 = load i64, ptr %local.lr.11
  %t51 = load i64, ptr %local.g0.16
  %t52 = call i64 @"sx_f64_mul"(i64 %t50, i64 %t51)
  %t53 = call i64 @"sx_f64_sub"(i64 %t49, i64 %t52)
  store i64 %t53, ptr %local.w0
  %t54 = load i64, ptr %local.w1
  %t55 = load i64, ptr %local.lr.11
  %t56 = load i64, ptr %local.g1.17
  %t57 = call i64 @"sx_f64_mul"(i64 %t55, i64 %t56)
  %t58 = call i64 @"sx_f64_sub"(i64 %t54, i64 %t57)
  store i64 %t58, ptr %local.w1
  %t59 = load i64, ptr %local.w2
  %t60 = load i64, ptr %local.lr.11
  %t61 = load i64, ptr %local.g2.18
  %t62 = call i64 @"sx_f64_mul"(i64 %t60, i64 %t61)
  %t63 = call i64 @"sx_f64_sub"(i64 %t59, i64 %t62)
  store i64 %t63, ptr %local.w2
  %t64 = load i64, ptr %local.w0
  %t65 = load i64, ptr %local.boundary.14
  %t66 = call i64 @"sx_f64_lt"(i64 %t64, i64 %t65)
  %t67 = icmp ne i64 %t66, 0
  br i1 %t67, label %then2, label %else2
then2:
  %t68 = load i64, ptr %local.boundary.14
  store i64 %t68, ptr %local.w0
  br label %then2_end
then2_end:
  br label %endif2
else2:
  br label %else2_end
else2_end:
  br label %endif2
endif2:
  %t69 = phi i64 [ 0, %then2_end ], [ 0, %else2_end ]
  %t70 = load i64, ptr %local.w0
  %t71 = call i64 @f64_parse(ptr @.str.exp_invariants.11)
  %t72 = call i64 @"sx_f64_le"(i64 %t70, i64 %t71)
  %t73 = icmp ne i64 %t72, 0
  br i1 %t73, label %then3, label %else3
then3:
  %t74 = load i64, ptr %local.violations
  %t75 = add i64 %t74, 1
  store i64 %t75, ptr %local.violations
  br label %then3_end
then3_end:
  br label %endif3
else3:
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t76 = phi i64 [ 0, %then3_end ], [ 0, %else3_end ]
  %t77 = load i64, ptr %local.step
  %t78 = add i64 %t77, 1
  store i64 %t78, ptr %local.step
  br label %loop1
endloop1:
  %t79 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.12)
  %t80 = ptrtoint ptr %t79 to i64
  %t81 = inttoptr i64 %t80 to ptr
  call void @intrinsic_print(ptr %t81)
  %t82 = load i64, ptr %local.w0
  %t83 = call i64 @"print_f64"(i64 %t82)
  %t84 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.13)
  %t85 = ptrtoint ptr %t84 to i64
  %t86 = inttoptr i64 %t85 to ptr
  call void @intrinsic_print(ptr %t86)
  %t87 = load i64, ptr %local.w1
  %t88 = call i64 @"print_f64"(i64 %t87)
  %t89 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.14)
  %t90 = ptrtoint ptr %t89 to i64
  %t91 = inttoptr i64 %t90 to ptr
  call void @intrinsic_print(ptr %t91)
  %t92 = load i64, ptr %local.w2
  %t93 = call i64 @"print_f64"(i64 %t92)
  %t94 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.15)
  %t95 = ptrtoint ptr %t94 to i64
  %t96 = inttoptr i64 %t95 to ptr
  call void @intrinsic_println(ptr %t96)
  %t97 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.16)
  %t98 = ptrtoint ptr %t97 to i64
  %t99 = inttoptr i64 %t98 to ptr
  call void @intrinsic_print(ptr %t99)
  %t100 = load i64, ptr %local.violations
  call void @print_i64(i64 %t100)
  %t101 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.17)
  %t102 = ptrtoint ptr %t101 to i64
  %t103 = inttoptr i64 %t102 to ptr
  call void @intrinsic_println(ptr %t103)
  %t104 = load i64, ptr %local.violations
  %t105 = icmp eq i64 %t104, 0
  %t106 = zext i1 %t105 to i64
  %t107 = load i64, ptr %local.w0
  %t108 = call i64 @f64_parse(ptr @.str.exp_invariants.18)
  %t109 = call i64 @"sx_f64_gt"(i64 %t107, i64 %t108)
  %t110 = icmp ne i64 %t106, 0
  %t111 = icmp ne i64 %t109, 0
  %t112 = and i1 %t110, %t111
  %t113 = zext i1 %t112 to i64
  %t114 = icmp ne i64 %t113, 0
  br i1 %t114, label %then4, label %else4
then4:
  %t115 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.19)
  %t116 = ptrtoint ptr %t115 to i64
  %t117 = inttoptr i64 %t116 to ptr
  call void @intrinsic_println(ptr %t117)
  br label %then4_end
then4_end:
  br label %endif4
else4:
  %t118 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.20)
  %t119 = ptrtoint ptr %t118 to i64
  %t120 = inttoptr i64 %t119 to ptr
  call void @intrinsic_println(ptr %t120)
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t121 = phi i64 [ 0, %then4_end ], [ 1, %else4_end ]
  ret i64 %t121
}

define i64 @"test_multiple_constraints"() nounwind {
entry:
  %local.mut.122 = alloca i64
  %local.mut.123 = alloca i64
  %local.mut.124 = alloca i64
  %local.lr.125 = alloca i64
  %local.steps.126 = alloca i64
  %local.mut.127 = alloca i64
  %local.mut.128 = alloca i64
  %local.g0.129 = alloca i64
  %local.g1.130 = alloca i64
  %local.g2.131 = alloca i64
  %local.sum.132 = alloca i64
  %local.deficit.133 = alloca i64
  %local.all_hold.134 = alloca i64
  %t135 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.21)
  %t136 = ptrtoint ptr %t135 to i64
  %t137 = inttoptr i64 %t136 to ptr
  call void @intrinsic_println(ptr %t137)
  %t138 = load i64, ptr %local.w0
  %t139 = call i64 @f64_parse(ptr @.str.exp_invariants.22)
  store i64 %t139, ptr %local.f64
  %t140 = load i64, ptr %local.w1
  %t141 = call i64 @f64_parse(ptr @.str.exp_invariants.23)
  store i64 %t141, ptr %local.f64
  %t142 = load i64, ptr %local.w2
  %t143 = call i64 @f64_parse(ptr @.str.exp_invariants.24)
  store i64 %t143, ptr %local.f64
  %t144 = call i64 @f64_parse(ptr @.str.exp_invariants.25)
  store i64 %t144, ptr %local.lr.125
  store i64 5000, ptr %local.steps.126
  %t145 = load i64, ptr %local.violations
  store i64 0, ptr %local.i64
  %t146 = load i64, ptr %local.step
  store i64 0, ptr %local.i64
  br label %loop5
loop5:
  %t147 = load i64, ptr %local.step
  %t148 = load i64, ptr %local.steps.126
  %t149 = icmp slt i64 %t147, %t148
  %t150 = zext i1 %t149 to i64
  %t151 = icmp ne i64 %t150, 0
  br i1 %t151, label %body5, label %endloop5
body5:
  %t152 = call i64 @f64_parse(ptr @.str.exp_invariants.26)
  %t153 = load i64, ptr %local.w0
  %t154 = call i64 @f64_parse(ptr @.str.exp_invariants.27)
  %t155 = call i64 @"sx_f64_add"(i64 %t153, i64 %t154)
  %t156 = call i64 @"sx_f64_mul"(i64 %t152, i64 %t155)
  store i64 %t156, ptr %local.g0.129
  %t157 = call i64 @f64_parse(ptr @.str.exp_invariants.28)
  %t158 = load i64, ptr %local.w1
  %t159 = call i64 @f64_parse(ptr @.str.exp_invariants.29)
  %t160 = call i64 @"sx_f64_add"(i64 %t158, i64 %t159)
  %t161 = call i64 @"sx_f64_mul"(i64 %t157, i64 %t160)
  store i64 %t161, ptr %local.g1.130
  %t162 = call i64 @f64_parse(ptr @.str.exp_invariants.30)
  %t163 = load i64, ptr %local.w2
  %t164 = call i64 @"sx_f64_mul"(i64 %t162, i64 %t163)
  store i64 %t164, ptr %local.g2.131
  %t165 = load i64, ptr %local.w0
  %t166 = load i64, ptr %local.lr.125
  %t167 = load i64, ptr %local.g0.129
  %t168 = call i64 @"sx_f64_mul"(i64 %t166, i64 %t167)
  %t169 = call i64 @"sx_f64_sub"(i64 %t165, i64 %t168)
  store i64 %t169, ptr %local.w0
  %t170 = load i64, ptr %local.w1
  %t171 = load i64, ptr %local.lr.125
  %t172 = load i64, ptr %local.g1.130
  %t173 = call i64 @"sx_f64_mul"(i64 %t171, i64 %t172)
  %t174 = call i64 @"sx_f64_sub"(i64 %t170, i64 %t173)
  store i64 %t174, ptr %local.w1
  %t175 = load i64, ptr %local.w2
  %t176 = load i64, ptr %local.lr.125
  %t177 = load i64, ptr %local.g2.131
  %t178 = call i64 @"sx_f64_mul"(i64 %t176, i64 %t177)
  %t179 = call i64 @"sx_f64_sub"(i64 %t175, i64 %t178)
  store i64 %t179, ptr %local.w2
  %t180 = load i64, ptr %local.w0
  %t181 = call i64 @f64_parse(ptr @.str.exp_invariants.31)
  %t182 = call i64 @"sx_f64_lt"(i64 %t180, i64 %t181)
  %t183 = icmp ne i64 %t182, 0
  br i1 %t183, label %then6, label %else6
then6:
  %t184 = call i64 @f64_parse(ptr @.str.exp_invariants.32)
  store i64 %t184, ptr %local.w0
  br label %then6_end
then6_end:
  br label %endif6
else6:
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t185 = phi i64 [ 0, %then6_end ], [ 0, %else6_end ]
  %t186 = load i64, ptr %local.w1
  %t187 = call i64 @f64_parse(ptr @.str.exp_invariants.33)
  %t188 = xor i64 %t187, -9223372036854775808
  %t189 = icmp slt i64 %t186, %t188
  %t190 = zext i1 %t189 to i64
  %t191 = icmp ne i64 %t190, 0
  br i1 %t191, label %then7, label %else7
then7:
  %t192 = call i64 @f64_parse(ptr @.str.exp_invariants.34)
  %t193 = xor i64 %t192, -9223372036854775808
  store i64 %t193, ptr %local.w1
  br label %then7_end
then7_end:
  br label %endif7
else7:
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t194 = phi i64 [ 0, %then7_end ], [ 0, %else7_end ]
  %t195 = load i64, ptr %local.w0
  %t196 = load i64, ptr %local.w1
  %t197 = add i64 %t195, %t196
  store i64 %t197, ptr %local.sum.132
  %t198 = load i64, ptr %local.sum.132
  %t199 = call i64 @f64_parse(ptr @.str.exp_invariants.35)
  %t200 = call i64 @"sx_f64_lt"(i64 %t198, i64 %t199)
  %t201 = icmp ne i64 %t200, 0
  br i1 %t201, label %then8, label %else8
then8:
  %t202 = call i64 @f64_parse(ptr @.str.exp_invariants.36)
  %t203 = load i64, ptr %local.sum.132
  %t204 = call i64 @"sx_f64_sub"(i64 %t202, i64 %t203)
  store i64 %t204, ptr %local.deficit.133
  %t205 = load i64, ptr %local.w0
  %t206 = load i64, ptr %local.deficit.133
  %t207 = call i64 @f64_parse(ptr @.str.exp_invariants.37)
  %t208 = call i64 @"sx_f64_div"(i64 %t206, i64 %t207)
  %t209 = call i64 @"sx_f64_add"(i64 %t205, i64 %t208)
  store i64 %t209, ptr %local.w0
  %t210 = load i64, ptr %local.w1
  %t211 = load i64, ptr %local.deficit.133
  %t212 = call i64 @f64_parse(ptr @.str.exp_invariants.38)
  %t213 = call i64 @"sx_f64_div"(i64 %t211, i64 %t212)
  %t214 = call i64 @"sx_f64_add"(i64 %t210, i64 %t213)
  store i64 %t214, ptr %local.w1
  br label %then8_end
then8_end:
  br label %endif8
else8:
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t215 = phi i64 [ 0, %then8_end ], [ 0, %else8_end ]
  %t216 = load i64, ptr %local.w0
  %t217 = call i64 @f64_parse(ptr @.str.exp_invariants.39)
  %t218 = call i64 @"sx_f64_le"(i64 %t216, i64 %t217)
  %t219 = icmp ne i64 %t218, 0
  br i1 %t219, label %then9, label %else9
then9:
  %t220 = load i64, ptr %local.violations
  %t221 = add i64 %t220, 1
  store i64 %t221, ptr %local.violations
  br label %then9_end
then9_end:
  br label %endif9
else9:
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t222 = phi i64 [ 0, %then9_end ], [ 0, %else9_end ]
  %t223 = load i64, ptr %local.w1
  %t224 = call i64 @f64_parse(ptr @.str.exp_invariants.40)
  %t225 = xor i64 %t224, -9223372036854775808
  %t226 = icmp sle i64 %t223, %t225
  %t227 = zext i1 %t226 to i64
  %t228 = icmp ne i64 %t227, 0
  br i1 %t228, label %then10, label %else10
then10:
  %t229 = load i64, ptr %local.violations
  %t230 = add i64 %t229, 1
  store i64 %t230, ptr %local.violations
  br label %then10_end
then10_end:
  br label %endif10
else10:
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t231 = phi i64 [ 0, %then10_end ], [ 0, %else10_end ]
  %t232 = load i64, ptr %local.w0
  %t233 = load i64, ptr %local.w1
  %t234 = add i64 %t232, %t233
  %t235 = call i64 @f64_parse(ptr @.str.exp_invariants.41)
  %t236 = call i64 @"sx_f64_le"(i64 %t234, i64 %t235)
  %t237 = icmp ne i64 %t236, 0
  br i1 %t237, label %then11, label %else11
then11:
  %t238 = load i64, ptr %local.violations
  %t239 = add i64 %t238, 1
  store i64 %t239, ptr %local.violations
  br label %then11_end
then11_end:
  br label %endif11
else11:
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t240 = phi i64 [ 0, %then11_end ], [ 0, %else11_end ]
  %t241 = load i64, ptr %local.step
  %t242 = add i64 %t241, 1
  store i64 %t242, ptr %local.step
  br label %loop5
endloop5:
  %t243 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.42)
  %t244 = ptrtoint ptr %t243 to i64
  %t245 = inttoptr i64 %t244 to ptr
  call void @intrinsic_print(ptr %t245)
  %t246 = load i64, ptr %local.w0
  %t247 = call i64 @"print_f64"(i64 %t246)
  %t248 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.43)
  %t249 = ptrtoint ptr %t248 to i64
  %t250 = inttoptr i64 %t249 to ptr
  call void @intrinsic_print(ptr %t250)
  %t251 = load i64, ptr %local.w1
  %t252 = call i64 @"print_f64"(i64 %t251)
  %t253 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.44)
  %t254 = ptrtoint ptr %t253 to i64
  %t255 = inttoptr i64 %t254 to ptr
  call void @intrinsic_print(ptr %t255)
  %t256 = load i64, ptr %local.w2
  %t257 = call i64 @"print_f64"(i64 %t256)
  %t258 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.45)
  %t259 = ptrtoint ptr %t258 to i64
  %t260 = inttoptr i64 %t259 to ptr
  call void @intrinsic_println(ptr %t260)
  %t261 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.46)
  %t262 = ptrtoint ptr %t261 to i64
  %t263 = inttoptr i64 %t262 to ptr
  call void @intrinsic_print(ptr %t263)
  %t264 = load i64, ptr %local.w0
  %t265 = load i64, ptr %local.w1
  %t266 = add i64 %t264, %t265
  %t267 = call i64 @"print_f64"(i64 %t266)
  %t268 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.47)
  %t269 = ptrtoint ptr %t268 to i64
  %t270 = inttoptr i64 %t269 to ptr
  call void @intrinsic_println(ptr %t270)
  %t271 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.48)
  %t272 = ptrtoint ptr %t271 to i64
  %t273 = inttoptr i64 %t272 to ptr
  call void @intrinsic_print(ptr %t273)
  %t274 = load i64, ptr %local.violations
  call void @print_i64(i64 %t274)
  %t275 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.49)
  %t276 = ptrtoint ptr %t275 to i64
  %t277 = inttoptr i64 %t276 to ptr
  call void @intrinsic_println(ptr %t277)
  %t278 = load i64, ptr %local.w0
  %t279 = call i64 @f64_parse(ptr @.str.exp_invariants.50)
  %t280 = call i64 @"sx_f64_gt"(i64 %t278, i64 %t279)
  %t281 = load i64, ptr %local.w1
  %t282 = call i64 @f64_parse(ptr @.str.exp_invariants.51)
  %t283 = xor i64 %t282, -9223372036854775808
  %t284 = icmp sgt i64 %t281, %t283
  %t285 = zext i1 %t284 to i64
  %t286 = icmp ne i64 %t280, 0
  %t287 = icmp ne i64 %t285, 0
  %t288 = and i1 %t286, %t287
  %t289 = zext i1 %t288 to i64
  %t290 = load i64, ptr %local.w0
  %t291 = load i64, ptr %local.w1
  %t292 = add i64 %t290, %t291
  %t293 = call i64 @f64_parse(ptr @.str.exp_invariants.52)
  %t294 = call i64 @"sx_f64_gt"(i64 %t292, i64 %t293)
  %t295 = icmp ne i64 %t289, 0
  %t296 = icmp ne i64 %t294, 0
  %t297 = and i1 %t295, %t296
  %t298 = zext i1 %t297 to i64
  %t299 = icmp ne i64 %t298, 0
  br i1 %t299, label %then12, label %else12
then12:
  br label %then12_end
then12_end:
  br label %endif12
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t300 = phi i64 [ 1, %then12_end ], [ 0, %else12_end ]
  store i64 %t300, ptr %local.all_hold.134
  %t301 = load i64, ptr %local.violations
  %t302 = icmp eq i64 %t301, 0
  %t303 = zext i1 %t302 to i64
  %t304 = load i64, ptr %local.all_hold.134
  %t305 = icmp eq i64 %t304, 1
  %t306 = zext i1 %t305 to i64
  %t307 = icmp ne i64 %t303, 0
  %t308 = icmp ne i64 %t306, 0
  %t309 = and i1 %t307, %t308
  %t310 = zext i1 %t309 to i64
  %t311 = icmp ne i64 %t310, 0
  br i1 %t311, label %then13, label %else13
then13:
  %t312 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.53)
  %t313 = ptrtoint ptr %t312 to i64
  %t314 = inttoptr i64 %t313 to ptr
  call void @intrinsic_println(ptr %t314)
  br label %then13_end
then13_end:
  br label %endif13
else13:
  %t315 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.54)
  %t316 = ptrtoint ptr %t315 to i64
  %t317 = inttoptr i64 %t316 to ptr
  call void @intrinsic_println(ptr %t317)
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t318 = phi i64 [ 0, %then13_end ], [ 1, %else13_end ]
  ret i64 %t318
}

define i64 @"test_strong_gradient_constraint"() nounwind {
entry:
  %local.mut.319 = alloca i64
  %local.lr.320 = alloca i64
  %local.steps.321 = alloca i64
  %local.mut.322 = alloca i64
  %local.mut.323 = alloca i64
  %local.mut.324 = alloca i64
  %local.g.325 = alloca i64
  %t326 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.55)
  %t327 = ptrtoint ptr %t326 to i64
  %t328 = inttoptr i64 %t327 to ptr
  call void @intrinsic_println(ptr %t328)
  %t329 = load i64, ptr %local.w0
  %t330 = call i64 @f64_parse(ptr @.str.exp_invariants.56)
  store i64 %t330, ptr %local.f64
  %t331 = call i64 @f64_parse(ptr @.str.exp_invariants.57)
  store i64 %t331, ptr %local.lr.320
  store i64 10000, ptr %local.steps.321
  %t332 = load i64, ptr %local.violations
  store i64 0, ptr %local.i64
  %t333 = load i64, ptr %local.max_gradient
  %t334 = call i64 @f64_parse(ptr @.str.exp_invariants.58)
  store i64 %t334, ptr %local.f64
  %t335 = load i64, ptr %local.step
  store i64 0, ptr %local.i64
  br label %loop14
loop14:
  %t336 = load i64, ptr %local.step
  %t337 = load i64, ptr %local.steps.321
  %t338 = icmp slt i64 %t336, %t337
  %t339 = zext i1 %t338 to i64
  %t340 = icmp ne i64 %t339, 0
  br i1 %t340, label %body14, label %endloop14
body14:
  %t341 = call i64 @f64_parse(ptr @.str.exp_invariants.59)
  %t342 = load i64, ptr %local.w0
  %t343 = call i64 @f64_parse(ptr @.str.exp_invariants.60)
  %t344 = call i64 @"sx_f64_add"(i64 %t342, i64 %t343)
  %t345 = call i64 @"sx_f64_mul"(i64 %t341, i64 %t344)
  store i64 %t345, ptr %local.g.325
  %t346 = load i64, ptr %local.g.325
  %t347 = call i64 @"abs_f64"(i64 %t346)
  %t348 = load i64, ptr %local.max_gradient
  %t349 = icmp sgt i64 %t347, %t348
  %t350 = zext i1 %t349 to i64
  %t351 = icmp ne i64 %t350, 0
  br i1 %t351, label %then15, label %else15
then15:
  %t352 = load i64, ptr %local.g.325
  %t353 = call i64 @"abs_f64"(i64 %t352)
  store i64 %t353, ptr %local.max_gradient
  br label %then15_end
then15_end:
  br label %endif15
else15:
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t354 = phi i64 [ 0, %then15_end ], [ 0, %else15_end ]
  %t355 = load i64, ptr %local.w0
  %t356 = load i64, ptr %local.lr.320
  %t357 = load i64, ptr %local.g.325
  %t358 = call i64 @"sx_f64_mul"(i64 %t356, i64 %t357)
  %t359 = call i64 @"sx_f64_sub"(i64 %t355, i64 %t358)
  store i64 %t359, ptr %local.w0
  %t360 = load i64, ptr %local.w0
  %t361 = call i64 @f64_parse(ptr @.str.exp_invariants.61)
  %t362 = call i64 @"sx_f64_lt"(i64 %t360, i64 %t361)
  %t363 = icmp ne i64 %t362, 0
  br i1 %t363, label %then16, label %else16
then16:
  %t364 = call i64 @f64_parse(ptr @.str.exp_invariants.62)
  store i64 %t364, ptr %local.w0
  br label %then16_end
then16_end:
  br label %endif16
else16:
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t365 = phi i64 [ 0, %then16_end ], [ 0, %else16_end ]
  %t366 = load i64, ptr %local.w0
  %t367 = call i64 @f64_parse(ptr @.str.exp_invariants.63)
  %t368 = call i64 @"sx_f64_le"(i64 %t366, i64 %t367)
  %t369 = icmp ne i64 %t368, 0
  br i1 %t369, label %then17, label %else17
then17:
  %t370 = load i64, ptr %local.violations
  %t371 = add i64 %t370, 1
  store i64 %t371, ptr %local.violations
  br label %then17_end
then17_end:
  br label %endif17
else17:
  br label %else17_end
else17_end:
  br label %endif17
endif17:
  %t372 = phi i64 [ 0, %then17_end ], [ 0, %else17_end ]
  %t373 = load i64, ptr %local.step
  %t374 = add i64 %t373, 1
  store i64 %t374, ptr %local.step
  br label %loop14
endloop14:
  %t375 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.64)
  %t376 = ptrtoint ptr %t375 to i64
  %t377 = inttoptr i64 %t376 to ptr
  call void @intrinsic_print(ptr %t377)
  %t378 = load i64, ptr %local.max_gradient
  %t379 = call i64 @"print_f64"(i64 %t378)
  %t380 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.65)
  %t381 = ptrtoint ptr %t380 to i64
  %t382 = inttoptr i64 %t381 to ptr
  call void @intrinsic_println(ptr %t382)
  %t383 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.66)
  %t384 = ptrtoint ptr %t383 to i64
  %t385 = inttoptr i64 %t384 to ptr
  call void @intrinsic_print(ptr %t385)
  %t386 = load i64, ptr %local.w0
  %t387 = call i64 @"print_f64"(i64 %t386)
  %t388 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.67)
  %t389 = ptrtoint ptr %t388 to i64
  %t390 = inttoptr i64 %t389 to ptr
  call void @intrinsic_println(ptr %t390)
  %t391 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.68)
  %t392 = ptrtoint ptr %t391 to i64
  %t393 = inttoptr i64 %t392 to ptr
  call void @intrinsic_print(ptr %t393)
  %t394 = load i64, ptr %local.violations
  call void @print_i64(i64 %t394)
  %t395 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.69)
  %t396 = ptrtoint ptr %t395 to i64
  %t397 = inttoptr i64 %t396 to ptr
  call void @intrinsic_println(ptr %t397)
  %t398 = load i64, ptr %local.violations
  %t399 = icmp eq i64 %t398, 0
  %t400 = zext i1 %t399 to i64
  %t401 = load i64, ptr %local.w0
  %t402 = call i64 @f64_parse(ptr @.str.exp_invariants.70)
  %t403 = call i64 @"sx_f64_gt"(i64 %t401, i64 %t402)
  %t404 = icmp ne i64 %t400, 0
  %t405 = icmp ne i64 %t403, 0
  %t406 = and i1 %t404, %t405
  %t407 = zext i1 %t406 to i64
  %t408 = icmp ne i64 %t407, 0
  br i1 %t408, label %then18, label %else18
then18:
  %t409 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.71)
  %t410 = ptrtoint ptr %t409 to i64
  %t411 = inttoptr i64 %t410 to ptr
  call void @intrinsic_println(ptr %t411)
  br label %then18_end
then18_end:
  br label %endif18
else18:
  %t412 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.72)
  %t413 = ptrtoint ptr %t412 to i64
  %t414 = inttoptr i64 %t413 to ptr
  call void @intrinsic_println(ptr %t414)
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t415 = phi i64 [ 0, %then18_end ], [ 1, %else18_end ]
  ret i64 %t415
}

define i64 @"simplex_main"() nounwind {
entry:
  %local.mut.416 = alloca i64
  %t417 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.73)
  %t418 = ptrtoint ptr %t417 to i64
  %t419 = inttoptr i64 %t418 to ptr
  call void @intrinsic_println(ptr %t419)
  %t420 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.74)
  %t421 = ptrtoint ptr %t420 to i64
  %t422 = inttoptr i64 %t421 to ptr
  call void @intrinsic_println(ptr %t422)
  %t423 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.75)
  %t424 = ptrtoint ptr %t423 to i64
  %t425 = inttoptr i64 %t424 to ptr
  call void @intrinsic_println(ptr %t425)
  %t426 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.76)
  %t427 = ptrtoint ptr %t426 to i64
  %t428 = inttoptr i64 %t427 to ptr
  call void @intrinsic_println(ptr %t428)
  %t429 = load i64, ptr %local.failed
  store i64 0, ptr %local.i64
  %t430 = load i64, ptr %local.failed
  %t431 = call i64 @"test_single_constraint"()
  %t432 = add i64 %t430, %t431
  store i64 %t432, ptr %local.failed
  %t433 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.77)
  %t434 = ptrtoint ptr %t433 to i64
  %t435 = inttoptr i64 %t434 to ptr
  call void @intrinsic_println(ptr %t435)
  %t436 = load i64, ptr %local.failed
  %t437 = call i64 @"test_multiple_constraints"()
  %t438 = add i64 %t436, %t437
  store i64 %t438, ptr %local.failed
  %t439 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.78)
  %t440 = ptrtoint ptr %t439 to i64
  %t441 = inttoptr i64 %t440 to ptr
  call void @intrinsic_println(ptr %t441)
  %t442 = load i64, ptr %local.failed
  %t443 = call i64 @"test_strong_gradient_constraint"()
  %t444 = add i64 %t442, %t443
  store i64 %t444, ptr %local.failed
  %t445 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.79)
  %t446 = ptrtoint ptr %t445 to i64
  %t447 = inttoptr i64 %t446 to ptr
  call void @intrinsic_println(ptr %t447)
  %t448 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.80)
  %t449 = ptrtoint ptr %t448 to i64
  %t450 = inttoptr i64 %t449 to ptr
  call void @intrinsic_println(ptr %t450)
  %t451 = load i64, ptr %local.failed
  %t452 = icmp eq i64 %t451, 0
  %t453 = zext i1 %t452 to i64
  %t454 = icmp ne i64 %t453, 0
  br i1 %t454, label %then19, label %else19
then19:
  %t455 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.81)
  %t456 = ptrtoint ptr %t455 to i64
  %t457 = inttoptr i64 %t456 to ptr
  call void @intrinsic_println(ptr %t457)
  br label %then19_end
then19_end:
  br label %endif19
else19:
  %t458 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.82)
  %t459 = ptrtoint ptr %t458 to i64
  %t460 = inttoptr i64 %t459 to ptr
  call void @intrinsic_print(ptr %t460)
  %t461 = load i64, ptr %local.failed
  call void @print_i64(i64 %t461)
  %t462 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.83)
  %t463 = ptrtoint ptr %t462 to i64
  %t464 = inttoptr i64 %t463 to ptr
  call void @intrinsic_println(ptr %t464)
  br label %else19_end
else19_end:
  br label %endif19
endif19:
  %t465 = phi i64 [ 0, %then19_end ], [ 0, %else19_end ]
  %t466 = call ptr @intrinsic_string_new(ptr @.str.exp_invariants.84)
  %t467 = ptrtoint ptr %t466 to i64
  %t468 = inttoptr i64 %t467 to ptr
  call void @intrinsic_println(ptr %t468)
  %t469 = load i64, ptr %local.failed
  ret i64 %t469
}


; String constants
@.str.exp_invariants.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_invariants.1 = private unnamed_addr constant [44 x i8] c"--- Exp 4a: Single Parameter Constraint ---\00"
@.str.exp_invariants.2 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_invariants.3 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_invariants.4 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_invariants.5 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_invariants.6 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_invariants.7 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_invariants.8 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_invariants.9 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_invariants.10 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_invariants.11 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_invariants.12 = private unnamed_addr constant [13 x i8] c"  Final w: (\00"
@.str.exp_invariants.13 = private unnamed_addr constant [3 x i8] c", \00"
@.str.exp_invariants.14 = private unnamed_addr constant [3 x i8] c", \00"
@.str.exp_invariants.15 = private unnamed_addr constant [2 x i8] c")\00"
@.str.exp_invariants.16 = private unnamed_addr constant [25 x i8] c"  Invariant violations: \00"
@.str.exp_invariants.17 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_invariants.18 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_invariants.19 = private unnamed_addr constant [56 x i8] c"  PASS: Invariant maintained, optimum found at boundary\00"
@.str.exp_invariants.20 = private unnamed_addr constant [27 x i8] c"  FAIL: Invariant violated\00"
@.str.exp_invariants.21 = private unnamed_addr constant [37 x i8] c"--- Exp 4b: Multiple Constraints ---\00"
@.str.exp_invariants.22 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_invariants.23 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_invariants.24 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_invariants.25 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_invariants.26 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_invariants.27 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_invariants.28 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_invariants.29 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_invariants.30 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_invariants.31 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_invariants.32 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_invariants.33 = private unnamed_addr constant [6 x i8] c"0.999\00"
@.str.exp_invariants.34 = private unnamed_addr constant [6 x i8] c"0.999\00"
@.str.exp_invariants.35 = private unnamed_addr constant [6 x i8] c"1.001\00"
@.str.exp_invariants.36 = private unnamed_addr constant [6 x i8] c"1.001\00"
@.str.exp_invariants.37 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_invariants.38 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_invariants.39 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_invariants.40 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_invariants.41 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_invariants.42 = private unnamed_addr constant [13 x i8] c"  Final w: (\00"
@.str.exp_invariants.43 = private unnamed_addr constant [3 x i8] c", \00"
@.str.exp_invariants.44 = private unnamed_addr constant [3 x i8] c", \00"
@.str.exp_invariants.45 = private unnamed_addr constant [2 x i8] c")\00"
@.str.exp_invariants.46 = private unnamed_addr constant [13 x i8] c"  w0 + w1 = \00"
@.str.exp_invariants.47 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_invariants.48 = private unnamed_addr constant [15 x i8] c"  Violations: \00"
@.str.exp_invariants.49 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_invariants.50 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_invariants.51 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_invariants.52 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_invariants.53 = private unnamed_addr constant [34 x i8] c"  PASS: All invariants maintained\00"
@.str.exp_invariants.54 = private unnamed_addr constant [28 x i8] c"  FAIL: Invariants violated\00"
@.str.exp_invariants.55 = private unnamed_addr constant [46 x i8] c"--- Exp 4c: Strong Gradient vs Constraint ---\00"
@.str.exp_invariants.56 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_invariants.57 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_invariants.58 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_invariants.59 = private unnamed_addr constant [6 x i8] c"200.0\00"
@.str.exp_invariants.60 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_invariants.61 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_invariants.62 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_invariants.63 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_invariants.64 = private unnamed_addr constant [27 x i8] c"  Max gradient magnitude: \00"
@.str.exp_invariants.65 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_invariants.66 = private unnamed_addr constant [26 x i8] c"  Final w0:              \00"
@.str.exp_invariants.67 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_invariants.68 = private unnamed_addr constant [26 x i8] c"  Violations:            \00"
@.str.exp_invariants.69 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_invariants.70 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_invariants.71 = private unnamed_addr constant [46 x i8] c"  PASS: Constraint held under strong gradient\00"
@.str.exp_invariants.72 = private unnamed_addr constant [28 x i8] c"  FAIL: Constraint violated\00"
@.str.exp_invariants.73 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_invariants.74 = private unnamed_addr constant [38 x i8] c"  EXPERIMENT 4: INVARIANT ENFORCEMENT\00"
@.str.exp_invariants.75 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_invariants.76 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_invariants.77 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_invariants.78 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_invariants.79 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_invariants.80 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_invariants.81 = private unnamed_addr constant [33 x i8] c"  EXPERIMENT 4: ALL TESTS PASSED\00"
@.str.exp_invariants.82 = private unnamed_addr constant [17 x i8] c"  EXPERIMENT 4: \00"
@.str.exp_invariants.83 = private unnamed_addr constant [16 x i8] c" TEST(S) FAILED\00"
@.str.exp_invariants.84 = private unnamed_addr constant [45 x i8] c"============================================\00"
