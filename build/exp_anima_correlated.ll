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
; Float bit conversion intrinsics
declare i64 @"f64_to_bits"(double)
declare i64 @"bits_to_f64"(i64)
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

define i64 @"abs_f64"(i64 %x) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t0 = load i64, ptr %local.x
  %t1 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"lcg_next"(i64 %state) nounwind {
entry:
  %local.state = alloca i64
  store i64 %state, ptr %local.state
  %t9 = load i64, ptr %local.state
  %t10 = mul i64 %t9, 1664525
  %t11 = add i64 %t10, 1013904223
  ret i64 %t11
}

define i64 @"lcg_f64"(i64 %state) nounwind {
entry:
  %local.s.12 = alloca i64
  %local.state = alloca i64
  store i64 %state, ptr %local.state
  %t13 = load i64, ptr %local.state
  store i64 %t13, ptr %local.s.12
  %t14 = load i64, ptr %local.s.12
  %t15 = icmp slt i64 %t14, 0
  %t16 = zext i1 %t15 to i64
  %t17 = icmp ne i64 %t16, 0
  br i1 %t17, label %then1, label %else1
then1:
  %t18 = load i64, ptr %local.s.12
  %t19 = sub i64 0, %t18
  store i64 %t19, ptr %local.s.12
  br label %then1_end
then1_end:
  br label %endif1
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t20 = phi i64 [ 0, %then1_end ], [ 0, %else1_end ]
  %t21 = load i64, ptr %local.s.12
  %t22 = srem i64 %t21, 10000
  %t23 = call i64 @"sx_int_to_f64"(i64 %t22)
  %t24 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.2)
  %t25 = call i64 @"sx_f64_div"(i64 %t23, i64 %t24)
  ret i64 %t25
}

define i64 @"beta_mean"(i64 %a, i64 %b) nounwind {
entry:
  %local.a = alloca i64
  store i64 %a, ptr %local.a
  %local.b = alloca i64
  store i64 %b, ptr %local.b
  %t26 = load i64, ptr %local.a
  %t27 = load i64, ptr %local.a
  %t28 = load i64, ptr %local.b
  %t29 = call i64 @"sx_f64_add"(i64 %t27, i64 %t28)
  %t30 = call i64 @"sx_f64_div"(i64 %t26, i64 %t29)
  ret i64 %t30
}

define i64 @"clamp"(i64 %x, i64 %lo, i64 %hi) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %local.lo = alloca i64
  store i64 %lo, ptr %local.lo
  %local.hi = alloca i64
  store i64 %hi, ptr %local.hi
  %t31 = load i64, ptr %local.x
  %t32 = load i64, ptr %local.lo
  %t33 = call i64 @"sx_f64_lt"(i64 %t31, i64 %t32)
  %t34 = icmp ne i64 %t33, 0
  br i1 %t34, label %then2, label %else2
then2:
  %t35 = load i64, ptr %local.lo
  ret i64 %t35
else2:
  br label %else2_end
else2_end:
  br label %endif2
endif2:
  %t36 = phi i64 [ 0, %else2_end ]
  %t37 = load i64, ptr %local.x
  %t38 = load i64, ptr %local.hi
  %t39 = call i64 @"sx_f64_gt"(i64 %t37, i64 %t38)
  %t40 = icmp ne i64 %t39, 0
  br i1 %t40, label %then3, label %else3
then3:
  %t41 = load i64, ptr %local.hi
  ret i64 %t41
else3:
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t42 = phi i64 [ 0, %else3_end ]
  %t43 = load i64, ptr %local.x
  ret i64 %t43
}

define i64 @"train_correlated"(i64 %alpha_ab, i64 %alpha_ba, i64 %true_a, i64 %true_b, i64 %correlation, i64 %observations, i64 %seed) nounwind {
entry:
  %local.a_al.44 = alloca i64
  %local.a_be.45 = alloca i64
  %local.b_al.46 = alloca i64
  %local.b_be.47 = alloca i64
  %local.rng.48 = alloca i64
  %local.step.49 = alloca i64
  %local.conf_a.50 = alloca i64
  %local.conf_b.51 = alloca i64
  %local.boost.52 = alloca i64
  %local.obs_a.53 = alloca i64
  %local.obs_b.54 = alloca i64
  %local.err_a.55 = alloca i64
  %local.err_b.56 = alloca i64
  %local.alpha_ab = alloca i64
  store i64 %alpha_ab, ptr %local.alpha_ab
  %local.alpha_ba = alloca i64
  store i64 %alpha_ba, ptr %local.alpha_ba
  %local.true_a = alloca i64
  store i64 %true_a, ptr %local.true_a
  %local.true_b = alloca i64
  store i64 %true_b, ptr %local.true_b
  %local.correlation = alloca i64
  store i64 %correlation, ptr %local.correlation
  %local.observations = alloca i64
  store i64 %observations, ptr %local.observations
  %local.seed = alloca i64
  store i64 %seed, ptr %local.seed
  %t57 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.3)
  store i64 %t57, ptr %local.a_al.44
  %t58 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.4)
  store i64 %t58, ptr %local.a_be.45
  %t59 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.5)
  store i64 %t59, ptr %local.b_al.46
  %t60 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.6)
  store i64 %t60, ptr %local.b_be.47
  %t61 = load i64, ptr %local.seed
  store i64 %t61, ptr %local.rng.48
  store i64 0, ptr %local.step.49
  %t62 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.7)
  store i64 %t62, ptr %local.conf_a.50
  %t63 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.8)
  store i64 %t63, ptr %local.conf_b.51
  %t64 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.9)
  store i64 %t64, ptr %local.boost.52
  br label %loop4
loop4:
  %t65 = load i64, ptr %local.step.49
  %t66 = load i64, ptr %local.observations
  %t67 = icmp slt i64 %t65, %t66
  %t68 = zext i1 %t67 to i64
  %t69 = icmp ne i64 %t68, 0
  br i1 %t69, label %body4, label %endloop4
body4:
  %t70 = load i64, ptr %local.a_al.44
  %t71 = load i64, ptr %local.a_be.45
  %t72 = call i64 @"beta_mean"(i64 %t70, i64 %t71)
  store i64 %t72, ptr %local.conf_a.50
  %t73 = load i64, ptr %local.b_al.46
  %t74 = load i64, ptr %local.b_be.47
  %t75 = call i64 @"beta_mean"(i64 %t73, i64 %t74)
  store i64 %t75, ptr %local.conf_b.51
  %t76 = load i64, ptr %local.rng.48
  %t77 = call i64 @"lcg_next"(i64 %t76)
  store i64 %t77, ptr %local.rng.48
  %t78 = load i64, ptr %local.rng.48
  %t79 = call i64 @"lcg_f64"(i64 %t78)
  store i64 %t79, ptr %local.obs_a.53
  %t80 = load i64, ptr %local.obs_a.53
  %t81 = load i64, ptr %local.true_a
  %t82 = call i64 @"sx_f64_lt"(i64 %t80, i64 %t81)
  %t83 = icmp ne i64 %t82, 0
  br i1 %t83, label %then5, label %else5
then5:
  %t84 = load i64, ptr %local.a_al.44
  %t85 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.10)
  %t86 = call i64 @"sx_f64_add"(i64 %t84, i64 %t85)
  store i64 %t86, ptr %local.a_al.44
  %t87 = load i64, ptr %local.alpha_ab
  %t88 = load i64, ptr %local.conf_a.50
  %t89 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.11)
  %t90 = call i64 @"sx_f64_sub"(i64 %t88, i64 %t89)
  %t91 = call i64 @"sx_f64_mul"(i64 %t87, i64 %t90)
  %t92 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.12)
  %t93 = call i64 @"sx_f64_mul"(i64 %t91, i64 %t92)
  store i64 %t93, ptr %local.boost.52
  %t94 = load i64, ptr %local.boost.52
  %t95 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.13)
  %t96 = call i64 @"sx_f64_gt"(i64 %t94, i64 %t95)
  %t97 = icmp ne i64 %t96, 0
  br i1 %t97, label %then6, label %else6
then6:
  %t98 = load i64, ptr %local.b_al.46
  %t99 = load i64, ptr %local.boost.52
  %t100 = call i64 @"sx_f64_add"(i64 %t98, i64 %t99)
  store i64 %t100, ptr %local.b_al.46
  br label %then6_end
then6_end:
  br label %endif6
else6:
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t101 = phi i64 [ 0, %then6_end ], [ 0, %else6_end ]
  %t102 = load i64, ptr %local.rng.48
  %t103 = call i64 @"lcg_next"(i64 %t102)
  store i64 %t103, ptr %local.rng.48
  %t104 = load i64, ptr %local.rng.48
  %t105 = call i64 @"lcg_f64"(i64 %t104)
  %t106 = load i64, ptr %local.correlation
  %t107 = call i64 @"sx_f64_lt"(i64 %t105, i64 %t106)
  %t108 = icmp ne i64 %t107, 0
  br i1 %t108, label %then7, label %else7
then7:
  %t109 = load i64, ptr %local.b_al.46
  %t110 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.14)
  %t111 = call i64 @"sx_f64_add"(i64 %t109, i64 %t110)
  store i64 %t111, ptr %local.b_al.46
  br label %then7_end
then7_end:
  br label %endif7
else7:
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t112 = phi i64 [ 0, %then7_end ], [ 0, %else7_end ]
  br label %then5_end
then5_end:
  br label %endif5
else5:
  %t113 = load i64, ptr %local.a_be.45
  %t114 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.15)
  %t115 = call i64 @"sx_f64_add"(i64 %t113, i64 %t114)
  store i64 %t115, ptr %local.a_be.45
  %t116 = load i64, ptr %local.rng.48
  %t117 = call i64 @"lcg_next"(i64 %t116)
  store i64 %t117, ptr %local.rng.48
  %t118 = load i64, ptr %local.rng.48
  %t119 = call i64 @"lcg_f64"(i64 %t118)
  %t120 = load i64, ptr %local.correlation
  %t121 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.16)
  %t122 = call i64 @"sx_f64_mul"(i64 %t120, i64 %t121)
  %t123 = call i64 @"sx_f64_lt"(i64 %t119, i64 %t122)
  %t124 = icmp ne i64 %t123, 0
  br i1 %t124, label %then8, label %else8
then8:
  %t125 = load i64, ptr %local.b_be.47
  %t126 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.17)
  %t127 = call i64 @"sx_f64_add"(i64 %t125, i64 %t126)
  store i64 %t127, ptr %local.b_be.47
  br label %then8_end
then8_end:
  br label %endif8
else8:
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t128 = phi i64 [ 0, %then8_end ], [ 0, %else8_end ]
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t129 = phi i64 [ %t112, %then5_end ], [ %t128, %else5_end ]
  %t130 = load i64, ptr %local.rng.48
  %t131 = call i64 @"lcg_next"(i64 %t130)
  store i64 %t131, ptr %local.rng.48
  %t132 = load i64, ptr %local.rng.48
  %t133 = call i64 @"lcg_f64"(i64 %t132)
  store i64 %t133, ptr %local.obs_b.54
  %t134 = load i64, ptr %local.obs_b.54
  %t135 = load i64, ptr %local.true_b
  %t136 = call i64 @"sx_f64_lt"(i64 %t134, i64 %t135)
  %t137 = icmp ne i64 %t136, 0
  br i1 %t137, label %then9, label %else9
then9:
  %t138 = load i64, ptr %local.b_al.46
  %t139 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.18)
  %t140 = call i64 @"sx_f64_add"(i64 %t138, i64 %t139)
  store i64 %t140, ptr %local.b_al.46
  %t141 = load i64, ptr %local.alpha_ba
  %t142 = load i64, ptr %local.conf_b.51
  %t143 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.19)
  %t144 = call i64 @"sx_f64_sub"(i64 %t142, i64 %t143)
  %t145 = call i64 @"sx_f64_mul"(i64 %t141, i64 %t144)
  %t146 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.20)
  %t147 = call i64 @"sx_f64_mul"(i64 %t145, i64 %t146)
  store i64 %t147, ptr %local.boost.52
  %t148 = load i64, ptr %local.boost.52
  %t149 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.21)
  %t150 = call i64 @"sx_f64_gt"(i64 %t148, i64 %t149)
  %t151 = icmp ne i64 %t150, 0
  br i1 %t151, label %then10, label %else10
then10:
  %t152 = load i64, ptr %local.a_al.44
  %t153 = load i64, ptr %local.boost.52
  %t154 = call i64 @"sx_f64_add"(i64 %t152, i64 %t153)
  store i64 %t154, ptr %local.a_al.44
  br label %then10_end
then10_end:
  br label %endif10
else10:
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t155 = phi i64 [ 0, %then10_end ], [ 0, %else10_end ]
  br label %then9_end
then9_end:
  br label %endif9
else9:
  %t156 = load i64, ptr %local.b_be.47
  %t157 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.22)
  %t158 = call i64 @"sx_f64_add"(i64 %t156, i64 %t157)
  store i64 %t158, ptr %local.b_be.47
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t159 = phi i64 [ %t155, %then9_end ], [ 0, %else9_end ]
  %t160 = load i64, ptr %local.step.49
  %t161 = add i64 %t160, 1
  store i64 %t161, ptr %local.step.49
  br label %loop4
endloop4:
  %t162 = load i64, ptr %local.a_al.44
  %t163 = load i64, ptr %local.a_be.45
  %t164 = call i64 @"beta_mean"(i64 %t162, i64 %t163)
  %t165 = load i64, ptr %local.true_a
  %t166 = call i64 @"sx_f64_sub"(i64 %t164, i64 %t165)
  store i64 %t166, ptr %local.err_a.55
  %t167 = load i64, ptr %local.b_al.46
  %t168 = load i64, ptr %local.b_be.47
  %t169 = call i64 @"beta_mean"(i64 %t167, i64 %t168)
  %t170 = load i64, ptr %local.true_b
  %t171 = call i64 @"sx_f64_sub"(i64 %t169, i64 %t170)
  store i64 %t171, ptr %local.err_b.56
  %t172 = load i64, ptr %local.err_a.55
  %t173 = load i64, ptr %local.err_a.55
  %t174 = call i64 @"sx_f64_mul"(i64 %t172, i64 %t173)
  %t175 = load i64, ptr %local.err_b.56
  %t176 = load i64, ptr %local.err_b.56
  %t177 = call i64 @"sx_f64_mul"(i64 %t175, i64 %t176)
  %t178 = call i64 @"sx_f64_add"(i64 %t174, i64 %t177)
  ret i64 %t178
}

define i64 @"mg_corr"(i64 %ab, i64 %ba, i64 %ta, i64 %tb, i64 %corr, i64 %obs, i64 %which) nounwind {
entry:
  %local.h.179 = alloca i64
  %local.abp.180 = alloca i64
  %local.bap.181 = alloca i64
  %local.abm.182 = alloca i64
  %local.bam.183 = alloca i64
  %local.lp.184 = alloca i64
  %local.lm.185 = alloca i64
  %local.ab = alloca i64
  store i64 %ab, ptr %local.ab
  %local.ba = alloca i64
  store i64 %ba, ptr %local.ba
  %local.ta = alloca i64
  store i64 %ta, ptr %local.ta
  %local.tb = alloca i64
  store i64 %tb, ptr %local.tb
  %local.corr = alloca i64
  store i64 %corr, ptr %local.corr
  %local.obs = alloca i64
  store i64 %obs, ptr %local.obs
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %t186 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.23)
  store i64 %t186, ptr %local.h.179
  %t187 = load i64, ptr %local.ab
  store i64 %t187, ptr %local.abp.180
  %t188 = load i64, ptr %local.ba
  store i64 %t188, ptr %local.bap.181
  %t189 = load i64, ptr %local.ab
  store i64 %t189, ptr %local.abm.182
  %t190 = load i64, ptr %local.ba
  store i64 %t190, ptr %local.bam.183
  %t191 = load i64, ptr %local.which
  %t192 = icmp eq i64 %t191, 0
  %t193 = zext i1 %t192 to i64
  %t194 = icmp ne i64 %t193, 0
  br i1 %t194, label %then11, label %else11
then11:
  %t195 = load i64, ptr %local.ab
  %t196 = load i64, ptr %local.h.179
  %t197 = call i64 @"sx_f64_add"(i64 %t195, i64 %t196)
  store i64 %t197, ptr %local.abp.180
  %t198 = load i64, ptr %local.ab
  %t199 = load i64, ptr %local.h.179
  %t200 = call i64 @"sx_f64_sub"(i64 %t198, i64 %t199)
  store i64 %t200, ptr %local.abm.182
  br label %then11_end
then11_end:
  br label %endif11
else11:
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t201 = phi i64 [ 0, %then11_end ], [ 0, %else11_end ]
  %t202 = load i64, ptr %local.which
  %t203 = icmp eq i64 %t202, 1
  %t204 = zext i1 %t203 to i64
  %t205 = icmp ne i64 %t204, 0
  br i1 %t205, label %then12, label %else12
then12:
  %t206 = load i64, ptr %local.ba
  %t207 = load i64, ptr %local.h.179
  %t208 = call i64 @"sx_f64_add"(i64 %t206, i64 %t207)
  store i64 %t208, ptr %local.bap.181
  %t209 = load i64, ptr %local.ba
  %t210 = load i64, ptr %local.h.179
  %t211 = call i64 @"sx_f64_sub"(i64 %t209, i64 %t210)
  store i64 %t211, ptr %local.bam.183
  br label %then12_end
then12_end:
  br label %endif12
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t212 = phi i64 [ 0, %then12_end ], [ 0, %else12_end ]
  %t213 = load i64, ptr %local.abp.180
  %t214 = load i64, ptr %local.bap.181
  %t215 = load i64, ptr %local.ta
  %t216 = load i64, ptr %local.tb
  %t217 = load i64, ptr %local.corr
  %t218 = load i64, ptr %local.obs
  %t219 = call i64 @"train_correlated"(i64 %t213, i64 %t214, i64 %t215, i64 %t216, i64 %t217, i64 %t218, i64 42)
  %t220 = load i64, ptr %local.abp.180
  %t221 = load i64, ptr %local.bap.181
  %t222 = load i64, ptr %local.ta
  %t223 = load i64, ptr %local.tb
  %t224 = load i64, ptr %local.corr
  %t225 = load i64, ptr %local.obs
  %t226 = call i64 @"train_correlated"(i64 %t220, i64 %t221, i64 %t222, i64 %t223, i64 %t224, i64 %t225, i64 137)
  %t227 = call i64 @"sx_f64_add"(i64 %t219, i64 %t226)
  %t228 = load i64, ptr %local.abp.180
  %t229 = load i64, ptr %local.bap.181
  %t230 = load i64, ptr %local.ta
  %t231 = load i64, ptr %local.tb
  %t232 = load i64, ptr %local.corr
  %t233 = load i64, ptr %local.obs
  %t234 = call i64 @"train_correlated"(i64 %t228, i64 %t229, i64 %t230, i64 %t231, i64 %t232, i64 %t233, i64 999)
  %t235 = call i64 @"sx_f64_add"(i64 %t227, i64 %t234)
  store i64 %t235, ptr %local.lp.184
  %t236 = load i64, ptr %local.abm.182
  %t237 = load i64, ptr %local.bam.183
  %t238 = load i64, ptr %local.ta
  %t239 = load i64, ptr %local.tb
  %t240 = load i64, ptr %local.corr
  %t241 = load i64, ptr %local.obs
  %t242 = call i64 @"train_correlated"(i64 %t236, i64 %t237, i64 %t238, i64 %t239, i64 %t240, i64 %t241, i64 42)
  %t243 = load i64, ptr %local.abm.182
  %t244 = load i64, ptr %local.bam.183
  %t245 = load i64, ptr %local.ta
  %t246 = load i64, ptr %local.tb
  %t247 = load i64, ptr %local.corr
  %t248 = load i64, ptr %local.obs
  %t249 = call i64 @"train_correlated"(i64 %t243, i64 %t244, i64 %t245, i64 %t246, i64 %t247, i64 %t248, i64 137)
  %t250 = call i64 @"sx_f64_add"(i64 %t242, i64 %t249)
  %t251 = load i64, ptr %local.abm.182
  %t252 = load i64, ptr %local.bam.183
  %t253 = load i64, ptr %local.ta
  %t254 = load i64, ptr %local.tb
  %t255 = load i64, ptr %local.corr
  %t256 = load i64, ptr %local.obs
  %t257 = call i64 @"train_correlated"(i64 %t251, i64 %t252, i64 %t253, i64 %t254, i64 %t255, i64 %t256, i64 999)
  %t258 = call i64 @"sx_f64_add"(i64 %t250, i64 %t257)
  store i64 %t258, ptr %local.lm.185
  %t259 = load i64, ptr %local.lp.184
  %t260 = load i64, ptr %local.lm.185
  %t261 = call i64 @"sx_f64_sub"(i64 %t259, i64 %t260)
  %t262 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.24)
  %t263 = load i64, ptr %local.h.179
  %t264 = call i64 @"sx_f64_mul"(i64 %t262, i64 %t263)
  %t265 = call i64 @"sx_f64_div"(i64 %t261, i64 %t264)
  ret i64 %t265
}

define i64 @"train_desire_reg"(i64 %true_val, i64 %desire, i64 %coupling, i64 %obs, i64 %seed) nounwind {
entry:
  %local.al.266 = alloca i64
  %local.be.267 = alloca i64
  %local.rng.268 = alloca i64
  %local.step.269 = alloca i64
  %local.conf.270 = alloca i64
  %local.alignment.271 = alloca i64
  %local.boost.272 = alloca i64
  %local.posterior.273 = alloca i64
  %local.err.274 = alloca i64
  %local.true_val = alloca i64
  store i64 %true_val, ptr %local.true_val
  %local.desire = alloca i64
  store i64 %desire, ptr %local.desire
  %local.coupling = alloca i64
  store i64 %coupling, ptr %local.coupling
  %local.obs = alloca i64
  store i64 %obs, ptr %local.obs
  %local.seed = alloca i64
  store i64 %seed, ptr %local.seed
  %t275 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.25)
  store i64 %t275, ptr %local.al.266
  %t276 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.26)
  store i64 %t276, ptr %local.be.267
  %t277 = load i64, ptr %local.seed
  store i64 %t277, ptr %local.rng.268
  store i64 0, ptr %local.step.269
  %t278 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.27)
  store i64 %t278, ptr %local.conf.270
  %t279 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.28)
  store i64 %t279, ptr %local.alignment.271
  %t280 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.29)
  store i64 %t280, ptr %local.boost.272
  br label %loop13
loop13:
  %t281 = load i64, ptr %local.step.269
  %t282 = load i64, ptr %local.obs
  %t283 = icmp slt i64 %t281, %t282
  %t284 = zext i1 %t283 to i64
  %t285 = icmp ne i64 %t284, 0
  br i1 %t285, label %body13, label %endloop13
body13:
  %t286 = load i64, ptr %local.al.266
  %t287 = load i64, ptr %local.be.267
  %t288 = call i64 @"beta_mean"(i64 %t286, i64 %t287)
  store i64 %t288, ptr %local.conf.270
  %t289 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.30)
  %t290 = load i64, ptr %local.conf.270
  %t291 = load i64, ptr %local.desire
  %t292 = call i64 @"sx_f64_sub"(i64 %t290, i64 %t291)
  %t293 = call i64 @"abs_f64"(i64 %t292)
  %t294 = call i64 @"sx_f64_sub"(i64 %t289, i64 %t293)
  store i64 %t294, ptr %local.alignment.271
  %t295 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.31)
  %t296 = load i64, ptr %local.coupling
  %t297 = load i64, ptr %local.alignment.271
  %t298 = call i64 @"sx_f64_mul"(i64 %t296, i64 %t297)
  %t299 = call i64 @"sx_f64_add"(i64 %t295, i64 %t298)
  store i64 %t299, ptr %local.boost.272
  %t300 = load i64, ptr %local.rng.268
  %t301 = call i64 @"lcg_next"(i64 %t300)
  store i64 %t301, ptr %local.rng.268
  %t302 = load i64, ptr %local.rng.268
  %t303 = call i64 @"lcg_f64"(i64 %t302)
  %t304 = load i64, ptr %local.true_val
  %t305 = call i64 @"sx_f64_lt"(i64 %t303, i64 %t304)
  %t306 = icmp ne i64 %t305, 0
  br i1 %t306, label %then14, label %else14
then14:
  %t307 = load i64, ptr %local.al.266
  %t308 = load i64, ptr %local.boost.272
  %t309 = call i64 @"sx_f64_add"(i64 %t307, i64 %t308)
  store i64 %t309, ptr %local.al.266
  br label %then14_end
then14_end:
  br label %endif14
else14:
  %t310 = load i64, ptr %local.be.267
  %t311 = load i64, ptr %local.boost.272
  %t312 = call i64 @"sx_f64_add"(i64 %t310, i64 %t311)
  store i64 %t312, ptr %local.be.267
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t313 = phi i64 [ 0, %then14_end ], [ 0, %else14_end ]
  %t314 = load i64, ptr %local.step.269
  %t315 = add i64 %t314, 1
  store i64 %t315, ptr %local.step.269
  br label %loop13
endloop13:
  %t316 = load i64, ptr %local.al.266
  %t317 = load i64, ptr %local.be.267
  %t318 = call i64 @"beta_mean"(i64 %t316, i64 %t317)
  store i64 %t318, ptr %local.posterior.273
  %t319 = load i64, ptr %local.posterior.273
  %t320 = load i64, ptr %local.true_val
  %t321 = call i64 @"sx_f64_sub"(i64 %t319, i64 %t320)
  store i64 %t321, ptr %local.err.274
  %t322 = load i64, ptr %local.err.274
  %t323 = load i64, ptr %local.err.274
  %t324 = call i64 @"sx_f64_mul"(i64 %t322, i64 %t323)
  ret i64 %t324
}

define i64 @"simplex_main"() nounwind {
entry:
  %local.true_a.325 = alloca i64
  %local.true_b.326 = alloca i64
  %local.corr.327 = alloca i64
  %local.obs.328 = alloca i64
  %local.loss_indep.329 = alloca i64
  %local.ab.330 = alloca i64
  %local.ba.331 = alloca i64
  %local.mg.332 = alloca i64
  %local.cycle.333 = alloca i64
  %local.loss_interact.334 = alloca i64
  %local.loss_uncorr_indep.335 = alloca i64
  %local.ab2.336 = alloca i64
  %local.ba2.337 = alloca i64
  %local.c_sweep.338 = alloca i64
  %local.c.339 = alloca i64
  %local.la.340 = alloca i64
  %local.lm.341 = alloca i64
  %local.lo.342 = alloca i64
  %t343 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.32)
  %t344 = ptrtoint ptr %t343 to i64
  %t345 = inttoptr i64 %t344 to ptr
  call void @intrinsic_println(ptr %t345)
  %t346 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.33)
  %t347 = ptrtoint ptr %t346 to i64
  %t348 = inttoptr i64 %t347 to ptr
  call void @intrinsic_println(ptr %t348)
  %t349 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.34)
  %t350 = ptrtoint ptr %t349 to i64
  %t351 = inttoptr i64 %t350 to ptr
  call void @intrinsic_println(ptr %t351)
  %t352 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.35)
  %t353 = ptrtoint ptr %t352 to i64
  %t354 = inttoptr i64 %t353 to ptr
  call void @intrinsic_println(ptr %t354)
  %t355 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.36)
  %t356 = ptrtoint ptr %t355 to i64
  %t357 = inttoptr i64 %t356 to ptr
  call void @intrinsic_println(ptr %t357)
  %t358 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.37)
  %t359 = ptrtoint ptr %t358 to i64
  %t360 = inttoptr i64 %t359 to ptr
  call void @intrinsic_println(ptr %t360)
  %t361 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.38)
  %t362 = ptrtoint ptr %t361 to i64
  %t363 = inttoptr i64 %t362 to ptr
  call void @intrinsic_println(ptr %t363)
  %t364 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.39)
  store i64 %t364, ptr %local.true_a.325
  %t365 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.40)
  store i64 %t365, ptr %local.true_b.326
  %t366 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.41)
  store i64 %t366, ptr %local.corr.327
  store i64 80, ptr %local.obs.328
  %t367 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.42)
  %t368 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.43)
  %t369 = load i64, ptr %local.true_a.325
  %t370 = load i64, ptr %local.true_b.326
  %t371 = load i64, ptr %local.corr.327
  %t372 = load i64, ptr %local.obs.328
  %t373 = call i64 @"train_correlated"(i64 %t367, i64 %t368, i64 %t369, i64 %t370, i64 %t371, i64 %t372, i64 42)
  store i64 %t373, ptr %local.loss_indep.329
  %t374 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.44)
  %t375 = ptrtoint ptr %t374 to i64
  %t376 = inttoptr i64 %t375 to ptr
  call void @intrinsic_print(ptr %t376)
  %t377 = load i64, ptr %local.loss_indep.329
  %t378 = call i64 @"print_f64"(i64 %t377)
  %t379 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.45)
  %t380 = ptrtoint ptr %t379 to i64
  %t381 = inttoptr i64 %t380 to ptr
  call void @intrinsic_println(ptr %t381)
  %t382 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.46)
  store i64 %t382, ptr %local.ab.330
  %t383 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.47)
  store i64 %t383, ptr %local.ba.331
  %t384 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.48)
  store i64 %t384, ptr %local.mg.332
  store i64 0, ptr %local.cycle.333
  br label %loop15
loop15:
  %t385 = load i64, ptr %local.cycle.333
  %t386 = icmp slt i64 %t385, 40
  %t387 = zext i1 %t386 to i64
  %t388 = icmp ne i64 %t387, 0
  br i1 %t388, label %body15, label %endloop15
body15:
  %t389 = load i64, ptr %local.ab.330
  %t390 = load i64, ptr %local.ba.331
  %t391 = load i64, ptr %local.true_a.325
  %t392 = load i64, ptr %local.true_b.326
  %t393 = load i64, ptr %local.corr.327
  %t394 = load i64, ptr %local.obs.328
  %t395 = call i64 @"mg_corr"(i64 %t389, i64 %t390, i64 %t391, i64 %t392, i64 %t393, i64 %t394, i64 0)
  store i64 %t395, ptr %local.mg.332
  %t396 = load i64, ptr %local.ab.330
  %t397 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.49)
  %t398 = load i64, ptr %local.mg.332
  %t399 = call i64 @"sx_f64_mul"(i64 %t397, i64 %t398)
  %t400 = call i64 @"sx_f64_sub"(i64 %t396, i64 %t399)
  %t401 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.50)
  %t402 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.51)
  %t403 = call i64 @"sx_f64_sub"(i64 %t401, i64 %t402)
  %t404 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.52)
  %t405 = call i64 @"clamp"(i64 %t400, i64 %t403, i64 %t404)
  store i64 %t405, ptr %local.ab.330
  %t406 = load i64, ptr %local.ab.330
  %t407 = load i64, ptr %local.ba.331
  %t408 = load i64, ptr %local.true_a.325
  %t409 = load i64, ptr %local.true_b.326
  %t410 = load i64, ptr %local.corr.327
  %t411 = load i64, ptr %local.obs.328
  %t412 = call i64 @"mg_corr"(i64 %t406, i64 %t407, i64 %t408, i64 %t409, i64 %t410, i64 %t411, i64 1)
  store i64 %t412, ptr %local.mg.332
  %t413 = load i64, ptr %local.ba.331
  %t414 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.53)
  %t415 = load i64, ptr %local.mg.332
  %t416 = call i64 @"sx_f64_mul"(i64 %t414, i64 %t415)
  %t417 = call i64 @"sx_f64_sub"(i64 %t413, i64 %t416)
  %t418 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.54)
  %t419 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.55)
  %t420 = call i64 @"sx_f64_sub"(i64 %t418, i64 %t419)
  %t421 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.56)
  %t422 = call i64 @"clamp"(i64 %t417, i64 %t420, i64 %t421)
  store i64 %t422, ptr %local.ba.331
  %t423 = load i64, ptr %local.cycle.333
  %t424 = add i64 %t423, 1
  store i64 %t424, ptr %local.cycle.333
  br label %loop15
endloop15:
  %t425 = load i64, ptr %local.ab.330
  %t426 = load i64, ptr %local.ba.331
  %t427 = load i64, ptr %local.true_a.325
  %t428 = load i64, ptr %local.true_b.326
  %t429 = load i64, ptr %local.corr.327
  %t430 = load i64, ptr %local.obs.328
  %t431 = call i64 @"train_correlated"(i64 %t425, i64 %t426, i64 %t427, i64 %t428, i64 %t429, i64 %t430, i64 42)
  store i64 %t431, ptr %local.loss_interact.334
  %t432 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.57)
  %t433 = ptrtoint ptr %t432 to i64
  %t434 = inttoptr i64 %t433 to ptr
  call void @intrinsic_print(ptr %t434)
  %t435 = load i64, ptr %local.loss_interact.334
  %t436 = call i64 @"print_f64"(i64 %t435)
  %t437 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.58)
  %t438 = ptrtoint ptr %t437 to i64
  %t439 = inttoptr i64 %t438 to ptr
  call void @intrinsic_println(ptr %t439)
  %t440 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.59)
  %t441 = ptrtoint ptr %t440 to i64
  %t442 = inttoptr i64 %t441 to ptr
  call void @intrinsic_print(ptr %t442)
  %t443 = load i64, ptr %local.ab.330
  %t444 = call i64 @"print_f64"(i64 %t443)
  %t445 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.60)
  %t446 = ptrtoint ptr %t445 to i64
  %t447 = inttoptr i64 %t446 to ptr
  call void @intrinsic_println(ptr %t447)
  %t448 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.61)
  %t449 = ptrtoint ptr %t448 to i64
  %t450 = inttoptr i64 %t449 to ptr
  call void @intrinsic_print(ptr %t450)
  %t451 = load i64, ptr %local.ba.331
  %t452 = call i64 @"print_f64"(i64 %t451)
  %t453 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.62)
  %t454 = ptrtoint ptr %t453 to i64
  %t455 = inttoptr i64 %t454 to ptr
  call void @intrinsic_println(ptr %t455)
  %t456 = load i64, ptr %local.ab.330
  %t457 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.63)
  %t458 = call i64 @"sx_f64_gt"(i64 %t456, i64 %t457)
  %t459 = icmp ne i64 %t458, 0
  br i1 %t459, label %then16, label %else16
then16:
  %t460 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.64)
  %t461 = ptrtoint ptr %t460 to i64
  %t462 = inttoptr i64 %t461 to ptr
  call void @intrinsic_println(ptr %t462)
  br label %then16_end
then16_end:
  br label %endif16
else16:
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t463 = phi i64 [ 0, %then16_end ], [ 0, %else16_end ]
  %t464 = load i64, ptr %local.ab.330
  %t465 = load i64, ptr %local.ba.331
  %t466 = call i64 @"sx_f64_sub"(i64 %t464, i64 %t465)
  %t467 = call i64 @"abs_f64"(i64 %t466)
  %t468 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.65)
  %t469 = call i64 @"sx_f64_gt"(i64 %t467, i64 %t468)
  %t470 = icmp ne i64 %t469, 0
  br i1 %t470, label %then17, label %else17
then17:
  %t471 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.66)
  %t472 = ptrtoint ptr %t471 to i64
  %t473 = inttoptr i64 %t472 to ptr
  call void @intrinsic_println(ptr %t473)
  br label %then17_end
then17_end:
  br label %endif17
else17:
  br label %else17_end
else17_end:
  br label %endif17
endif17:
  %t474 = phi i64 [ 0, %then17_end ], [ 0, %else17_end ]
  %t475 = load i64, ptr %local.loss_interact.334
  %t476 = load i64, ptr %local.loss_indep.329
  %t477 = call i64 @"sx_f64_lt"(i64 %t475, i64 %t476)
  %t478 = icmp ne i64 %t477, 0
  br i1 %t478, label %then18, label %else18
then18:
  %t479 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.67)
  %t480 = ptrtoint ptr %t479 to i64
  %t481 = inttoptr i64 %t480 to ptr
  call void @intrinsic_println(ptr %t481)
  br label %then18_end
then18_end:
  br label %endif18
else18:
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t482 = phi i64 [ 0, %then18_end ], [ 0, %else18_end ]
  %t483 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.68)
  %t484 = ptrtoint ptr %t483 to i64
  %t485 = inttoptr i64 %t484 to ptr
  call void @intrinsic_println(ptr %t485)
  %t486 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.69)
  %t487 = ptrtoint ptr %t486 to i64
  %t488 = inttoptr i64 %t487 to ptr
  call void @intrinsic_println(ptr %t488)
  %t489 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.70)
  %t490 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.71)
  %t491 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.72)
  %t492 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.73)
  %t493 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.74)
  %t494 = load i64, ptr %local.obs.328
  %t495 = call i64 @"train_correlated"(i64 %t489, i64 %t490, i64 %t491, i64 %t492, i64 %t493, i64 %t494, i64 42)
  store i64 %t495, ptr %local.loss_uncorr_indep.335
  %t496 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.75)
  store i64 %t496, ptr %local.ab2.336
  %t497 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.76)
  store i64 %t497, ptr %local.ba2.337
  store i64 0, ptr %local.cycle.333
  br label %loop19
loop19:
  %t498 = load i64, ptr %local.cycle.333
  %t499 = icmp slt i64 %t498, 40
  %t500 = zext i1 %t499 to i64
  %t501 = icmp ne i64 %t500, 0
  br i1 %t501, label %body19, label %endloop19
body19:
  %t502 = load i64, ptr %local.ab2.336
  %t503 = load i64, ptr %local.ba2.337
  %t504 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.77)
  %t505 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.78)
  %t506 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.79)
  %t507 = load i64, ptr %local.obs.328
  %t508 = call i64 @"mg_corr"(i64 %t502, i64 %t503, i64 %t504, i64 %t505, i64 %t506, i64 %t507, i64 0)
  store i64 %t508, ptr %local.mg.332
  %t509 = load i64, ptr %local.ab2.336
  %t510 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.80)
  %t511 = load i64, ptr %local.mg.332
  %t512 = call i64 @"sx_f64_mul"(i64 %t510, i64 %t511)
  %t513 = call i64 @"sx_f64_sub"(i64 %t509, i64 %t512)
  %t514 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.81)
  %t515 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.82)
  %t516 = call i64 @"sx_f64_sub"(i64 %t514, i64 %t515)
  %t517 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.83)
  %t518 = call i64 @"clamp"(i64 %t513, i64 %t516, i64 %t517)
  store i64 %t518, ptr %local.ab2.336
  %t519 = load i64, ptr %local.ab2.336
  %t520 = load i64, ptr %local.ba2.337
  %t521 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.84)
  %t522 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.85)
  %t523 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.86)
  %t524 = load i64, ptr %local.obs.328
  %t525 = call i64 @"mg_corr"(i64 %t519, i64 %t520, i64 %t521, i64 %t522, i64 %t523, i64 %t524, i64 1)
  store i64 %t525, ptr %local.mg.332
  %t526 = load i64, ptr %local.ba2.337
  %t527 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.87)
  %t528 = load i64, ptr %local.mg.332
  %t529 = call i64 @"sx_f64_mul"(i64 %t527, i64 %t528)
  %t530 = call i64 @"sx_f64_sub"(i64 %t526, i64 %t529)
  %t531 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.88)
  %t532 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.89)
  %t533 = call i64 @"sx_f64_sub"(i64 %t531, i64 %t532)
  %t534 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.90)
  %t535 = call i64 @"clamp"(i64 %t530, i64 %t533, i64 %t534)
  store i64 %t535, ptr %local.ba2.337
  %t536 = load i64, ptr %local.cycle.333
  %t537 = add i64 %t536, 1
  store i64 %t537, ptr %local.cycle.333
  br label %loop19
endloop19:
  %t538 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.91)
  %t539 = ptrtoint ptr %t538 to i64
  %t540 = inttoptr i64 %t539 to ptr
  call void @intrinsic_print(ptr %t540)
  %t541 = load i64, ptr %local.ab2.336
  %t542 = call i64 @"print_f64"(i64 %t541)
  %t543 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.92)
  %t544 = ptrtoint ptr %t543 to i64
  %t545 = inttoptr i64 %t544 to ptr
  call void @intrinsic_print(ptr %t545)
  %t546 = load i64, ptr %local.ba2.337
  %t547 = call i64 @"print_f64"(i64 %t546)
  %t548 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.93)
  %t549 = ptrtoint ptr %t548 to i64
  %t550 = inttoptr i64 %t549 to ptr
  call void @intrinsic_println(ptr %t550)
  %t551 = load i64, ptr %local.ab2.336
  %t552 = call i64 @"abs_f64"(i64 %t551)
  %t553 = load i64, ptr %local.ab.330
  %t554 = call i64 @"abs_f64"(i64 %t553)
  %t555 = call i64 @"sx_f64_lt"(i64 %t552, i64 %t554)
  %t556 = icmp ne i64 %t555, 0
  br i1 %t556, label %then20, label %else20
then20:
  %t557 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.94)
  %t558 = ptrtoint ptr %t557 to i64
  %t559 = inttoptr i64 %t558 to ptr
  call void @intrinsic_println(ptr %t559)
  br label %then20_end
then20_end:
  br label %endif20
else20:
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t560 = phi i64 [ 0, %then20_end ], [ 0, %else20_end ]
  %t561 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.95)
  %t562 = ptrtoint ptr %t561 to i64
  %t563 = inttoptr i64 %t562 to ptr
  call void @intrinsic_println(ptr %t563)
  %t564 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.96)
  %t565 = ptrtoint ptr %t564 to i64
  %t566 = inttoptr i64 %t565 to ptr
  call void @intrinsic_println(ptr %t566)
  %t567 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.97)
  %t568 = ptrtoint ptr %t567 to i64
  %t569 = inttoptr i64 %t568 to ptr
  call void @intrinsic_println(ptr %t569)
  %t570 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.98)
  %t571 = ptrtoint ptr %t570 to i64
  %t572 = inttoptr i64 %t571 to ptr
  call void @intrinsic_println(ptr %t572)
  store i64 0, ptr %local.c_sweep.338
  br label %loop21
loop21:
  %t573 = load i64, ptr %local.c_sweep.338
  %t574 = icmp slt i64 %t573, 6
  %t575 = zext i1 %t574 to i64
  %t576 = icmp ne i64 %t575, 0
  br i1 %t576, label %body21, label %endloop21
body21:
  %t577 = load i64, ptr %local.c_sweep.338
  %t578 = call i64 @"sx_int_to_f64"(i64 %t577)
  %t579 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.99)
  %t580 = call i64 @"sx_f64_mul"(i64 %t578, i64 %t579)
  store i64 %t580, ptr %local.c.339
  %t581 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.100)
  %t582 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.101)
  %t583 = load i64, ptr %local.c.339
  %t584 = call i64 @"train_desire_reg"(i64 %t581, i64 %t582, i64 %t583, i64 100, i64 42)
  store i64 %t584, ptr %local.la.340
  %t585 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.102)
  %t586 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.103)
  %t587 = load i64, ptr %local.c.339
  %t588 = call i64 @"train_desire_reg"(i64 %t585, i64 %t586, i64 %t587, i64 100, i64 42)
  store i64 %t588, ptr %local.lm.341
  %t589 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.104)
  %t590 = call i64 @f64_parse(ptr @.str.exp_anima_correlated.105)
  %t591 = load i64, ptr %local.c.339
  %t592 = call i64 @"train_desire_reg"(i64 %t589, i64 %t590, i64 %t591, i64 100, i64 42)
  store i64 %t592, ptr %local.lo.342
  %t593 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.106)
  %t594 = ptrtoint ptr %t593 to i64
  %t595 = inttoptr i64 %t594 to ptr
  call void @intrinsic_print(ptr %t595)
  %t596 = load i64, ptr %local.c.339
  %t597 = call i64 @"print_f64"(i64 %t596)
  %t598 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.107)
  %t599 = ptrtoint ptr %t598 to i64
  %t600 = inttoptr i64 %t599 to ptr
  call void @intrinsic_print(ptr %t600)
  %t601 = load i64, ptr %local.la.340
  %t602 = call i64 @"print_f64"(i64 %t601)
  %t603 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.108)
  %t604 = ptrtoint ptr %t603 to i64
  %t605 = inttoptr i64 %t604 to ptr
  call void @intrinsic_print(ptr %t605)
  %t606 = load i64, ptr %local.lm.341
  %t607 = call i64 @"print_f64"(i64 %t606)
  %t608 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.109)
  %t609 = ptrtoint ptr %t608 to i64
  %t610 = inttoptr i64 %t609 to ptr
  call void @intrinsic_print(ptr %t610)
  %t611 = load i64, ptr %local.lo.342
  %t612 = call i64 @"print_f64"(i64 %t611)
  %t613 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.110)
  %t614 = ptrtoint ptr %t613 to i64
  %t615 = inttoptr i64 %t614 to ptr
  call void @intrinsic_println(ptr %t615)
  %t616 = load i64, ptr %local.c_sweep.338
  %t617 = add i64 %t616, 1
  store i64 %t617, ptr %local.c_sweep.338
  br label %loop21
endloop21:
  %t618 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.111)
  %t619 = ptrtoint ptr %t618 to i64
  %t620 = inttoptr i64 %t619 to ptr
  call void @intrinsic_println(ptr %t620)
  %t621 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.112)
  %t622 = ptrtoint ptr %t621 to i64
  %t623 = inttoptr i64 %t622 to ptr
  call void @intrinsic_println(ptr %t623)
  %t624 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.113)
  %t625 = ptrtoint ptr %t624 to i64
  %t626 = inttoptr i64 %t625 to ptr
  call void @intrinsic_println(ptr %t626)
  %t627 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.114)
  %t628 = ptrtoint ptr %t627 to i64
  %t629 = inttoptr i64 %t628 to ptr
  call void @intrinsic_println(ptr %t629)
  %t630 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.115)
  %t631 = ptrtoint ptr %t630 to i64
  %t632 = inttoptr i64 %t631 to ptr
  call void @intrinsic_println(ptr %t632)
  %t633 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.116)
  %t634 = ptrtoint ptr %t633 to i64
  %t635 = inttoptr i64 %t634 to ptr
  call void @intrinsic_println(ptr %t635)
  %t636 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.117)
  %t637 = ptrtoint ptr %t636 to i64
  %t638 = inttoptr i64 %t637 to ptr
  call void @intrinsic_println(ptr %t638)
  %t639 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.118)
  %t640 = ptrtoint ptr %t639 to i64
  %t641 = inttoptr i64 %t640 to ptr
  call void @intrinsic_println(ptr %t641)
  %t642 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.119)
  %t643 = ptrtoint ptr %t642 to i64
  %t644 = inttoptr i64 %t643 to ptr
  call void @intrinsic_println(ptr %t644)
  %t645 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.120)
  %t646 = ptrtoint ptr %t645 to i64
  %t647 = inttoptr i64 %t646 to ptr
  call void @intrinsic_println(ptr %t647)
  %t648 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_correlated.121)
  %t649 = ptrtoint ptr %t648 to i64
  %t650 = inttoptr i64 %t649 to ptr
  call void @intrinsic_println(ptr %t650)
  ret i64 0
}


; String constants
@.str.exp_anima_correlated.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_correlated.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_correlated.2 = private unnamed_addr constant [8 x i8] c"10000.0\00"
@.str.exp_anima_correlated.3 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_correlated.4 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_correlated.5 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_correlated.6 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_correlated.7 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_correlated.8 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_correlated.9 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_correlated.10 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_anima_correlated.11 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_anima_correlated.12 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_anima_correlated.13 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_correlated.14 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_anima_correlated.15 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_anima_correlated.16 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_anima_correlated.17 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_anima_correlated.18 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_anima_correlated.19 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_anima_correlated.20 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_anima_correlated.21 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_correlated.22 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_anima_correlated.23 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_anima_correlated.24 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_anima_correlated.25 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_correlated.26 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_correlated.27 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_correlated.28 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_correlated.29 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_correlated.30 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_anima_correlated.31 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_anima_correlated.32 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_anima_correlated.33 = private unnamed_addr constant [45 x i8] c"  CORRELATED BELIEFS + DESIRE REGULARISATION\00"
@.str.exp_anima_correlated.34 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_anima_correlated.35 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_correlated.36 = private unnamed_addr constant [58 x i8] c"--- Correlated Beliefs: Rain (0.7) & Wet Ground (0.9) ---\00"
@.str.exp_anima_correlated.37 = private unnamed_addr constant [40 x i8] c"  Correlation=0.8 (strong: rain -> wet)\00"
@.str.exp_anima_correlated.38 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_correlated.39 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_anima_correlated.40 = private unnamed_addr constant [4 x i8] c"0.9\00"
@.str.exp_anima_correlated.41 = private unnamed_addr constant [4 x i8] c"0.8\00"
@.str.exp_anima_correlated.42 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_correlated.43 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_correlated.44 = private unnamed_addr constant [33 x i8] c"  Independent beliefs:     loss=\00"
@.str.exp_anima_correlated.45 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_correlated.46 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_anima_correlated.47 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_anima_correlated.48 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_correlated.49 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_anima_correlated.50 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_correlated.51 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_correlated.52 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_correlated.53 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_anima_correlated.54 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_correlated.55 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_correlated.56 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_correlated.57 = private unnamed_addr constant [33 x i8] c"  Learned interaction:     loss=\00"
@.str.exp_anima_correlated.58 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_correlated.59 = private unnamed_addr constant [28 x i8] c"  alpha_AB (rain->wet):    \00"
@.str.exp_anima_correlated.60 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_correlated.61 = private unnamed_addr constant [28 x i8] c"  alpha_BA (wet->rain):    \00"
@.str.exp_anima_correlated.62 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_correlated.63 = private unnamed_addr constant [4 x i8] c"0.6\00"
@.str.exp_anima_correlated.64 = private unnamed_addr constant [65 x i8] c"  FINDING: System discovered rain->wet correlation (alpha > 0.6)\00"
@.str.exp_anima_correlated.65 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_anima_correlated.66 = private unnamed_addr constant [65 x i8] c"  FINDING: Asymmetric interaction — correlation is directional\00"
@.str.exp_anima_correlated.67 = private unnamed_addr constant [59 x i8] c"  FINDING: Correlated interaction IMPROVES belief accuracy\00"
@.str.exp_anima_correlated.68 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_correlated.69 = private unnamed_addr constant [61 x i8] c"--- Uncorrelated Beliefs: Rain (0.7) & Stock Price (0.5) ---\00"
@.str.exp_anima_correlated.70 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_correlated.71 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_correlated.72 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_anima_correlated.73 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_anima_correlated.74 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_correlated.75 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_anima_correlated.76 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_anima_correlated.77 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_anima_correlated.78 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_anima_correlated.79 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_correlated.80 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_anima_correlated.81 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_correlated.82 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_correlated.83 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_correlated.84 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_anima_correlated.85 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_anima_correlated.86 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_correlated.87 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_anima_correlated.88 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_correlated.89 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_correlated.90 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_correlated.91 = private unnamed_addr constant [36 x i8] c"  Learned alpha (uncorrelated): AB=\00"
@.str.exp_anima_correlated.92 = private unnamed_addr constant [5 x i8] c" BA=\00"
@.str.exp_anima_correlated.93 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_correlated.94 = private unnamed_addr constant [73 x i8] c"  FINDING: System correctly reduced interaction for uncorrelated beliefs\00"
@.str.exp_anima_correlated.95 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_correlated.96 = private unnamed_addr constant [30 x i8] c"--- Desire as Regulariser ---\00"
@.str.exp_anima_correlated.97 = private unnamed_addr constant [41 x i8] c"  True value=0.65, sweep desire coupling\00"
@.str.exp_anima_correlated.98 = private unnamed_addr constant [62 x i8] c"  Coupling    Aligned(0.65)   Misaligned(0.3)   Opposite(0.1)\00"
@.str.exp_anima_correlated.99 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_anima_correlated.100 = private unnamed_addr constant [5 x i8] c"0.65\00"
@.str.exp_anima_correlated.101 = private unnamed_addr constant [5 x i8] c"0.65\00"
@.str.exp_anima_correlated.102 = private unnamed_addr constant [5 x i8] c"0.65\00"
@.str.exp_anima_correlated.103 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_anima_correlated.104 = private unnamed_addr constant [5 x i8] c"0.65\00"
@.str.exp_anima_correlated.105 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_anima_correlated.106 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_anima_correlated.107 = private unnamed_addr constant [10 x i8] c"         \00"
@.str.exp_anima_correlated.108 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_anima_correlated.109 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_anima_correlated.110 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_correlated.111 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_correlated.112 = private unnamed_addr constant [12 x i8] c"  ANALYSIS:\00"
@.str.exp_anima_correlated.113 = private unnamed_addr constant [48 x i8] c"  - Aligned desire: coupling HELPS (lower loss)\00"
@.str.exp_anima_correlated.114 = private unnamed_addr constant [59 x i8] c"  - Misaligned desire at low coupling: mild regularisation\00"
@.str.exp_anima_correlated.115 = private unnamed_addr constant [51 x i8] c"  - Misaligned desire at high coupling: distortion\00"
@.str.exp_anima_correlated.116 = private unnamed_addr constant [54 x i8] c"  - The optimal coupling depends on alignment quality\00"
@.str.exp_anima_correlated.117 = private unnamed_addr constant [61 x i8] c"  - This is learnable via meta-gradient on coupling strength\00"
@.str.exp_anima_correlated.118 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_correlated.119 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_anima_correlated.120 = private unnamed_addr constant [21 x i8] c"  DEEP DIVE COMPLETE\00"
@.str.exp_anima_correlated.121 = private unnamed_addr constant [45 x i8] c"============================================\00"
