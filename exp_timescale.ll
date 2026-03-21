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
  %t1 = call i64 @f64_parse(ptr @.str.exp_timescale.0)
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

define i64 @"test_two_timescale"() nounwind {
entry:
  %local.mut.8 = alloca i64
  %local.mut.9 = alloca i64
  %local.fast_lr.10 = alloca i64
  %local.slow_step.11 = alloca i64
  %local.K.12 = alloca i64
  %local.total_steps.13 = alloca i64
  %local.convergence_threshold.14 = alloca i64
  %local.mut.15 = alloca i64
  %local.mut.16 = alloca i64
  %local.mut.17 = alloca i64
  %local.grad.18 = alloca i64
  %local.residual.19 = alloca i64
  %local.rate.20 = alloca i64
  %t21 = call ptr @intrinsic_string_new(ptr @.str.exp_timescale.1)
  %t22 = ptrtoint ptr %t21 to i64
  %t23 = inttoptr i64 %t22 to ptr
  call void @intrinsic_println(ptr %t23)
  %t24 = load i64, ptr %local.w
  %t25 = call i64 @f64_parse(ptr @.str.exp_timescale.2)
  store i64 %t25, ptr %local.f64
  %t26 = load i64, ptr %local.target
  %t27 = call i64 @f64_parse(ptr @.str.exp_timescale.3)
  store i64 %t27, ptr %local.f64
  %t28 = call i64 @f64_parse(ptr @.str.exp_timescale.4)
  store i64 %t28, ptr %local.fast_lr.10
  %t29 = call i64 @f64_parse(ptr @.str.exp_timescale.5)
  store i64 %t29, ptr %local.slow_step.11
  store i64 50, ptr %local.K.12
  store i64 5000, ptr %local.total_steps.13
  %t30 = call i64 @f64_parse(ptr @.str.exp_timescale.6)
  store i64 %t30, ptr %local.convergence_threshold.14
  %t31 = load i64, ptr %local.slow_updates
  store i64 0, ptr %local.i64
  %t32 = load i64, ptr %local.converged_before_update
  store i64 0, ptr %local.i64
  %t33 = load i64, ptr %local.step
  store i64 0, ptr %local.i64
  br label %loop1
loop1:
  %t34 = load i64, ptr %local.step
  %t35 = load i64, ptr %local.total_steps.13
  %t36 = icmp slt i64 %t34, %t35
  %t37 = zext i1 %t36 to i64
  %t38 = icmp ne i64 %t37, 0
  br i1 %t38, label %body1, label %endloop1
body1:
  %t39 = call i64 @f64_parse(ptr @.str.exp_timescale.7)
  %t40 = load i64, ptr %local.w
  %t41 = load i64, ptr %local.target
  %t42 = sub i64 %t40, %t41
  %t43 = call i64 @"sx_f64_mul"(i64 %t39, i64 %t42)
  store i64 %t43, ptr %local.grad.18
  %t44 = load i64, ptr %local.w
  %t45 = load i64, ptr %local.fast_lr.10
  %t46 = load i64, ptr %local.grad.18
  %t47 = call i64 @"sx_f64_mul"(i64 %t45, i64 %t46)
  %t48 = call i64 @"sx_f64_sub"(i64 %t44, i64 %t47)
  store i64 %t48, ptr %local.w
  %t49 = load i64, ptr %local.step
  %t50 = icmp sgt i64 %t49, 0
  %t51 = zext i1 %t50 to i64
  %t52 = load i64, ptr %local.step
  %t53 = load i64, ptr %local.K.12
  %t54 = srem i64 %t52, %t53
  %t55 = icmp eq i64 %t54, 0
  %t56 = zext i1 %t55 to i64
  %t57 = icmp ne i64 %t51, 0
  %t58 = icmp ne i64 %t56, 0
  %t59 = and i1 %t57, %t58
  %t60 = zext i1 %t59 to i64
  %t61 = icmp ne i64 %t60, 0
  br i1 %t61, label %then2, label %else2
then2:
  %t62 = load i64, ptr %local.w
  %t63 = load i64, ptr %local.target
  %t64 = sub i64 %t62, %t63
  %t65 = call i64 @"abs_f64"(i64 %t64)
  store i64 %t65, ptr %local.residual.19
  %t66 = load i64, ptr %local.residual.19
  %t67 = load i64, ptr %local.convergence_threshold.14
  %t68 = call i64 @"sx_f64_lt"(i64 %t66, i64 %t67)
  %t69 = icmp ne i64 %t68, 0
  br i1 %t69, label %then3, label %else3
then3:
  %t70 = load i64, ptr %local.converged_before_update
  %t71 = add i64 %t70, 1
  store i64 %t71, ptr %local.converged_before_update
  br label %then3_end
then3_end:
  br label %endif3
else3:
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t72 = phi i64 [ 0, %then3_end ], [ 0, %else3_end ]
  %t73 = load i64, ptr %local.slow_updates
  %t74 = add i64 %t73, 1
  store i64 %t74, ptr %local.slow_updates
  %t75 = load i64, ptr %local.target
  %t76 = load i64, ptr %local.slow_step.11
  %t77 = call i64 @"sx_f64_sub"(i64 %t75, i64 %t76)
  store i64 %t77, ptr %local.target
  %t78 = load i64, ptr %local.target
  %t79 = call i64 @f64_parse(ptr @.str.exp_timescale.8)
  %t80 = xor i64 %t79, -9223372036854775808
  %t81 = icmp slt i64 %t78, %t80
  %t82 = zext i1 %t81 to i64
  %t83 = icmp ne i64 %t82, 0
  br i1 %t83, label %then4, label %else4
then4:
  %t84 = call i64 @f64_parse(ptr @.str.exp_timescale.9)
  store i64 %t84, ptr %local.target
  br label %then4_end
then4_end:
  br label %endif4
else4:
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t85 = phi i64 [ 0, %then4_end ], [ 0, %else4_end ]
  br label %then2_end
then2_end:
  br label %endif2
else2:
  br label %else2_end
else2_end:
  br label %endif2
endif2:
  %t86 = phi i64 [ %t85, %then2_end ], [ 0, %else2_end ]
  %t87 = load i64, ptr %local.step
  %t88 = add i64 %t87, 1
  store i64 %t88, ptr %local.step
  br label %loop1
endloop1:
  %t89 = load i64, ptr %local.slow_updates
  %t90 = icmp sgt i64 %t89, 0
  %t91 = zext i1 %t90 to i64
  %t92 = icmp ne i64 %t91, 0
  br i1 %t92, label %then5, label %else5
then5:
  %t93 = load i64, ptr %local.converged_before_update
  %t94 = call i64 @"sx_int_to_f64"(i64 %t93)
  %t95 = load i64, ptr %local.slow_updates
  %t96 = call i64 @"sx_int_to_f64"(i64 %t95)
  %t97 = call i64 @"sx_f64_div"(i64 %t94, i64 %t96)
  %t98 = call i64 @f64_parse(ptr @.str.exp_timescale.10)
  %t99 = call i64 @"sx_f64_mul"(i64 %t97, i64 %t98)
  br label %then5_end
then5_end:
  br label %endif5
else5:
  %t100 = call i64 @f64_parse(ptr @.str.exp_timescale.11)
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t101 = phi i64 [ %t99, %then5_end ], [ %t100, %else5_end ]
  store i64 %t101, ptr %local.rate.20
  %t102 = call ptr @intrinsic_string_new(ptr @.str.exp_timescale.12)
  %t103 = ptrtoint ptr %t102 to i64
  %t104 = inttoptr i64 %t103 to ptr
  call void @intrinsic_print(ptr %t104)
  %t105 = load i64, ptr %local.slow_updates
  call void @print_i64(i64 %t105)
  %t106 = call ptr @intrinsic_string_new(ptr @.str.exp_timescale.13)
  %t107 = ptrtoint ptr %t106 to i64
  %t108 = inttoptr i64 %t107 to ptr
  call void @intrinsic_println(ptr %t108)
  %t109 = call ptr @intrinsic_string_new(ptr @.str.exp_timescale.14)
  %t110 = ptrtoint ptr %t109 to i64
  %t111 = inttoptr i64 %t110 to ptr
  call void @intrinsic_print(ptr %t111)
  %t112 = load i64, ptr %local.converged_before_update
  call void @print_i64(i64 %t112)
  %t113 = call ptr @intrinsic_string_new(ptr @.str.exp_timescale.15)
  %t114 = ptrtoint ptr %t113 to i64
  %t115 = inttoptr i64 %t114 to ptr
  call void @intrinsic_println(ptr %t115)
  %t116 = call ptr @intrinsic_string_new(ptr @.str.exp_timescale.16)
  %t117 = ptrtoint ptr %t116 to i64
  %t118 = inttoptr i64 %t117 to ptr
  call void @intrinsic_print(ptr %t118)
  %t119 = load i64, ptr %local.rate.20
  %t120 = call i64 @"print_f64"(i64 %t119)
  %t121 = call ptr @intrinsic_string_new(ptr @.str.exp_timescale.17)
  %t122 = ptrtoint ptr %t121 to i64
  %t123 = inttoptr i64 %t122 to ptr
  call void @intrinsic_println(ptr %t123)
  %t124 = load i64, ptr %local.rate.20
  %t125 = call i64 @f64_parse(ptr @.str.exp_timescale.18)
  %t126 = call i64 @"sx_f64_ge"(i64 %t124, i64 %t125)
  %t127 = icmp ne i64 %t126, 0
  br i1 %t127, label %then6, label %else6
then6:
  %t128 = call ptr @intrinsic_string_new(ptr @.str.exp_timescale.19)
  %t129 = ptrtoint ptr %t128 to i64
  %t130 = inttoptr i64 %t129 to ptr
  call void @intrinsic_println(ptr %t130)
  br label %then6_end
then6_end:
  br label %endif6
else6:
  %t131 = call ptr @intrinsic_string_new(ptr @.str.exp_timescale.20)
  %t132 = ptrtoint ptr %t131 to i64
  %t133 = inttoptr i64 %t132 to ptr
  call void @intrinsic_println(ptr %t133)
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t134 = phi i64 [ 0, %then6_end ], [ 1, %else6_end ]
  ret i64 %t134
}

define i64 @"test_three_timescale"() nounwind {
entry:
  %local.mut.135 = alloca i64
  %local.mut.136 = alloca i64
  %local.mut.137 = alloca i64
  %local.fast_lr.138 = alloca i64
  %local.medium_lr.139 = alloca i64
  %local.K1.140 = alloca i64
  %local.K2.141 = alloca i64
  %local.total_steps.142 = alloca i64
  %local.threshold.143 = alloca i64
  %local.mut.144 = alloca i64
  %local.mut.145 = alloca i64
  %local.mut.146 = alloca i64
  %local.mut.147 = alloca i64
  %local.mut.148 = alloca i64
  %local.g_w.149 = alloca i64
  %local.w_residual.150 = alloca i64
  %local.g_v.151 = alloca i64
  %local.v_residual.152 = alloca i64
  %local.rate_w.153 = alloca i64
  %local.rate_v.154 = alloca i64
  %local.pass.155 = alloca i64
  %t156 = call ptr @intrinsic_string_new(ptr @.str.exp_timescale.21)
  %t157 = ptrtoint ptr %t156 to i64
  %t158 = inttoptr i64 %t157 to ptr
  call void @intrinsic_println(ptr %t158)
  %t159 = load i64, ptr %local.w
  %t160 = call i64 @f64_parse(ptr @.str.exp_timescale.22)
  store i64 %t160, ptr %local.f64
  %t161 = load i64, ptr %local.v
  %t162 = call i64 @f64_parse(ptr @.str.exp_timescale.23)
  store i64 %t162, ptr %local.f64
  %t163 = load i64, ptr %local.target
  %t164 = call i64 @f64_parse(ptr @.str.exp_timescale.24)
  store i64 %t164, ptr %local.f64
  %t165 = call i64 @f64_parse(ptr @.str.exp_timescale.25)
  store i64 %t165, ptr %local.fast_lr.138
  %t166 = call i64 @f64_parse(ptr @.str.exp_timescale.26)
  store i64 %t166, ptr %local.medium_lr.139
  store i64 20, ptr %local.K1.140
  store i64 200, ptr %local.K2.141
  store i64 10000, ptr %local.total_steps.142
  %t167 = call i64 @f64_parse(ptr @.str.exp_timescale.27)
  store i64 %t167, ptr %local.threshold.143
  %t168 = load i64, ptr %local.v_updates
  store i64 0, ptr %local.i64
  %t169 = load i64, ptr %local.w_converged_before_v
  store i64 0, ptr %local.i64
  %t170 = load i64, ptr %local.target_updates
  store i64 0, ptr %local.i64
  %t171 = load i64, ptr %local.v_converged_before_target
  store i64 0, ptr %local.i64
  %t172 = load i64, ptr %local.step
  store i64 0, ptr %local.i64
  br label %loop7
loop7:
  %t173 = load i64, ptr %local.step
  %t174 = load i64, ptr %local.total_steps.142
  %t175 = icmp slt i64 %t173, %t174
  %t176 = zext i1 %t175 to i64
  %t177 = icmp ne i64 %t176, 0
  br i1 %t177, label %body7, label %endloop7
body7:
  %t178 = call i64 @f64_parse(ptr @.str.exp_timescale.28)
  %t179 = load i64, ptr %local.w
  %t180 = load i64, ptr %local.v
  %t181 = sub i64 %t179, %t180
  %t182 = call i64 @"sx_f64_mul"(i64 %t178, i64 %t181)
  store i64 %t182, ptr %local.g_w.149
  %t183 = load i64, ptr %local.w
  %t184 = load i64, ptr %local.fast_lr.138
  %t185 = load i64, ptr %local.g_w.149
  %t186 = call i64 @"sx_f64_mul"(i64 %t184, i64 %t185)
  %t187 = call i64 @"sx_f64_sub"(i64 %t183, i64 %t186)
  store i64 %t187, ptr %local.w
  %t188 = load i64, ptr %local.step
  %t189 = icmp sgt i64 %t188, 0
  %t190 = zext i1 %t189 to i64
  %t191 = load i64, ptr %local.step
  %t192 = load i64, ptr %local.K1.140
  %t193 = srem i64 %t191, %t192
  %t194 = icmp eq i64 %t193, 0
  %t195 = zext i1 %t194 to i64
  %t196 = icmp ne i64 %t190, 0
  %t197 = icmp ne i64 %t195, 0
  %t198 = and i1 %t196, %t197
  %t199 = zext i1 %t198 to i64
  %t200 = icmp ne i64 %t199, 0
  br i1 %t200, label %then8, label %else8
then8:
  %t201 = load i64, ptr %local.w
  %t202 = load i64, ptr %local.v
  %t203 = sub i64 %t201, %t202
  %t204 = call i64 @"abs_f64"(i64 %t203)
  store i64 %t204, ptr %local.w_residual.150
  %t205 = load i64, ptr %local.w_residual.150
  %t206 = load i64, ptr %local.threshold.143
  %t207 = call i64 @"sx_f64_lt"(i64 %t205, i64 %t206)
  %t208 = icmp ne i64 %t207, 0
  br i1 %t208, label %then9, label %else9
then9:
  %t209 = load i64, ptr %local.w_converged_before_v
  %t210 = add i64 %t209, 1
  store i64 %t210, ptr %local.w_converged_before_v
  br label %then9_end
then9_end:
  br label %endif9
else9:
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t211 = phi i64 [ 0, %then9_end ], [ 0, %else9_end ]
  %t212 = load i64, ptr %local.v_updates
  %t213 = add i64 %t212, 1
  store i64 %t213, ptr %local.v_updates
  %t214 = call i64 @f64_parse(ptr @.str.exp_timescale.29)
  %t215 = load i64, ptr %local.v
  %t216 = load i64, ptr %local.target
  %t217 = sub i64 %t215, %t216
  %t218 = call i64 @"sx_f64_mul"(i64 %t214, i64 %t217)
  store i64 %t218, ptr %local.g_v.151
  %t219 = load i64, ptr %local.v
  %t220 = load i64, ptr %local.medium_lr.139
  %t221 = load i64, ptr %local.g_v.151
  %t222 = call i64 @"sx_f64_mul"(i64 %t220, i64 %t221)
  %t223 = call i64 @"sx_f64_sub"(i64 %t219, i64 %t222)
  store i64 %t223, ptr %local.v
  br label %then8_end
then8_end:
  br label %endif8
else8:
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t224 = phi i64 [ 0, %then8_end ], [ 0, %else8_end ]
  %t225 = load i64, ptr %local.step
  %t226 = icmp sgt i64 %t225, 0
  %t227 = zext i1 %t226 to i64
  %t228 = load i64, ptr %local.step
  %t229 = load i64, ptr %local.K2.141
  %t230 = srem i64 %t228, %t229
  %t231 = icmp eq i64 %t230, 0
  %t232 = zext i1 %t231 to i64
  %t233 = icmp ne i64 %t227, 0
  %t234 = icmp ne i64 %t232, 0
  %t235 = and i1 %t233, %t234
  %t236 = zext i1 %t235 to i64
  %t237 = icmp ne i64 %t236, 0
  br i1 %t237, label %then10, label %else10
then10:
  %t238 = load i64, ptr %local.v
  %t239 = load i64, ptr %local.target
  %t240 = sub i64 %t238, %t239
  %t241 = call i64 @"abs_f64"(i64 %t240)
  store i64 %t241, ptr %local.v_residual.152
  %t242 = load i64, ptr %local.v_residual.152
  %t243 = load i64, ptr %local.threshold.143
  %t244 = call i64 @"sx_f64_lt"(i64 %t242, i64 %t243)
  %t245 = icmp ne i64 %t244, 0
  br i1 %t245, label %then11, label %else11
then11:
  %t246 = load i64, ptr %local.v_converged_before_target
  %t247 = add i64 %t246, 1
  store i64 %t247, ptr %local.v_converged_before_target
  br label %then11_end
then11_end:
  br label %endif11
else11:
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t248 = phi i64 [ 0, %then11_end ], [ 0, %else11_end ]
  %t249 = load i64, ptr %local.target_updates
  %t250 = add i64 %t249, 1
  store i64 %t250, ptr %local.target_updates
  %t251 = load i64, ptr %local.target
  %t252 = call i64 @f64_parse(ptr @.str.exp_timescale.30)
  %t253 = call i64 @"sx_f64_sub"(i64 %t251, i64 %t252)
  store i64 %t253, ptr %local.target
  %t254 = load i64, ptr %local.target
  %t255 = call i64 @f64_parse(ptr @.str.exp_timescale.31)
  %t256 = xor i64 %t255, -9223372036854775808
  %t257 = icmp slt i64 %t254, %t256
  %t258 = zext i1 %t257 to i64
  %t259 = icmp ne i64 %t258, 0
  br i1 %t259, label %then12, label %else12
then12:
  %t260 = call i64 @f64_parse(ptr @.str.exp_timescale.32)
  store i64 %t260, ptr %local.target
  br label %then12_end
then12_end:
  br label %endif12
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t261 = phi i64 [ 0, %then12_end ], [ 0, %else12_end ]
  br label %then10_end
then10_end:
  br label %endif10
else10:
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t262 = phi i64 [ %t261, %then10_end ], [ 0, %else10_end ]
  %t263 = load i64, ptr %local.step
  %t264 = add i64 %t263, 1
  store i64 %t264, ptr %local.step
  br label %loop7
endloop7:
  %t265 = load i64, ptr %local.v_updates
  %t266 = icmp sgt i64 %t265, 0
  %t267 = zext i1 %t266 to i64
  %t268 = icmp ne i64 %t267, 0
  br i1 %t268, label %then13, label %else13
then13:
  %t269 = load i64, ptr %local.w_converged_before_v
  %t270 = call i64 @"sx_int_to_f64"(i64 %t269)
  %t271 = load i64, ptr %local.v_updates
  %t272 = call i64 @"sx_int_to_f64"(i64 %t271)
  %t273 = call i64 @"sx_f64_div"(i64 %t270, i64 %t272)
  %t274 = call i64 @f64_parse(ptr @.str.exp_timescale.33)
  %t275 = call i64 @"sx_f64_mul"(i64 %t273, i64 %t274)
  br label %then13_end
then13_end:
  br label %endif13
else13:
  %t276 = call i64 @f64_parse(ptr @.str.exp_timescale.34)
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t277 = phi i64 [ %t275, %then13_end ], [ %t276, %else13_end ]
  store i64 %t277, ptr %local.rate_w.153
  %t278 = load i64, ptr %local.target_updates
  %t279 = icmp sgt i64 %t278, 0
  %t280 = zext i1 %t279 to i64
  %t281 = icmp ne i64 %t280, 0
  br i1 %t281, label %then14, label %else14
then14:
  %t282 = load i64, ptr %local.v_converged_before_target
  %t283 = call i64 @"sx_int_to_f64"(i64 %t282)
  %t284 = load i64, ptr %local.target_updates
  %t285 = call i64 @"sx_int_to_f64"(i64 %t284)
  %t286 = call i64 @"sx_f64_div"(i64 %t283, i64 %t285)
  %t287 = call i64 @f64_parse(ptr @.str.exp_timescale.35)
  %t288 = call i64 @"sx_f64_mul"(i64 %t286, i64 %t287)
  br label %then14_end
then14_end:
  br label %endif14
else14:
  %t289 = call i64 @f64_parse(ptr @.str.exp_timescale.36)
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t290 = phi i64 [ %t288, %then14_end ], [ %t289, %else14_end ]
  store i64 %t290, ptr %local.rate_v.154
  %t291 = call ptr @intrinsic_string_new(ptr @.str.exp_timescale.37)
  %t292 = ptrtoint ptr %t291 to i64
  %t293 = inttoptr i64 %t292 to ptr
  call void @intrinsic_print(ptr %t293)
  %t294 = load i64, ptr %local.rate_w.153
  %t295 = call i64 @"print_f64"(i64 %t294)
  %t296 = call ptr @intrinsic_string_new(ptr @.str.exp_timescale.38)
  %t297 = ptrtoint ptr %t296 to i64
  %t298 = inttoptr i64 %t297 to ptr
  call void @intrinsic_println(ptr %t298)
  %t299 = call ptr @intrinsic_string_new(ptr @.str.exp_timescale.39)
  %t300 = ptrtoint ptr %t299 to i64
  %t301 = inttoptr i64 %t300 to ptr
  call void @intrinsic_print(ptr %t301)
  %t302 = load i64, ptr %local.rate_v.154
  %t303 = call i64 @"print_f64"(i64 %t302)
  %t304 = call ptr @intrinsic_string_new(ptr @.str.exp_timescale.40)
  %t305 = ptrtoint ptr %t304 to i64
  %t306 = inttoptr i64 %t305 to ptr
  call void @intrinsic_println(ptr %t306)
  %t307 = load i64, ptr %local.rate_w.153
  %t308 = call i64 @f64_parse(ptr @.str.exp_timescale.41)
  %t309 = call i64 @"sx_f64_ge"(i64 %t307, i64 %t308)
  %t310 = load i64, ptr %local.rate_v.154
  %t311 = call i64 @f64_parse(ptr @.str.exp_timescale.42)
  %t312 = call i64 @"sx_f64_ge"(i64 %t310, i64 %t311)
  %t313 = icmp ne i64 %t309, 0
  %t314 = icmp ne i64 %t312, 0
  %t315 = and i1 %t313, %t314
  %t316 = zext i1 %t315 to i64
  %t317 = icmp ne i64 %t316, 0
  br i1 %t317, label %then15, label %else15
then15:
  br label %then15_end
then15_end:
  br label %endif15
else15:
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t318 = phi i64 [ 1, %then15_end ], [ 0, %else15_end ]
  store i64 %t318, ptr %local.pass.155
  %t319 = load i64, ptr %local.pass.155
  %t320 = icmp eq i64 %t319, 1
  %t321 = zext i1 %t320 to i64
  %t322 = icmp ne i64 %t321, 0
  br i1 %t322, label %then16, label %else16
then16:
  %t323 = call ptr @intrinsic_string_new(ptr @.str.exp_timescale.43)
  %t324 = ptrtoint ptr %t323 to i64
  %t325 = inttoptr i64 %t324 to ptr
  call void @intrinsic_println(ptr %t325)
  br label %then16_end
then16_end:
  br label %endif16
else16:
  %t326 = call ptr @intrinsic_string_new(ptr @.str.exp_timescale.44)
  %t327 = ptrtoint ptr %t326 to i64
  %t328 = inttoptr i64 %t327 to ptr
  call void @intrinsic_println(ptr %t328)
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t329 = phi i64 [ 0, %then16_end ], [ 1, %else16_end ]
  ret i64 %t329
}

define i64 @"test_insufficient_separation"() nounwind {
entry:
  %local.mut.330 = alloca i64
  %local.mut.331 = alloca i64
  %local.fast_lr.332 = alloca i64
  %local.K.333 = alloca i64
  %local.total_steps.334 = alloca i64
  %local.threshold.335 = alloca i64
  %local.mut.336 = alloca i64
  %local.mut.337 = alloca i64
  %local.mut.338 = alloca i64
  %local.grad.339 = alloca i64
  %local.residual.340 = alloca i64
  %local.rate.341 = alloca i64
  %t342 = call ptr @intrinsic_string_new(ptr @.str.exp_timescale.45)
  %t343 = ptrtoint ptr %t342 to i64
  %t344 = inttoptr i64 %t343 to ptr
  call void @intrinsic_println(ptr %t344)
  %t345 = load i64, ptr %local.w
  %t346 = call i64 @f64_parse(ptr @.str.exp_timescale.46)
  store i64 %t346, ptr %local.f64
  %t347 = load i64, ptr %local.target
  %t348 = call i64 @f64_parse(ptr @.str.exp_timescale.47)
  store i64 %t348, ptr %local.f64
  %t349 = call i64 @f64_parse(ptr @.str.exp_timescale.48)
  store i64 %t349, ptr %local.fast_lr.332
  store i64 3, ptr %local.K.333
  store i64 3000, ptr %local.total_steps.334
  %t350 = call i64 @f64_parse(ptr @.str.exp_timescale.49)
  store i64 %t350, ptr %local.threshold.335
  %t351 = load i64, ptr %local.slow_updates
  store i64 0, ptr %local.i64
  %t352 = load i64, ptr %local.converged
  store i64 0, ptr %local.i64
  %t353 = load i64, ptr %local.step
  store i64 0, ptr %local.i64
  br label %loop17
loop17:
  %t354 = load i64, ptr %local.step
  %t355 = load i64, ptr %local.total_steps.334
  %t356 = icmp slt i64 %t354, %t355
  %t357 = zext i1 %t356 to i64
  %t358 = icmp ne i64 %t357, 0
  br i1 %t358, label %body17, label %endloop17
body17:
  %t359 = call i64 @f64_parse(ptr @.str.exp_timescale.50)
  %t360 = load i64, ptr %local.w
  %t361 = load i64, ptr %local.target
  %t362 = sub i64 %t360, %t361
  %t363 = call i64 @"sx_f64_mul"(i64 %t359, i64 %t362)
  store i64 %t363, ptr %local.grad.339
  %t364 = load i64, ptr %local.w
  %t365 = load i64, ptr %local.fast_lr.332
  %t366 = load i64, ptr %local.grad.339
  %t367 = call i64 @"sx_f64_mul"(i64 %t365, i64 %t366)
  %t368 = call i64 @"sx_f64_sub"(i64 %t364, i64 %t367)
  store i64 %t368, ptr %local.w
  %t369 = load i64, ptr %local.step
  %t370 = icmp sgt i64 %t369, 0
  %t371 = zext i1 %t370 to i64
  %t372 = load i64, ptr %local.step
  %t373 = load i64, ptr %local.K.333
  %t374 = srem i64 %t372, %t373
  %t375 = icmp eq i64 %t374, 0
  %t376 = zext i1 %t375 to i64
  %t377 = icmp ne i64 %t371, 0
  %t378 = icmp ne i64 %t376, 0
  %t379 = and i1 %t377, %t378
  %t380 = zext i1 %t379 to i64
  %t381 = icmp ne i64 %t380, 0
  br i1 %t381, label %then18, label %else18
then18:
  %t382 = load i64, ptr %local.w
  %t383 = load i64, ptr %local.target
  %t384 = sub i64 %t382, %t383
  %t385 = call i64 @"abs_f64"(i64 %t384)
  store i64 %t385, ptr %local.residual.340
  %t386 = load i64, ptr %local.residual.340
  %t387 = load i64, ptr %local.threshold.335
  %t388 = call i64 @"sx_f64_lt"(i64 %t386, i64 %t387)
  %t389 = icmp ne i64 %t388, 0
  br i1 %t389, label %then19, label %else19
then19:
  %t390 = load i64, ptr %local.converged
  %t391 = add i64 %t390, 1
  store i64 %t391, ptr %local.converged
  br label %then19_end
then19_end:
  br label %endif19
else19:
  br label %else19_end
else19_end:
  br label %endif19
endif19:
  %t392 = phi i64 [ 0, %then19_end ], [ 0, %else19_end ]
  %t393 = load i64, ptr %local.slow_updates
  %t394 = add i64 %t393, 1
  store i64 %t394, ptr %local.slow_updates
  %t395 = load i64, ptr %local.target
  %t396 = call i64 @f64_parse(ptr @.str.exp_timescale.51)
  %t397 = call i64 @"sx_f64_sub"(i64 %t395, i64 %t396)
  store i64 %t397, ptr %local.target
  %t398 = load i64, ptr %local.target
  %t399 = call i64 @f64_parse(ptr @.str.exp_timescale.52)
  %t400 = xor i64 %t399, -9223372036854775808
  %t401 = icmp slt i64 %t398, %t400
  %t402 = zext i1 %t401 to i64
  %t403 = icmp ne i64 %t402, 0
  br i1 %t403, label %then20, label %else20
then20:
  %t404 = call i64 @f64_parse(ptr @.str.exp_timescale.53)
  store i64 %t404, ptr %local.target
  br label %then20_end
then20_end:
  br label %endif20
else20:
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t405 = phi i64 [ 0, %then20_end ], [ 0, %else20_end ]
  br label %then18_end
then18_end:
  br label %endif18
else18:
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t406 = phi i64 [ %t405, %then18_end ], [ 0, %else18_end ]
  %t407 = load i64, ptr %local.step
  %t408 = add i64 %t407, 1
  store i64 %t408, ptr %local.step
  br label %loop17
endloop17:
  %t409 = load i64, ptr %local.slow_updates
  %t410 = icmp sgt i64 %t409, 0
  %t411 = zext i1 %t410 to i64
  %t412 = icmp ne i64 %t411, 0
  br i1 %t412, label %then21, label %else21
then21:
  %t413 = load i64, ptr %local.converged
  %t414 = call i64 @"sx_int_to_f64"(i64 %t413)
  %t415 = load i64, ptr %local.slow_updates
  %t416 = call i64 @"sx_int_to_f64"(i64 %t415)
  %t417 = call i64 @"sx_f64_div"(i64 %t414, i64 %t416)
  %t418 = call i64 @f64_parse(ptr @.str.exp_timescale.54)
  %t419 = call i64 @"sx_f64_mul"(i64 %t417, i64 %t418)
  br label %then21_end
then21_end:
  br label %endif21
else21:
  %t420 = call i64 @f64_parse(ptr @.str.exp_timescale.55)
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t421 = phi i64 [ %t419, %then21_end ], [ %t420, %else21_end ]
  store i64 %t421, ptr %local.rate.341
  %t422 = call ptr @intrinsic_string_new(ptr @.str.exp_timescale.56)
  %t423 = ptrtoint ptr %t422 to i64
  %t424 = inttoptr i64 %t423 to ptr
  call void @intrinsic_print(ptr %t424)
  %t425 = load i64, ptr %local.rate.341
  %t426 = call i64 @"print_f64"(i64 %t425)
  %t427 = call ptr @intrinsic_string_new(ptr @.str.exp_timescale.57)
  %t428 = ptrtoint ptr %t427 to i64
  %t429 = inttoptr i64 %t428 to ptr
  call void @intrinsic_println(ptr %t429)
  %t430 = load i64, ptr %local.rate.341
  %t431 = call i64 @f64_parse(ptr @.str.exp_timescale.58)
  %t432 = call i64 @"sx_f64_lt"(i64 %t430, i64 %t431)
  %t433 = icmp ne i64 %t432, 0
  br i1 %t433, label %then22, label %else22
then22:
  %t434 = call ptr @intrinsic_string_new(ptr @.str.exp_timescale.59)
  %t435 = ptrtoint ptr %t434 to i64
  %t436 = inttoptr i64 %t435 to ptr
  call void @intrinsic_println(ptr %t436)
  br label %then22_end
then22_end:
  br label %endif22
else22:
  %t437 = call ptr @intrinsic_string_new(ptr @.str.exp_timescale.60)
  %t438 = ptrtoint ptr %t437 to i64
  %t439 = inttoptr i64 %t438 to ptr
  call void @intrinsic_println(ptr %t439)
  br label %else22_end
else22_end:
  br label %endif22
endif22:
  %t440 = phi i64 [ 0, %then22_end ], [ 1, %else22_end ]
  ret i64 %t440
}

define i64 @"simplex_main"() nounwind {
entry:
  %local.mut.441 = alloca i64
  %t442 = call ptr @intrinsic_string_new(ptr @.str.exp_timescale.61)
  %t443 = ptrtoint ptr %t442 to i64
  %t444 = inttoptr i64 %t443 to ptr
  call void @intrinsic_println(ptr %t444)
  %t445 = call ptr @intrinsic_string_new(ptr @.str.exp_timescale.62)
  %t446 = ptrtoint ptr %t445 to i64
  %t447 = inttoptr i64 %t446 to ptr
  call void @intrinsic_println(ptr %t447)
  %t448 = call ptr @intrinsic_string_new(ptr @.str.exp_timescale.63)
  %t449 = ptrtoint ptr %t448 to i64
  %t450 = inttoptr i64 %t449 to ptr
  call void @intrinsic_println(ptr %t450)
  %t451 = call ptr @intrinsic_string_new(ptr @.str.exp_timescale.64)
  %t452 = ptrtoint ptr %t451 to i64
  %t453 = inttoptr i64 %t452 to ptr
  call void @intrinsic_println(ptr %t453)
  %t454 = load i64, ptr %local.failed
  store i64 0, ptr %local.i64
  %t455 = load i64, ptr %local.failed
  %t456 = call i64 @"test_two_timescale"()
  %t457 = add i64 %t455, %t456
  store i64 %t457, ptr %local.failed
  %t458 = call ptr @intrinsic_string_new(ptr @.str.exp_timescale.65)
  %t459 = ptrtoint ptr %t458 to i64
  %t460 = inttoptr i64 %t459 to ptr
  call void @intrinsic_println(ptr %t460)
  %t461 = load i64, ptr %local.failed
  %t462 = call i64 @"test_three_timescale"()
  %t463 = add i64 %t461, %t462
  store i64 %t463, ptr %local.failed
  %t464 = call ptr @intrinsic_string_new(ptr @.str.exp_timescale.66)
  %t465 = ptrtoint ptr %t464 to i64
  %t466 = inttoptr i64 %t465 to ptr
  call void @intrinsic_println(ptr %t466)
  %t467 = load i64, ptr %local.failed
  %t468 = call i64 @"test_insufficient_separation"()
  %t469 = add i64 %t467, %t468
  store i64 %t469, ptr %local.failed
  %t470 = call ptr @intrinsic_string_new(ptr @.str.exp_timescale.67)
  %t471 = ptrtoint ptr %t470 to i64
  %t472 = inttoptr i64 %t471 to ptr
  call void @intrinsic_println(ptr %t472)
  %t473 = call ptr @intrinsic_string_new(ptr @.str.exp_timescale.68)
  %t474 = ptrtoint ptr %t473 to i64
  %t475 = inttoptr i64 %t474 to ptr
  call void @intrinsic_println(ptr %t475)
  %t476 = load i64, ptr %local.failed
  %t477 = icmp eq i64 %t476, 0
  %t478 = zext i1 %t477 to i64
  %t479 = icmp ne i64 %t478, 0
  br i1 %t479, label %then23, label %else23
then23:
  %t480 = call ptr @intrinsic_string_new(ptr @.str.exp_timescale.69)
  %t481 = ptrtoint ptr %t480 to i64
  %t482 = inttoptr i64 %t481 to ptr
  call void @intrinsic_println(ptr %t482)
  br label %then23_end
then23_end:
  br label %endif23
else23:
  %t483 = call ptr @intrinsic_string_new(ptr @.str.exp_timescale.70)
  %t484 = ptrtoint ptr %t483 to i64
  %t485 = inttoptr i64 %t484 to ptr
  call void @intrinsic_print(ptr %t485)
  %t486 = load i64, ptr %local.failed
  call void @print_i64(i64 %t486)
  %t487 = call ptr @intrinsic_string_new(ptr @.str.exp_timescale.71)
  %t488 = ptrtoint ptr %t487 to i64
  %t489 = inttoptr i64 %t488 to ptr
  call void @intrinsic_println(ptr %t489)
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t490 = phi i64 [ 0, %then23_end ], [ 0, %else23_end ]
  %t491 = call ptr @intrinsic_string_new(ptr @.str.exp_timescale.72)
  %t492 = ptrtoint ptr %t491 to i64
  %t493 = inttoptr i64 %t492 to ptr
  call void @intrinsic_println(ptr %t493)
  %t494 = load i64, ptr %local.failed
  ret i64 %t494
}


; String constants
@.str.exp_timescale.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_timescale.1 = private unnamed_addr constant [41 x i8] c"--- Exp 5a: Two-Timescale Separation ---\00"
@.str.exp_timescale.2 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_timescale.3 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_timescale.4 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_timescale.5 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_timescale.6 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_timescale.7 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_timescale.8 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_timescale.9 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_timescale.10 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_timescale.11 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_timescale.12 = private unnamed_addr constant [23 x i8] c"  Slow updates:       \00"
@.str.exp_timescale.13 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_timescale.14 = private unnamed_addr constant [23 x i8] c"  Fast converged:     \00"
@.str.exp_timescale.15 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_timescale.16 = private unnamed_addr constant [23 x i8] c"  Convergence rate:   \00"
@.str.exp_timescale.17 = private unnamed_addr constant [2 x i8] c"%\00"
@.str.exp_timescale.18 = private unnamed_addr constant [5 x i8] c"95.0\00"
@.str.exp_timescale.19 = private unnamed_addr constant [40 x i8] c"  PASS: Timescale separation maintained\00"
@.str.exp_timescale.20 = private unnamed_addr constant [60 x i8] c"  FAIL: Fast system doesn't equilibrate before slow updates\00"
@.str.exp_timescale.21 = private unnamed_addr constant [43 x i8] c"--- Exp 5b: Three-Timescale Separation ---\00"
@.str.exp_timescale.22 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_timescale.23 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_timescale.24 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_timescale.25 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_timescale.26 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_timescale.27 = private unnamed_addr constant [5 x i8] c"0.15\00"
@.str.exp_timescale.28 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_timescale.29 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_timescale.30 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_timescale.31 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_timescale.32 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_timescale.33 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_timescale.34 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_timescale.35 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_timescale.36 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_timescale.37 = private unnamed_addr constant [30 x i8] c"  w converged before v:      \00"
@.str.exp_timescale.38 = private unnamed_addr constant [2 x i8] c"%\00"
@.str.exp_timescale.39 = private unnamed_addr constant [30 x i8] c"  v converged before target: \00"
@.str.exp_timescale.40 = private unnamed_addr constant [2 x i8] c"%\00"
@.str.exp_timescale.41 = private unnamed_addr constant [5 x i8] c"95.0\00"
@.str.exp_timescale.42 = private unnamed_addr constant [5 x i8] c"90.0\00"
@.str.exp_timescale.43 = private unnamed_addr constant [52 x i8] c"  PASS: Three-level timescale separation maintained\00"
@.str.exp_timescale.44 = private unnamed_addr constant [38 x i8] c"  FAIL: Timescale separation violated\00"
@.str.exp_timescale.45 = private unnamed_addr constant [54 x i8] c"--- Exp 5c: Insufficient Separation (Adversarial) ---\00"
@.str.exp_timescale.46 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_timescale.47 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_timescale.48 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_timescale.49 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_timescale.50 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_timescale.51 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_timescale.52 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_timescale.53 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_timescale.54 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_timescale.55 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_timescale.56 = private unnamed_addr constant [21 x i8] c"  Convergence rate: \00"
@.str.exp_timescale.57 = private unnamed_addr constant [2 x i8] c"%\00"
@.str.exp_timescale.58 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_timescale.59 = private unnamed_addr constant [51 x i8] c"  PASS: Correctly detected insufficient separation\00"
@.str.exp_timescale.60 = private unnamed_addr constant [55 x i8] c"  FAIL: System shouldn't converge with K=3 and lr=0.05\00"
@.str.exp_timescale.61 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_timescale.62 = private unnamed_addr constant [37 x i8] c"  EXPERIMENT 5: TIMESCALE SEPARATION\00"
@.str.exp_timescale.63 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_timescale.64 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_timescale.65 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_timescale.66 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_timescale.67 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_timescale.68 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_timescale.69 = private unnamed_addr constant [33 x i8] c"  EXPERIMENT 5: ALL TESTS PASSED\00"
@.str.exp_timescale.70 = private unnamed_addr constant [17 x i8] c"  EXPERIMENT 5: \00"
@.str.exp_timescale.71 = private unnamed_addr constant [16 x i8] c" TEST(S) FAILED\00"
@.str.exp_timescale.72 = private unnamed_addr constant [45 x i8] c"============================================\00"
