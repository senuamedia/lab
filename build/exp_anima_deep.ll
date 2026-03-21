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
  %t1 = call i64 @f64_parse(ptr @.str.exp_anima_deep.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_anima_deep.1)
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
  %t24 = call i64 @f64_parse(ptr @.str.exp_anima_deep.2)
  %t25 = call i64 @"sx_f64_div"(i64 %t23, i64 %t24)
  ret i64 %t25
}

define i64 @"beta_mean"(i64 %alpha, i64 %beta_p) nounwind {
entry:
  %local.alpha = alloca i64
  store i64 %alpha, ptr %local.alpha
  %local.beta_p = alloca i64
  store i64 %beta_p, ptr %local.beta_p
  %t26 = load i64, ptr %local.alpha
  %t27 = load i64, ptr %local.alpha
  %t28 = load i64, ptr %local.beta_p
  %t29 = call i64 @"sx_f64_add"(i64 %t27, i64 %t28)
  %t30 = call i64 @"sx_f64_div"(i64 %t26, i64 %t29)
  ret i64 %t30
}

define i64 @"belief_interaction"(i64 %conf_i, i64 %conf_j, i64 %alpha_ij) nounwind {
entry:
  %local.conf_i = alloca i64
  store i64 %conf_i, ptr %local.conf_i
  %local.conf_j = alloca i64
  store i64 %conf_j, ptr %local.conf_j
  %local.alpha_ij = alloca i64
  store i64 %alpha_ij, ptr %local.alpha_ij
  %t31 = load i64, ptr %local.alpha_ij
  %t32 = load i64, ptr %local.conf_i
  %t33 = call i64 @f64_parse(ptr @.str.exp_anima_deep.3)
  %t34 = call i64 @"sx_f64_sub"(i64 %t32, i64 %t33)
  %t35 = call i64 @"sx_f64_mul"(i64 %t31, i64 %t34)
  %t36 = call i64 @f64_parse(ptr @.str.exp_anima_deep.4)
  %t37 = call i64 @"sx_f64_mul"(i64 %t35, i64 %t36)
  ret i64 %t37
}

define i64 @"train_beliefs"(i64 %alpha_ab, i64 %alpha_ac, i64 %alpha_ba, i64 %alpha_bc, i64 %alpha_ca, i64 %alpha_cb, i64 %true_a, i64 %true_b, i64 %true_c, i64 %observations, i64 %seed) nounwind {
entry:
  %local.a_alpha.38 = alloca i64
  %local.a_beta.39 = alloca i64
  %local.b_alpha.40 = alloca i64
  %local.b_beta.41 = alloca i64
  %local.c_alpha.42 = alloca i64
  %local.c_beta.43 = alloca i64
  %local.rng.44 = alloca i64
  %local.obs.45 = alloca i64
  %local.conf_a.46 = alloca i64
  %local.conf_b.47 = alloca i64
  %local.conf_c.48 = alloca i64
  %local.interact.49 = alloca i64
  %local.evidence_strength.50 = alloca i64
  %local.err_a.51 = alloca i64
  %local.err_b.52 = alloca i64
  %local.err_c.53 = alloca i64
  %local.alpha_ab = alloca i64
  store i64 %alpha_ab, ptr %local.alpha_ab
  %local.alpha_ac = alloca i64
  store i64 %alpha_ac, ptr %local.alpha_ac
  %local.alpha_ba = alloca i64
  store i64 %alpha_ba, ptr %local.alpha_ba
  %local.alpha_bc = alloca i64
  store i64 %alpha_bc, ptr %local.alpha_bc
  %local.alpha_ca = alloca i64
  store i64 %alpha_ca, ptr %local.alpha_ca
  %local.alpha_cb = alloca i64
  store i64 %alpha_cb, ptr %local.alpha_cb
  %local.true_a = alloca i64
  store i64 %true_a, ptr %local.true_a
  %local.true_b = alloca i64
  store i64 %true_b, ptr %local.true_b
  %local.true_c = alloca i64
  store i64 %true_c, ptr %local.true_c
  %local.observations = alloca i64
  store i64 %observations, ptr %local.observations
  %local.seed = alloca i64
  store i64 %seed, ptr %local.seed
  %t54 = call i64 @f64_parse(ptr @.str.exp_anima_deep.5)
  store i64 %t54, ptr %local.a_alpha.38
  %t55 = call i64 @f64_parse(ptr @.str.exp_anima_deep.6)
  store i64 %t55, ptr %local.a_beta.39
  %t56 = call i64 @f64_parse(ptr @.str.exp_anima_deep.7)
  store i64 %t56, ptr %local.b_alpha.40
  %t57 = call i64 @f64_parse(ptr @.str.exp_anima_deep.8)
  store i64 %t57, ptr %local.b_beta.41
  %t58 = call i64 @f64_parse(ptr @.str.exp_anima_deep.9)
  store i64 %t58, ptr %local.c_alpha.42
  %t59 = call i64 @f64_parse(ptr @.str.exp_anima_deep.10)
  store i64 %t59, ptr %local.c_beta.43
  %t60 = load i64, ptr %local.seed
  store i64 %t60, ptr %local.rng.44
  store i64 0, ptr %local.obs.45
  %t61 = call i64 @f64_parse(ptr @.str.exp_anima_deep.11)
  store i64 %t61, ptr %local.conf_a.46
  %t62 = call i64 @f64_parse(ptr @.str.exp_anima_deep.12)
  store i64 %t62, ptr %local.conf_b.47
  %t63 = call i64 @f64_parse(ptr @.str.exp_anima_deep.13)
  store i64 %t63, ptr %local.conf_c.48
  %t64 = call i64 @f64_parse(ptr @.str.exp_anima_deep.14)
  store i64 %t64, ptr %local.interact.49
  %t65 = call i64 @f64_parse(ptr @.str.exp_anima_deep.15)
  store i64 %t65, ptr %local.evidence_strength.50
  br label %loop2
loop2:
  %t66 = load i64, ptr %local.obs.45
  %t67 = load i64, ptr %local.observations
  %t68 = icmp slt i64 %t66, %t67
  %t69 = zext i1 %t68 to i64
  %t70 = icmp ne i64 %t69, 0
  br i1 %t70, label %body2, label %endloop2
body2:
  %t71 = load i64, ptr %local.a_alpha.38
  %t72 = load i64, ptr %local.a_beta.39
  %t73 = call i64 @"beta_mean"(i64 %t71, i64 %t72)
  store i64 %t73, ptr %local.conf_a.46
  %t74 = load i64, ptr %local.b_alpha.40
  %t75 = load i64, ptr %local.b_beta.41
  %t76 = call i64 @"beta_mean"(i64 %t74, i64 %t75)
  store i64 %t76, ptr %local.conf_b.47
  %t77 = load i64, ptr %local.c_alpha.42
  %t78 = load i64, ptr %local.c_beta.43
  %t79 = call i64 @"beta_mean"(i64 %t77, i64 %t78)
  store i64 %t79, ptr %local.conf_c.48
  %t80 = load i64, ptr %local.rng.44
  %t81 = call i64 @"lcg_next"(i64 %t80)
  store i64 %t81, ptr %local.rng.44
  %t82 = call i64 @f64_parse(ptr @.str.exp_anima_deep.16)
  store i64 %t82, ptr %local.evidence_strength.50
  %t83 = load i64, ptr %local.conf_b.47
  %t84 = load i64, ptr %local.conf_a.46
  %t85 = load i64, ptr %local.alpha_ba
  %t86 = call i64 @"belief_interaction"(i64 %t83, i64 %t84, i64 %t85)
  store i64 %t86, ptr %local.interact.49
  %t87 = load i64, ptr %local.evidence_strength.50
  %t88 = load i64, ptr %local.interact.49
  %t89 = call i64 @"sx_f64_add"(i64 %t87, i64 %t88)
  store i64 %t89, ptr %local.evidence_strength.50
  %t90 = load i64, ptr %local.conf_c.48
  %t91 = load i64, ptr %local.conf_a.46
  %t92 = load i64, ptr %local.alpha_ca
  %t93 = call i64 @"belief_interaction"(i64 %t90, i64 %t91, i64 %t92)
  store i64 %t93, ptr %local.interact.49
  %t94 = load i64, ptr %local.evidence_strength.50
  %t95 = load i64, ptr %local.interact.49
  %t96 = call i64 @"sx_f64_add"(i64 %t94, i64 %t95)
  store i64 %t96, ptr %local.evidence_strength.50
  %t97 = load i64, ptr %local.rng.44
  %t98 = call i64 @"lcg_f64"(i64 %t97)
  %t99 = load i64, ptr %local.true_a
  %t100 = call i64 @"sx_f64_lt"(i64 %t98, i64 %t99)
  %t101 = icmp ne i64 %t100, 0
  br i1 %t101, label %then3, label %else3
then3:
  %t102 = load i64, ptr %local.a_alpha.38
  %t103 = load i64, ptr %local.evidence_strength.50
  %t104 = call i64 @"sx_f64_add"(i64 %t102, i64 %t103)
  store i64 %t104, ptr %local.a_alpha.38
  br label %then3_end
then3_end:
  br label %endif3
else3:
  %t105 = load i64, ptr %local.a_beta.39
  %t106 = load i64, ptr %local.evidence_strength.50
  %t107 = call i64 @"sx_f64_add"(i64 %t105, i64 %t106)
  store i64 %t107, ptr %local.a_beta.39
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t108 = phi i64 [ 0, %then3_end ], [ 0, %else3_end ]
  %t109 = load i64, ptr %local.rng.44
  %t110 = call i64 @"lcg_next"(i64 %t109)
  store i64 %t110, ptr %local.rng.44
  %t111 = call i64 @f64_parse(ptr @.str.exp_anima_deep.17)
  store i64 %t111, ptr %local.evidence_strength.50
  %t112 = load i64, ptr %local.conf_a.46
  %t113 = load i64, ptr %local.conf_b.47
  %t114 = load i64, ptr %local.alpha_ab
  %t115 = call i64 @"belief_interaction"(i64 %t112, i64 %t113, i64 %t114)
  store i64 %t115, ptr %local.interact.49
  %t116 = load i64, ptr %local.evidence_strength.50
  %t117 = load i64, ptr %local.interact.49
  %t118 = call i64 @"sx_f64_add"(i64 %t116, i64 %t117)
  store i64 %t118, ptr %local.evidence_strength.50
  %t119 = load i64, ptr %local.conf_c.48
  %t120 = load i64, ptr %local.conf_b.47
  %t121 = load i64, ptr %local.alpha_cb
  %t122 = call i64 @"belief_interaction"(i64 %t119, i64 %t120, i64 %t121)
  store i64 %t122, ptr %local.interact.49
  %t123 = load i64, ptr %local.evidence_strength.50
  %t124 = load i64, ptr %local.interact.49
  %t125 = call i64 @"sx_f64_add"(i64 %t123, i64 %t124)
  store i64 %t125, ptr %local.evidence_strength.50
  %t126 = load i64, ptr %local.rng.44
  %t127 = call i64 @"lcg_f64"(i64 %t126)
  %t128 = load i64, ptr %local.true_b
  %t129 = call i64 @"sx_f64_lt"(i64 %t127, i64 %t128)
  %t130 = icmp ne i64 %t129, 0
  br i1 %t130, label %then4, label %else4
then4:
  %t131 = load i64, ptr %local.b_alpha.40
  %t132 = load i64, ptr %local.evidence_strength.50
  %t133 = call i64 @"sx_f64_add"(i64 %t131, i64 %t132)
  store i64 %t133, ptr %local.b_alpha.40
  br label %then4_end
then4_end:
  br label %endif4
else4:
  %t134 = load i64, ptr %local.b_beta.41
  %t135 = load i64, ptr %local.evidence_strength.50
  %t136 = call i64 @"sx_f64_add"(i64 %t134, i64 %t135)
  store i64 %t136, ptr %local.b_beta.41
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t137 = phi i64 [ 0, %then4_end ], [ 0, %else4_end ]
  %t138 = load i64, ptr %local.rng.44
  %t139 = call i64 @"lcg_next"(i64 %t138)
  store i64 %t139, ptr %local.rng.44
  %t140 = call i64 @f64_parse(ptr @.str.exp_anima_deep.18)
  store i64 %t140, ptr %local.evidence_strength.50
  %t141 = load i64, ptr %local.conf_a.46
  %t142 = load i64, ptr %local.conf_c.48
  %t143 = load i64, ptr %local.alpha_ac
  %t144 = call i64 @"belief_interaction"(i64 %t141, i64 %t142, i64 %t143)
  store i64 %t144, ptr %local.interact.49
  %t145 = load i64, ptr %local.evidence_strength.50
  %t146 = load i64, ptr %local.interact.49
  %t147 = call i64 @"sx_f64_add"(i64 %t145, i64 %t146)
  store i64 %t147, ptr %local.evidence_strength.50
  %t148 = load i64, ptr %local.conf_b.47
  %t149 = load i64, ptr %local.conf_c.48
  %t150 = load i64, ptr %local.alpha_bc
  %t151 = call i64 @"belief_interaction"(i64 %t148, i64 %t149, i64 %t150)
  store i64 %t151, ptr %local.interact.49
  %t152 = load i64, ptr %local.evidence_strength.50
  %t153 = load i64, ptr %local.interact.49
  %t154 = call i64 @"sx_f64_add"(i64 %t152, i64 %t153)
  store i64 %t154, ptr %local.evidence_strength.50
  %t155 = load i64, ptr %local.rng.44
  %t156 = call i64 @"lcg_f64"(i64 %t155)
  %t157 = load i64, ptr %local.true_c
  %t158 = call i64 @"sx_f64_lt"(i64 %t156, i64 %t157)
  %t159 = icmp ne i64 %t158, 0
  br i1 %t159, label %then5, label %else5
then5:
  %t160 = load i64, ptr %local.c_alpha.42
  %t161 = load i64, ptr %local.evidence_strength.50
  %t162 = call i64 @"sx_f64_add"(i64 %t160, i64 %t161)
  store i64 %t162, ptr %local.c_alpha.42
  br label %then5_end
then5_end:
  br label %endif5
else5:
  %t163 = load i64, ptr %local.c_beta.43
  %t164 = load i64, ptr %local.evidence_strength.50
  %t165 = call i64 @"sx_f64_add"(i64 %t163, i64 %t164)
  store i64 %t165, ptr %local.c_beta.43
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t166 = phi i64 [ 0, %then5_end ], [ 0, %else5_end ]
  %t167 = load i64, ptr %local.obs.45
  %t168 = add i64 %t167, 1
  store i64 %t168, ptr %local.obs.45
  br label %loop2
endloop2:
  %t169 = load i64, ptr %local.a_alpha.38
  %t170 = load i64, ptr %local.a_beta.39
  %t171 = call i64 @"beta_mean"(i64 %t169, i64 %t170)
  %t172 = load i64, ptr %local.true_a
  %t173 = call i64 @"sx_f64_sub"(i64 %t171, i64 %t172)
  store i64 %t173, ptr %local.err_a.51
  %t174 = load i64, ptr %local.b_alpha.40
  %t175 = load i64, ptr %local.b_beta.41
  %t176 = call i64 @"beta_mean"(i64 %t174, i64 %t175)
  %t177 = load i64, ptr %local.true_b
  %t178 = call i64 @"sx_f64_sub"(i64 %t176, i64 %t177)
  store i64 %t178, ptr %local.err_b.52
  %t179 = load i64, ptr %local.c_alpha.42
  %t180 = load i64, ptr %local.c_beta.43
  %t181 = call i64 @"beta_mean"(i64 %t179, i64 %t180)
  %t182 = load i64, ptr %local.true_c
  %t183 = call i64 @"sx_f64_sub"(i64 %t181, i64 %t182)
  store i64 %t183, ptr %local.err_c.53
  %t184 = load i64, ptr %local.err_a.51
  %t185 = load i64, ptr %local.err_a.51
  %t186 = call i64 @"sx_f64_mul"(i64 %t184, i64 %t185)
  %t187 = load i64, ptr %local.err_b.52
  %t188 = load i64, ptr %local.err_b.52
  %t189 = call i64 @"sx_f64_mul"(i64 %t187, i64 %t188)
  %t190 = call i64 @"sx_f64_add"(i64 %t186, i64 %t189)
  %t191 = load i64, ptr %local.err_c.53
  %t192 = load i64, ptr %local.err_c.53
  %t193 = call i64 @"sx_f64_mul"(i64 %t191, i64 %t192)
  %t194 = call i64 @"sx_f64_add"(i64 %t190, i64 %t193)
  ret i64 %t194
}

define i64 @"mg_belief"(i64 %ab, i64 %ac, i64 %ba, i64 %bc, i64 %ca, i64 %cb, i64 %ta, i64 %tb, i64 %tc, i64 %which, i64 %obs) nounwind {
entry:
  %local.h.195 = alloca i64
  %local.abp.196 = alloca i64
  %local.acp.197 = alloca i64
  %local.bap.198 = alloca i64
  %local.bcp.199 = alloca i64
  %local.cap.200 = alloca i64
  %local.cbp.201 = alloca i64
  %local.abm.202 = alloca i64
  %local.acm.203 = alloca i64
  %local.bam.204 = alloca i64
  %local.bcm.205 = alloca i64
  %local.cam.206 = alloca i64
  %local.cbm.207 = alloca i64
  %local.lp.208 = alloca i64
  %local.lm.209 = alloca i64
  %local.ab = alloca i64
  store i64 %ab, ptr %local.ab
  %local.ac = alloca i64
  store i64 %ac, ptr %local.ac
  %local.ba = alloca i64
  store i64 %ba, ptr %local.ba
  %local.bc = alloca i64
  store i64 %bc, ptr %local.bc
  %local.ca = alloca i64
  store i64 %ca, ptr %local.ca
  %local.cb = alloca i64
  store i64 %cb, ptr %local.cb
  %local.ta = alloca i64
  store i64 %ta, ptr %local.ta
  %local.tb = alloca i64
  store i64 %tb, ptr %local.tb
  %local.tc = alloca i64
  store i64 %tc, ptr %local.tc
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %local.obs = alloca i64
  store i64 %obs, ptr %local.obs
  %t210 = call i64 @f64_parse(ptr @.str.exp_anima_deep.19)
  store i64 %t210, ptr %local.h.195
  %t211 = load i64, ptr %local.ab
  store i64 %t211, ptr %local.abp.196
  %t212 = load i64, ptr %local.ac
  store i64 %t212, ptr %local.acp.197
  %t213 = load i64, ptr %local.ba
  store i64 %t213, ptr %local.bap.198
  %t214 = load i64, ptr %local.bc
  store i64 %t214, ptr %local.bcp.199
  %t215 = load i64, ptr %local.ca
  store i64 %t215, ptr %local.cap.200
  %t216 = load i64, ptr %local.cb
  store i64 %t216, ptr %local.cbp.201
  %t217 = load i64, ptr %local.ab
  store i64 %t217, ptr %local.abm.202
  %t218 = load i64, ptr %local.ac
  store i64 %t218, ptr %local.acm.203
  %t219 = load i64, ptr %local.ba
  store i64 %t219, ptr %local.bam.204
  %t220 = load i64, ptr %local.bc
  store i64 %t220, ptr %local.bcm.205
  %t221 = load i64, ptr %local.ca
  store i64 %t221, ptr %local.cam.206
  %t222 = load i64, ptr %local.cb
  store i64 %t222, ptr %local.cbm.207
  %t223 = load i64, ptr %local.which
  %t224 = icmp eq i64 %t223, 0
  %t225 = zext i1 %t224 to i64
  %t226 = icmp ne i64 %t225, 0
  br i1 %t226, label %then6, label %else6
then6:
  %t227 = load i64, ptr %local.ab
  %t228 = load i64, ptr %local.h.195
  %t229 = call i64 @"sx_f64_add"(i64 %t227, i64 %t228)
  store i64 %t229, ptr %local.abp.196
  %t230 = load i64, ptr %local.ab
  %t231 = load i64, ptr %local.h.195
  %t232 = call i64 @"sx_f64_sub"(i64 %t230, i64 %t231)
  store i64 %t232, ptr %local.abm.202
  br label %then6_end
then6_end:
  br label %endif6
else6:
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t233 = phi i64 [ 0, %then6_end ], [ 0, %else6_end ]
  %t234 = load i64, ptr %local.which
  %t235 = icmp eq i64 %t234, 1
  %t236 = zext i1 %t235 to i64
  %t237 = icmp ne i64 %t236, 0
  br i1 %t237, label %then7, label %else7
then7:
  %t238 = load i64, ptr %local.ac
  %t239 = load i64, ptr %local.h.195
  %t240 = call i64 @"sx_f64_add"(i64 %t238, i64 %t239)
  store i64 %t240, ptr %local.acp.197
  %t241 = load i64, ptr %local.ac
  %t242 = load i64, ptr %local.h.195
  %t243 = call i64 @"sx_f64_sub"(i64 %t241, i64 %t242)
  store i64 %t243, ptr %local.acm.203
  br label %then7_end
then7_end:
  br label %endif7
else7:
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t244 = phi i64 [ 0, %then7_end ], [ 0, %else7_end ]
  %t245 = load i64, ptr %local.which
  %t246 = icmp eq i64 %t245, 2
  %t247 = zext i1 %t246 to i64
  %t248 = icmp ne i64 %t247, 0
  br i1 %t248, label %then8, label %else8
then8:
  %t249 = load i64, ptr %local.ba
  %t250 = load i64, ptr %local.h.195
  %t251 = call i64 @"sx_f64_add"(i64 %t249, i64 %t250)
  store i64 %t251, ptr %local.bap.198
  %t252 = load i64, ptr %local.ba
  %t253 = load i64, ptr %local.h.195
  %t254 = call i64 @"sx_f64_sub"(i64 %t252, i64 %t253)
  store i64 %t254, ptr %local.bam.204
  br label %then8_end
then8_end:
  br label %endif8
else8:
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t255 = phi i64 [ 0, %then8_end ], [ 0, %else8_end ]
  %t256 = load i64, ptr %local.which
  %t257 = icmp eq i64 %t256, 3
  %t258 = zext i1 %t257 to i64
  %t259 = icmp ne i64 %t258, 0
  br i1 %t259, label %then9, label %else9
then9:
  %t260 = load i64, ptr %local.bc
  %t261 = load i64, ptr %local.h.195
  %t262 = call i64 @"sx_f64_add"(i64 %t260, i64 %t261)
  store i64 %t262, ptr %local.bcp.199
  %t263 = load i64, ptr %local.bc
  %t264 = load i64, ptr %local.h.195
  %t265 = call i64 @"sx_f64_sub"(i64 %t263, i64 %t264)
  store i64 %t265, ptr %local.bcm.205
  br label %then9_end
then9_end:
  br label %endif9
else9:
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t266 = phi i64 [ 0, %then9_end ], [ 0, %else9_end ]
  %t267 = load i64, ptr %local.which
  %t268 = icmp eq i64 %t267, 4
  %t269 = zext i1 %t268 to i64
  %t270 = icmp ne i64 %t269, 0
  br i1 %t270, label %then10, label %else10
then10:
  %t271 = load i64, ptr %local.ca
  %t272 = load i64, ptr %local.h.195
  %t273 = call i64 @"sx_f64_add"(i64 %t271, i64 %t272)
  store i64 %t273, ptr %local.cap.200
  %t274 = load i64, ptr %local.ca
  %t275 = load i64, ptr %local.h.195
  %t276 = call i64 @"sx_f64_sub"(i64 %t274, i64 %t275)
  store i64 %t276, ptr %local.cam.206
  br label %then10_end
then10_end:
  br label %endif10
else10:
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t277 = phi i64 [ 0, %then10_end ], [ 0, %else10_end ]
  %t278 = load i64, ptr %local.which
  %t279 = icmp eq i64 %t278, 5
  %t280 = zext i1 %t279 to i64
  %t281 = icmp ne i64 %t280, 0
  br i1 %t281, label %then11, label %else11
then11:
  %t282 = load i64, ptr %local.cb
  %t283 = load i64, ptr %local.h.195
  %t284 = call i64 @"sx_f64_add"(i64 %t282, i64 %t283)
  store i64 %t284, ptr %local.cbp.201
  %t285 = load i64, ptr %local.cb
  %t286 = load i64, ptr %local.h.195
  %t287 = call i64 @"sx_f64_sub"(i64 %t285, i64 %t286)
  store i64 %t287, ptr %local.cbm.207
  br label %then11_end
then11_end:
  br label %endif11
else11:
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t288 = phi i64 [ 0, %then11_end ], [ 0, %else11_end ]
  %t289 = load i64, ptr %local.abp.196
  %t290 = load i64, ptr %local.acp.197
  %t291 = load i64, ptr %local.bap.198
  %t292 = load i64, ptr %local.bcp.199
  %t293 = load i64, ptr %local.cap.200
  %t294 = load i64, ptr %local.cbp.201
  %t295 = load i64, ptr %local.ta
  %t296 = load i64, ptr %local.tb
  %t297 = load i64, ptr %local.tc
  %t298 = load i64, ptr %local.obs
  %t299 = call i64 @"train_beliefs"(i64 %t289, i64 %t290, i64 %t291, i64 %t292, i64 %t293, i64 %t294, i64 %t295, i64 %t296, i64 %t297, i64 %t298, i64 42)
  %t300 = load i64, ptr %local.abp.196
  %t301 = load i64, ptr %local.acp.197
  %t302 = load i64, ptr %local.bap.198
  %t303 = load i64, ptr %local.bcp.199
  %t304 = load i64, ptr %local.cap.200
  %t305 = load i64, ptr %local.cbp.201
  %t306 = load i64, ptr %local.ta
  %t307 = load i64, ptr %local.tb
  %t308 = load i64, ptr %local.tc
  %t309 = load i64, ptr %local.obs
  %t310 = call i64 @"train_beliefs"(i64 %t300, i64 %t301, i64 %t302, i64 %t303, i64 %t304, i64 %t305, i64 %t306, i64 %t307, i64 %t308, i64 %t309, i64 137)
  %t311 = call i64 @"sx_f64_add"(i64 %t299, i64 %t310)
  %t312 = load i64, ptr %local.abp.196
  %t313 = load i64, ptr %local.acp.197
  %t314 = load i64, ptr %local.bap.198
  %t315 = load i64, ptr %local.bcp.199
  %t316 = load i64, ptr %local.cap.200
  %t317 = load i64, ptr %local.cbp.201
  %t318 = load i64, ptr %local.ta
  %t319 = load i64, ptr %local.tb
  %t320 = load i64, ptr %local.tc
  %t321 = load i64, ptr %local.obs
  %t322 = call i64 @"train_beliefs"(i64 %t312, i64 %t313, i64 %t314, i64 %t315, i64 %t316, i64 %t317, i64 %t318, i64 %t319, i64 %t320, i64 %t321, i64 999)
  %t323 = call i64 @"sx_f64_add"(i64 %t311, i64 %t322)
  store i64 %t323, ptr %local.lp.208
  %t324 = load i64, ptr %local.abm.202
  %t325 = load i64, ptr %local.acm.203
  %t326 = load i64, ptr %local.bam.204
  %t327 = load i64, ptr %local.bcm.205
  %t328 = load i64, ptr %local.cam.206
  %t329 = load i64, ptr %local.cbm.207
  %t330 = load i64, ptr %local.ta
  %t331 = load i64, ptr %local.tb
  %t332 = load i64, ptr %local.tc
  %t333 = load i64, ptr %local.obs
  %t334 = call i64 @"train_beliefs"(i64 %t324, i64 %t325, i64 %t326, i64 %t327, i64 %t328, i64 %t329, i64 %t330, i64 %t331, i64 %t332, i64 %t333, i64 42)
  %t335 = load i64, ptr %local.abm.202
  %t336 = load i64, ptr %local.acm.203
  %t337 = load i64, ptr %local.bam.204
  %t338 = load i64, ptr %local.bcm.205
  %t339 = load i64, ptr %local.cam.206
  %t340 = load i64, ptr %local.cbm.207
  %t341 = load i64, ptr %local.ta
  %t342 = load i64, ptr %local.tb
  %t343 = load i64, ptr %local.tc
  %t344 = load i64, ptr %local.obs
  %t345 = call i64 @"train_beliefs"(i64 %t335, i64 %t336, i64 %t337, i64 %t338, i64 %t339, i64 %t340, i64 %t341, i64 %t342, i64 %t343, i64 %t344, i64 137)
  %t346 = call i64 @"sx_f64_add"(i64 %t334, i64 %t345)
  %t347 = load i64, ptr %local.abm.202
  %t348 = load i64, ptr %local.acm.203
  %t349 = load i64, ptr %local.bam.204
  %t350 = load i64, ptr %local.bcm.205
  %t351 = load i64, ptr %local.cam.206
  %t352 = load i64, ptr %local.cbm.207
  %t353 = load i64, ptr %local.ta
  %t354 = load i64, ptr %local.tb
  %t355 = load i64, ptr %local.tc
  %t356 = load i64, ptr %local.obs
  %t357 = call i64 @"train_beliefs"(i64 %t347, i64 %t348, i64 %t349, i64 %t350, i64 %t351, i64 %t352, i64 %t353, i64 %t354, i64 %t355, i64 %t356, i64 999)
  %t358 = call i64 @"sx_f64_add"(i64 %t346, i64 %t357)
  store i64 %t358, ptr %local.lm.209
  %t359 = load i64, ptr %local.lp.208
  %t360 = load i64, ptr %local.lm.209
  %t361 = call i64 @"sx_f64_sub"(i64 %t359, i64 %t360)
  %t362 = call i64 @f64_parse(ptr @.str.exp_anima_deep.20)
  %t363 = load i64, ptr %local.h.195
  %t364 = call i64 @"sx_f64_mul"(i64 %t362, i64 %t363)
  %t365 = call i64 @"sx_f64_div"(i64 %t361, i64 %t364)
  ret i64 %t365
}

define i64 @"clamp"(i64 %x, i64 %lo, i64 %hi) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %local.lo = alloca i64
  store i64 %lo, ptr %local.lo
  %local.hi = alloca i64
  store i64 %hi, ptr %local.hi
  %t366 = load i64, ptr %local.x
  %t367 = load i64, ptr %local.lo
  %t368 = call i64 @"sx_f64_lt"(i64 %t366, i64 %t367)
  %t369 = icmp ne i64 %t368, 0
  br i1 %t369, label %then12, label %else12
then12:
  %t370 = load i64, ptr %local.lo
  ret i64 %t370
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t371 = phi i64 [ 0, %else12_end ]
  %t372 = load i64, ptr %local.x
  %t373 = load i64, ptr %local.hi
  %t374 = call i64 @"sx_f64_gt"(i64 %t372, i64 %t373)
  %t375 = icmp ne i64 %t374, 0
  br i1 %t375, label %then13, label %else13
then13:
  %t376 = load i64, ptr %local.hi
  ret i64 %t376
else13:
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t377 = phi i64 [ 0, %else13_end ]
  %t378 = load i64, ptr %local.x
  ret i64 %t378
}

define i64 @"test_belief_interaction"() nounwind {
entry:
  %local.true_a.379 = alloca i64
  %local.true_b.380 = alloca i64
  %local.true_c.381 = alloca i64
  %local.obs.382 = alloca i64
  %local.loss_none.383 = alloca i64
  %local.ab.384 = alloca i64
  %local.ac.385 = alloca i64
  %local.ba.386 = alloca i64
  %local.bc.387 = alloca i64
  %local.ca.388 = alloca i64
  %local.cb.389 = alloca i64
  %local.mg.390 = alloca i64
  %local.cycle.391 = alloca i64
  %local.loss_learned.392 = alloca i64
  %t393 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.21)
  %t394 = ptrtoint ptr %t393 to i64
  %t395 = inttoptr i64 %t394 to ptr
  call void @intrinsic_println(ptr %t395)
  %t396 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.22)
  %t397 = ptrtoint ptr %t396 to i64
  %t398 = inttoptr i64 %t397 to ptr
  call void @intrinsic_println(ptr %t398)
  %t399 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.23)
  %t400 = ptrtoint ptr %t399 to i64
  %t401 = inttoptr i64 %t400 to ptr
  call void @intrinsic_println(ptr %t401)
  %t402 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.24)
  %t403 = ptrtoint ptr %t402 to i64
  %t404 = inttoptr i64 %t403 to ptr
  call void @intrinsic_println(ptr %t404)
  %t405 = call i64 @f64_parse(ptr @.str.exp_anima_deep.25)
  store i64 %t405, ptr %local.true_a.379
  %t406 = call i64 @f64_parse(ptr @.str.exp_anima_deep.26)
  store i64 %t406, ptr %local.true_b.380
  %t407 = call i64 @f64_parse(ptr @.str.exp_anima_deep.27)
  store i64 %t407, ptr %local.true_c.381
  store i64 100, ptr %local.obs.382
  %t408 = call i64 @f64_parse(ptr @.str.exp_anima_deep.28)
  %t409 = call i64 @f64_parse(ptr @.str.exp_anima_deep.29)
  %t410 = call i64 @f64_parse(ptr @.str.exp_anima_deep.30)
  %t411 = call i64 @f64_parse(ptr @.str.exp_anima_deep.31)
  %t412 = call i64 @f64_parse(ptr @.str.exp_anima_deep.32)
  %t413 = call i64 @f64_parse(ptr @.str.exp_anima_deep.33)
  %t414 = load i64, ptr %local.true_a.379
  %t415 = load i64, ptr %local.true_b.380
  %t416 = load i64, ptr %local.true_c.381
  %t417 = load i64, ptr %local.obs.382
  %t418 = call i64 @"train_beliefs"(i64 %t408, i64 %t409, i64 %t410, i64 %t411, i64 %t412, i64 %t413, i64 %t414, i64 %t415, i64 %t416, i64 %t417, i64 42)
  store i64 %t418, ptr %local.loss_none.383
  %t419 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.34)
  %t420 = ptrtoint ptr %t419 to i64
  %t421 = inttoptr i64 %t420 to ptr
  call void @intrinsic_print(ptr %t421)
  %t422 = load i64, ptr %local.loss_none.383
  %t423 = call i64 @"print_f64"(i64 %t422)
  %t424 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.35)
  %t425 = ptrtoint ptr %t424 to i64
  %t426 = inttoptr i64 %t425 to ptr
  call void @intrinsic_println(ptr %t426)
  %t427 = call i64 @f64_parse(ptr @.str.exp_anima_deep.36)
  store i64 %t427, ptr %local.ab.384
  %t428 = call i64 @f64_parse(ptr @.str.exp_anima_deep.37)
  store i64 %t428, ptr %local.ac.385
  %t429 = call i64 @f64_parse(ptr @.str.exp_anima_deep.38)
  store i64 %t429, ptr %local.ba.386
  %t430 = call i64 @f64_parse(ptr @.str.exp_anima_deep.39)
  store i64 %t430, ptr %local.bc.387
  %t431 = call i64 @f64_parse(ptr @.str.exp_anima_deep.40)
  store i64 %t431, ptr %local.ca.388
  %t432 = call i64 @f64_parse(ptr @.str.exp_anima_deep.41)
  store i64 %t432, ptr %local.cb.389
  %t433 = call i64 @f64_parse(ptr @.str.exp_anima_deep.42)
  store i64 %t433, ptr %local.mg.390
  store i64 0, ptr %local.cycle.391
  br label %loop14
loop14:
  %t434 = load i64, ptr %local.cycle.391
  %t435 = icmp slt i64 %t434, 40
  %t436 = zext i1 %t435 to i64
  %t437 = icmp ne i64 %t436, 0
  br i1 %t437, label %body14, label %endloop14
body14:
  %t438 = load i64, ptr %local.ab.384
  %t439 = load i64, ptr %local.ac.385
  %t440 = load i64, ptr %local.ba.386
  %t441 = load i64, ptr %local.bc.387
  %t442 = load i64, ptr %local.ca.388
  %t443 = load i64, ptr %local.cb.389
  %t444 = load i64, ptr %local.true_a.379
  %t445 = load i64, ptr %local.true_b.380
  %t446 = load i64, ptr %local.true_c.381
  %t447 = load i64, ptr %local.obs.382
  %t448 = call i64 @"mg_belief"(i64 %t438, i64 %t439, i64 %t440, i64 %t441, i64 %t442, i64 %t443, i64 %t444, i64 %t445, i64 %t446, i64 0, i64 %t447)
  store i64 %t448, ptr %local.mg.390
  %t449 = load i64, ptr %local.ab.384
  %t450 = call i64 @f64_parse(ptr @.str.exp_anima_deep.43)
  %t451 = load i64, ptr %local.mg.390
  %t452 = call i64 @"sx_f64_mul"(i64 %t450, i64 %t451)
  %t453 = call i64 @"sx_f64_sub"(i64 %t449, i64 %t452)
  %t454 = call i64 @f64_parse(ptr @.str.exp_anima_deep.44)
  %t455 = call i64 @f64_parse(ptr @.str.exp_anima_deep.45)
  %t456 = call i64 @"sx_f64_sub"(i64 %t454, i64 %t455)
  %t457 = call i64 @f64_parse(ptr @.str.exp_anima_deep.46)
  %t458 = call i64 @"clamp"(i64 %t453, i64 %t456, i64 %t457)
  store i64 %t458, ptr %local.ab.384
  %t459 = load i64, ptr %local.ab.384
  %t460 = load i64, ptr %local.ac.385
  %t461 = load i64, ptr %local.ba.386
  %t462 = load i64, ptr %local.bc.387
  %t463 = load i64, ptr %local.ca.388
  %t464 = load i64, ptr %local.cb.389
  %t465 = load i64, ptr %local.true_a.379
  %t466 = load i64, ptr %local.true_b.380
  %t467 = load i64, ptr %local.true_c.381
  %t468 = load i64, ptr %local.obs.382
  %t469 = call i64 @"mg_belief"(i64 %t459, i64 %t460, i64 %t461, i64 %t462, i64 %t463, i64 %t464, i64 %t465, i64 %t466, i64 %t467, i64 1, i64 %t468)
  store i64 %t469, ptr %local.mg.390
  %t470 = load i64, ptr %local.ac.385
  %t471 = call i64 @f64_parse(ptr @.str.exp_anima_deep.47)
  %t472 = load i64, ptr %local.mg.390
  %t473 = call i64 @"sx_f64_mul"(i64 %t471, i64 %t472)
  %t474 = call i64 @"sx_f64_sub"(i64 %t470, i64 %t473)
  %t475 = call i64 @f64_parse(ptr @.str.exp_anima_deep.48)
  %t476 = call i64 @f64_parse(ptr @.str.exp_anima_deep.49)
  %t477 = call i64 @"sx_f64_sub"(i64 %t475, i64 %t476)
  %t478 = call i64 @f64_parse(ptr @.str.exp_anima_deep.50)
  %t479 = call i64 @"clamp"(i64 %t474, i64 %t477, i64 %t478)
  store i64 %t479, ptr %local.ac.385
  %t480 = load i64, ptr %local.ab.384
  %t481 = load i64, ptr %local.ac.385
  %t482 = load i64, ptr %local.ba.386
  %t483 = load i64, ptr %local.bc.387
  %t484 = load i64, ptr %local.ca.388
  %t485 = load i64, ptr %local.cb.389
  %t486 = load i64, ptr %local.true_a.379
  %t487 = load i64, ptr %local.true_b.380
  %t488 = load i64, ptr %local.true_c.381
  %t489 = load i64, ptr %local.obs.382
  %t490 = call i64 @"mg_belief"(i64 %t480, i64 %t481, i64 %t482, i64 %t483, i64 %t484, i64 %t485, i64 %t486, i64 %t487, i64 %t488, i64 2, i64 %t489)
  store i64 %t490, ptr %local.mg.390
  %t491 = load i64, ptr %local.ba.386
  %t492 = call i64 @f64_parse(ptr @.str.exp_anima_deep.51)
  %t493 = load i64, ptr %local.mg.390
  %t494 = call i64 @"sx_f64_mul"(i64 %t492, i64 %t493)
  %t495 = call i64 @"sx_f64_sub"(i64 %t491, i64 %t494)
  %t496 = call i64 @f64_parse(ptr @.str.exp_anima_deep.52)
  %t497 = call i64 @f64_parse(ptr @.str.exp_anima_deep.53)
  %t498 = call i64 @"sx_f64_sub"(i64 %t496, i64 %t497)
  %t499 = call i64 @f64_parse(ptr @.str.exp_anima_deep.54)
  %t500 = call i64 @"clamp"(i64 %t495, i64 %t498, i64 %t499)
  store i64 %t500, ptr %local.ba.386
  %t501 = load i64, ptr %local.ab.384
  %t502 = load i64, ptr %local.ac.385
  %t503 = load i64, ptr %local.ba.386
  %t504 = load i64, ptr %local.bc.387
  %t505 = load i64, ptr %local.ca.388
  %t506 = load i64, ptr %local.cb.389
  %t507 = load i64, ptr %local.true_a.379
  %t508 = load i64, ptr %local.true_b.380
  %t509 = load i64, ptr %local.true_c.381
  %t510 = load i64, ptr %local.obs.382
  %t511 = call i64 @"mg_belief"(i64 %t501, i64 %t502, i64 %t503, i64 %t504, i64 %t505, i64 %t506, i64 %t507, i64 %t508, i64 %t509, i64 3, i64 %t510)
  store i64 %t511, ptr %local.mg.390
  %t512 = load i64, ptr %local.bc.387
  %t513 = call i64 @f64_parse(ptr @.str.exp_anima_deep.55)
  %t514 = load i64, ptr %local.mg.390
  %t515 = call i64 @"sx_f64_mul"(i64 %t513, i64 %t514)
  %t516 = call i64 @"sx_f64_sub"(i64 %t512, i64 %t515)
  %t517 = call i64 @f64_parse(ptr @.str.exp_anima_deep.56)
  %t518 = call i64 @f64_parse(ptr @.str.exp_anima_deep.57)
  %t519 = call i64 @"sx_f64_sub"(i64 %t517, i64 %t518)
  %t520 = call i64 @f64_parse(ptr @.str.exp_anima_deep.58)
  %t521 = call i64 @"clamp"(i64 %t516, i64 %t519, i64 %t520)
  store i64 %t521, ptr %local.bc.387
  %t522 = load i64, ptr %local.ab.384
  %t523 = load i64, ptr %local.ac.385
  %t524 = load i64, ptr %local.ba.386
  %t525 = load i64, ptr %local.bc.387
  %t526 = load i64, ptr %local.ca.388
  %t527 = load i64, ptr %local.cb.389
  %t528 = load i64, ptr %local.true_a.379
  %t529 = load i64, ptr %local.true_b.380
  %t530 = load i64, ptr %local.true_c.381
  %t531 = load i64, ptr %local.obs.382
  %t532 = call i64 @"mg_belief"(i64 %t522, i64 %t523, i64 %t524, i64 %t525, i64 %t526, i64 %t527, i64 %t528, i64 %t529, i64 %t530, i64 4, i64 %t531)
  store i64 %t532, ptr %local.mg.390
  %t533 = load i64, ptr %local.ca.388
  %t534 = call i64 @f64_parse(ptr @.str.exp_anima_deep.59)
  %t535 = load i64, ptr %local.mg.390
  %t536 = call i64 @"sx_f64_mul"(i64 %t534, i64 %t535)
  %t537 = call i64 @"sx_f64_sub"(i64 %t533, i64 %t536)
  %t538 = call i64 @f64_parse(ptr @.str.exp_anima_deep.60)
  %t539 = call i64 @f64_parse(ptr @.str.exp_anima_deep.61)
  %t540 = call i64 @"sx_f64_sub"(i64 %t538, i64 %t539)
  %t541 = call i64 @f64_parse(ptr @.str.exp_anima_deep.62)
  %t542 = call i64 @"clamp"(i64 %t537, i64 %t540, i64 %t541)
  store i64 %t542, ptr %local.ca.388
  %t543 = load i64, ptr %local.ab.384
  %t544 = load i64, ptr %local.ac.385
  %t545 = load i64, ptr %local.ba.386
  %t546 = load i64, ptr %local.bc.387
  %t547 = load i64, ptr %local.ca.388
  %t548 = load i64, ptr %local.cb.389
  %t549 = load i64, ptr %local.true_a.379
  %t550 = load i64, ptr %local.true_b.380
  %t551 = load i64, ptr %local.true_c.381
  %t552 = load i64, ptr %local.obs.382
  %t553 = call i64 @"mg_belief"(i64 %t543, i64 %t544, i64 %t545, i64 %t546, i64 %t547, i64 %t548, i64 %t549, i64 %t550, i64 %t551, i64 5, i64 %t552)
  store i64 %t553, ptr %local.mg.390
  %t554 = load i64, ptr %local.cb.389
  %t555 = call i64 @f64_parse(ptr @.str.exp_anima_deep.63)
  %t556 = load i64, ptr %local.mg.390
  %t557 = call i64 @"sx_f64_mul"(i64 %t555, i64 %t556)
  %t558 = call i64 @"sx_f64_sub"(i64 %t554, i64 %t557)
  %t559 = call i64 @f64_parse(ptr @.str.exp_anima_deep.64)
  %t560 = call i64 @f64_parse(ptr @.str.exp_anima_deep.65)
  %t561 = call i64 @"sx_f64_sub"(i64 %t559, i64 %t560)
  %t562 = call i64 @f64_parse(ptr @.str.exp_anima_deep.66)
  %t563 = call i64 @"clamp"(i64 %t558, i64 %t561, i64 %t562)
  store i64 %t563, ptr %local.cb.389
  %t564 = load i64, ptr %local.cycle.391
  %t565 = add i64 %t564, 1
  store i64 %t565, ptr %local.cycle.391
  br label %loop14
endloop14:
  %t566 = load i64, ptr %local.ab.384
  %t567 = load i64, ptr %local.ac.385
  %t568 = load i64, ptr %local.ba.386
  %t569 = load i64, ptr %local.bc.387
  %t570 = load i64, ptr %local.ca.388
  %t571 = load i64, ptr %local.cb.389
  %t572 = load i64, ptr %local.true_a.379
  %t573 = load i64, ptr %local.true_b.380
  %t574 = load i64, ptr %local.true_c.381
  %t575 = load i64, ptr %local.obs.382
  %t576 = call i64 @"train_beliefs"(i64 %t566, i64 %t567, i64 %t568, i64 %t569, i64 %t570, i64 %t571, i64 %t572, i64 %t573, i64 %t574, i64 %t575, i64 42)
  store i64 %t576, ptr %local.loss_learned.392
  %t577 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.67)
  %t578 = ptrtoint ptr %t577 to i64
  %t579 = inttoptr i64 %t578 to ptr
  call void @intrinsic_print(ptr %t579)
  %t580 = load i64, ptr %local.loss_learned.392
  %t581 = call i64 @"print_f64"(i64 %t580)
  %t582 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.68)
  %t583 = ptrtoint ptr %t582 to i64
  %t584 = inttoptr i64 %t583 to ptr
  call void @intrinsic_println(ptr %t584)
  %t585 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.69)
  %t586 = ptrtoint ptr %t585 to i64
  %t587 = inttoptr i64 %t586 to ptr
  call void @intrinsic_println(ptr %t587)
  %t588 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.70)
  %t589 = ptrtoint ptr %t588 to i64
  %t590 = inttoptr i64 %t589 to ptr
  call void @intrinsic_print(ptr %t590)
  %t591 = load i64, ptr %local.ab.384
  %t592 = call i64 @"print_f64"(i64 %t591)
  %t593 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.71)
  %t594 = ptrtoint ptr %t593 to i64
  %t595 = inttoptr i64 %t594 to ptr
  call void @intrinsic_print(ptr %t595)
  %t596 = load i64, ptr %local.ac.385
  %t597 = call i64 @"print_f64"(i64 %t596)
  %t598 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.72)
  %t599 = ptrtoint ptr %t598 to i64
  %t600 = inttoptr i64 %t599 to ptr
  call void @intrinsic_println(ptr %t600)
  %t601 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.73)
  %t602 = ptrtoint ptr %t601 to i64
  %t603 = inttoptr i64 %t602 to ptr
  call void @intrinsic_print(ptr %t603)
  %t604 = load i64, ptr %local.ba.386
  %t605 = call i64 @"print_f64"(i64 %t604)
  %t606 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.74)
  %t607 = ptrtoint ptr %t606 to i64
  %t608 = inttoptr i64 %t607 to ptr
  call void @intrinsic_print(ptr %t608)
  %t609 = load i64, ptr %local.bc.387
  %t610 = call i64 @"print_f64"(i64 %t609)
  %t611 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.75)
  %t612 = ptrtoint ptr %t611 to i64
  %t613 = inttoptr i64 %t612 to ptr
  call void @intrinsic_println(ptr %t613)
  %t614 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.76)
  %t615 = ptrtoint ptr %t614 to i64
  %t616 = inttoptr i64 %t615 to ptr
  call void @intrinsic_print(ptr %t616)
  %t617 = load i64, ptr %local.ca.388
  %t618 = call i64 @"print_f64"(i64 %t617)
  %t619 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.77)
  %t620 = ptrtoint ptr %t619 to i64
  %t621 = inttoptr i64 %t620 to ptr
  call void @intrinsic_print(ptr %t621)
  %t622 = load i64, ptr %local.cb.389
  %t623 = call i64 @"print_f64"(i64 %t622)
  %t624 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.78)
  %t625 = ptrtoint ptr %t624 to i64
  %t626 = inttoptr i64 %t625 to ptr
  call void @intrinsic_println(ptr %t626)
  %t627 = load i64, ptr %local.loss_learned.392
  %t628 = load i64, ptr %local.loss_none.383
  %t629 = call i64 @f64_parse(ptr @.str.exp_anima_deep.79)
  %t630 = call i64 @"sx_f64_add"(i64 %t628, i64 %t629)
  %t631 = call i64 @"sx_f64_le"(i64 %t627, i64 %t630)
  %t632 = icmp ne i64 %t631, 0
  br i1 %t632, label %then15, label %else15
then15:
  %t633 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.80)
  %t634 = ptrtoint ptr %t633 to i64
  %t635 = inttoptr i64 %t634 to ptr
  call void @intrinsic_println(ptr %t635)
  br label %then15_end
then15_end:
  br label %endif15
else15:
  %t636 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.81)
  %t637 = ptrtoint ptr %t636 to i64
  %t638 = inttoptr i64 %t637 to ptr
  call void @intrinsic_println(ptr %t638)
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t639 = phi i64 [ 0, %then15_end ], [ 0, %else15_end ]
  %t640 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.82)
  %t641 = ptrtoint ptr %t640 to i64
  %t642 = inttoptr i64 %t641 to ptr
  call void @intrinsic_println(ptr %t642)
  ret i64 0
}

define i64 @"train_with_consolidation"(i64 %threshold, i64 %n_episodes, i64 %consolidate_every, i64 %seed) nounwind {
entry:
  %local.semantic_sum.643 = alloca i64
  %local.semantic_count.644 = alloca i64
  %local.episodic_sum.645 = alloca i64
  %local.episodic_count.646 = alloca i64
  %local.episodic_importance_sum.647 = alloca i64
  %local.step.648 = alloca i64
  %local.rng.649 = alloca i64
  %local.obs.650 = alloca i64
  %local.importance.651 = alloca i64
  %local.consolidated.652 = alloca i64
  %local.true_val.653 = alloca i64
  %local.current_estimate.654 = alloca i64
  %local.avg_importance.655 = alloca i64
  %local.estimate.656 = alloca i64
  %local.err.657 = alloca i64
  %local.threshold = alloca i64
  store i64 %threshold, ptr %local.threshold
  %local.n_episodes = alloca i64
  store i64 %n_episodes, ptr %local.n_episodes
  %local.consolidate_every = alloca i64
  store i64 %consolidate_every, ptr %local.consolidate_every
  %local.seed = alloca i64
  store i64 %seed, ptr %local.seed
  %t658 = call i64 @f64_parse(ptr @.str.exp_anima_deep.83)
  store i64 %t658, ptr %local.semantic_sum.643
  %t659 = call i64 @f64_parse(ptr @.str.exp_anima_deep.84)
  store i64 %t659, ptr %local.semantic_count.644
  %t660 = call i64 @f64_parse(ptr @.str.exp_anima_deep.85)
  store i64 %t660, ptr %local.episodic_sum.645
  %t661 = call i64 @f64_parse(ptr @.str.exp_anima_deep.86)
  store i64 %t661, ptr %local.episodic_count.646
  %t662 = call i64 @f64_parse(ptr @.str.exp_anima_deep.87)
  store i64 %t662, ptr %local.episodic_importance_sum.647
  store i64 0, ptr %local.step.648
  %t663 = load i64, ptr %local.seed
  store i64 %t663, ptr %local.rng.649
  %t664 = call i64 @f64_parse(ptr @.str.exp_anima_deep.88)
  store i64 %t664, ptr %local.obs.650
  %t665 = call i64 @f64_parse(ptr @.str.exp_anima_deep.89)
  store i64 %t665, ptr %local.importance.651
  store i64 0, ptr %local.consolidated.652
  %t666 = call i64 @f64_parse(ptr @.str.exp_anima_deep.90)
  store i64 %t666, ptr %local.true_val.653
  br label %loop16
loop16:
  %t667 = load i64, ptr %local.step.648
  %t668 = load i64, ptr %local.n_episodes
  %t669 = icmp slt i64 %t667, %t668
  %t670 = zext i1 %t669 to i64
  %t671 = icmp ne i64 %t670, 0
  br i1 %t671, label %body16, label %endloop16
body16:
  %t672 = load i64, ptr %local.rng.649
  %t673 = call i64 @"lcg_next"(i64 %t672)
  store i64 %t673, ptr %local.rng.649
  %t674 = load i64, ptr %local.true_val.653
  %t675 = load i64, ptr %local.rng.649
  %t676 = call i64 @"lcg_f64"(i64 %t675)
  %t677 = call i64 @f64_parse(ptr @.str.exp_anima_deep.91)
  %t678 = call i64 @"sx_f64_sub"(i64 %t676, i64 %t677)
  %t679 = call i64 @f64_parse(ptr @.str.exp_anima_deep.92)
  %t680 = call i64 @"sx_f64_mul"(i64 %t678, i64 %t679)
  %t681 = call i64 @"sx_f64_add"(i64 %t674, i64 %t680)
  store i64 %t681, ptr %local.obs.650
  %t682 = load i64, ptr %local.true_val.653
  store i64 %t682, ptr %local.current_estimate.654
  %t683 = load i64, ptr %local.semantic_count.644
  %t684 = call i64 @f64_parse(ptr @.str.exp_anima_deep.93)
  %t685 = call i64 @"sx_f64_gt"(i64 %t683, i64 %t684)
  %t686 = icmp ne i64 %t685, 0
  br i1 %t686, label %then17, label %else17
then17:
  %t687 = load i64, ptr %local.semantic_sum.643
  %t688 = load i64, ptr %local.semantic_count.644
  %t689 = call i64 @"sx_f64_div"(i64 %t687, i64 %t688)
  store i64 %t689, ptr %local.current_estimate.654
  br label %then17_end
then17_end:
  br label %endif17
else17:
  %t690 = load i64, ptr %local.episodic_count.646
  %t691 = call i64 @f64_parse(ptr @.str.exp_anima_deep.94)
  %t692 = call i64 @"sx_f64_gt"(i64 %t690, i64 %t691)
  %t693 = icmp ne i64 %t692, 0
  br i1 %t693, label %then18, label %else18
then18:
  %t694 = load i64, ptr %local.episodic_sum.645
  %t695 = load i64, ptr %local.episodic_count.646
  %t696 = call i64 @"sx_f64_div"(i64 %t694, i64 %t695)
  store i64 %t696, ptr %local.current_estimate.654
  br label %then18_end
then18_end:
  br label %endif18
else18:
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t697 = phi i64 [ 0, %then18_end ], [ 0, %else18_end ]
  br label %else17_end
else17_end:
  br label %endif17
endif17:
  %t698 = phi i64 [ 0, %then17_end ], [ %t697, %else17_end ]
  %t699 = load i64, ptr %local.obs.650
  %t700 = load i64, ptr %local.current_estimate.654
  %t701 = call i64 @"sx_f64_sub"(i64 %t699, i64 %t700)
  %t702 = call i64 @"abs_f64"(i64 %t701)
  store i64 %t702, ptr %local.importance.651
  %t703 = load i64, ptr %local.episodic_sum.645
  %t704 = load i64, ptr %local.obs.650
  %t705 = call i64 @"sx_f64_add"(i64 %t703, i64 %t704)
  store i64 %t705, ptr %local.episodic_sum.645
  %t706 = load i64, ptr %local.episodic_count.646
  %t707 = call i64 @f64_parse(ptr @.str.exp_anima_deep.95)
  %t708 = call i64 @"sx_f64_add"(i64 %t706, i64 %t707)
  store i64 %t708, ptr %local.episodic_count.646
  %t709 = load i64, ptr %local.episodic_importance_sum.647
  %t710 = load i64, ptr %local.importance.651
  %t711 = call i64 @"sx_f64_add"(i64 %t709, i64 %t710)
  store i64 %t711, ptr %local.episodic_importance_sum.647
  %t712 = load i64, ptr %local.step.648
  %t713 = icmp sgt i64 %t712, 0
  %t714 = zext i1 %t713 to i64
  %t715 = icmp ne i64 %t714, 0
  br i1 %t715, label %then19, label %else19
then19:
  %t716 = load i64, ptr %local.step.648
  %t717 = load i64, ptr %local.consolidate_every
  %t718 = srem i64 %t716, %t717
  %t719 = icmp eq i64 %t718, 0
  %t720 = zext i1 %t719 to i64
  %t721 = icmp ne i64 %t720, 0
  br i1 %t721, label %then20, label %else20
then20:
  %t722 = load i64, ptr %local.episodic_importance_sum.647
  %t723 = load i64, ptr %local.episodic_count.646
  %t724 = call i64 @"sx_f64_div"(i64 %t722, i64 %t723)
  store i64 %t724, ptr %local.avg_importance.655
  %t725 = load i64, ptr %local.avg_importance.655
  %t726 = load i64, ptr %local.threshold
  %t727 = call i64 @"sx_f64_gt"(i64 %t725, i64 %t726)
  %t728 = icmp ne i64 %t727, 0
  br i1 %t728, label %then21, label %else21
then21:
  %t729 = load i64, ptr %local.semantic_sum.643
  %t730 = load i64, ptr %local.episodic_sum.645
  %t731 = call i64 @"sx_f64_add"(i64 %t729, i64 %t730)
  store i64 %t731, ptr %local.semantic_sum.643
  %t732 = load i64, ptr %local.semantic_count.644
  %t733 = load i64, ptr %local.episodic_count.646
  %t734 = call i64 @"sx_f64_add"(i64 %t732, i64 %t733)
  store i64 %t734, ptr %local.semantic_count.644
  %t735 = load i64, ptr %local.consolidated.652
  %t736 = add i64 %t735, 1
  store i64 %t736, ptr %local.consolidated.652
  br label %then21_end
then21_end:
  br label %endif21
else21:
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t737 = phi i64 [ 0, %then21_end ], [ 0, %else21_end ]
  %t738 = call i64 @f64_parse(ptr @.str.exp_anima_deep.96)
  store i64 %t738, ptr %local.episodic_sum.645
  %t739 = call i64 @f64_parse(ptr @.str.exp_anima_deep.97)
  store i64 %t739, ptr %local.episodic_count.646
  %t740 = call i64 @f64_parse(ptr @.str.exp_anima_deep.98)
  store i64 %t740, ptr %local.episodic_importance_sum.647
  br label %then20_end
then20_end:
  br label %endif20
else20:
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t741 = phi i64 [ 0, %then20_end ], [ 0, %else20_end ]
  br label %then19_end
then19_end:
  br label %endif19
else19:
  br label %else19_end
else19_end:
  br label %endif19
endif19:
  %t742 = phi i64 [ %t741, %then19_end ], [ 0, %else19_end ]
  %t743 = load i64, ptr %local.step.648
  %t744 = add i64 %t743, 1
  store i64 %t744, ptr %local.step.648
  br label %loop16
endloop16:
  %t745 = call i64 @f64_parse(ptr @.str.exp_anima_deep.99)
  store i64 %t745, ptr %local.estimate.656
  %t746 = load i64, ptr %local.semantic_count.644
  %t747 = call i64 @f64_parse(ptr @.str.exp_anima_deep.100)
  %t748 = call i64 @"sx_f64_gt"(i64 %t746, i64 %t747)
  %t749 = icmp ne i64 %t748, 0
  br i1 %t749, label %then22, label %else22
then22:
  %t750 = load i64, ptr %local.semantic_sum.643
  %t751 = load i64, ptr %local.semantic_count.644
  %t752 = call i64 @"sx_f64_div"(i64 %t750, i64 %t751)
  store i64 %t752, ptr %local.estimate.656
  br label %then22_end
then22_end:
  br label %endif22
else22:
  br label %else22_end
else22_end:
  br label %endif22
endif22:
  %t753 = phi i64 [ 0, %then22_end ], [ 0, %else22_end ]
  %t754 = load i64, ptr %local.estimate.656
  %t755 = load i64, ptr %local.true_val.653
  %t756 = call i64 @"sx_f64_sub"(i64 %t754, i64 %t755)
  store i64 %t756, ptr %local.err.657
  %t757 = load i64, ptr %local.err.657
  %t758 = load i64, ptr %local.err.657
  %t759 = call i64 @"sx_f64_mul"(i64 %t757, i64 %t758)
  ret i64 %t759
}

define i64 @"test_consolidation"() nounwind {
entry:
  %local.t.760 = alloca i64
  %local.best_t.761 = alloca i64
  %local.best_loss.762 = alloca i64
  %local.sweep.763 = alloca i64
  %local.loss.764 = alloca i64
  %local.learned_t.765 = alloca i64
  %local.cycle.766 = alloca i64
  %local.h.767 = alloca i64
  %local.lp.768 = alloca i64
  %local.lm.769 = alloca i64
  %local.mg.770 = alloca i64
  %local.learned_loss.771 = alloca i64
  %t772 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.101)
  %t773 = ptrtoint ptr %t772 to i64
  %t774 = inttoptr i64 %t773 to ptr
  call void @intrinsic_println(ptr %t774)
  %t775 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.102)
  %t776 = ptrtoint ptr %t775 to i64
  %t777 = inttoptr i64 %t776 to ptr
  call void @intrinsic_println(ptr %t777)
  %t778 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.103)
  %t779 = ptrtoint ptr %t778 to i64
  %t780 = inttoptr i64 %t779 to ptr
  call void @intrinsic_println(ptr %t780)
  %t781 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.104)
  %t782 = ptrtoint ptr %t781 to i64
  %t783 = inttoptr i64 %t782 to ptr
  call void @intrinsic_println(ptr %t783)
  %t784 = call i64 @f64_parse(ptr @.str.exp_anima_deep.105)
  store i64 %t784, ptr %local.t.760
  %t785 = call i64 @f64_parse(ptr @.str.exp_anima_deep.106)
  store i64 %t785, ptr %local.best_t.761
  %t786 = call i64 @f64_parse(ptr @.str.exp_anima_deep.107)
  store i64 %t786, ptr %local.best_loss.762
  store i64 0, ptr %local.sweep.763
  br label %loop23
loop23:
  %t787 = load i64, ptr %local.sweep.763
  %t788 = icmp slt i64 %t787, 11
  %t789 = zext i1 %t788 to i64
  %t790 = icmp ne i64 %t789, 0
  br i1 %t790, label %body23, label %endloop23
body23:
  %t791 = load i64, ptr %local.sweep.763
  %t792 = call i64 @"sx_int_to_f64"(i64 %t791)
  %t793 = call i64 @f64_parse(ptr @.str.exp_anima_deep.108)
  %t794 = call i64 @"sx_f64_mul"(i64 %t792, i64 %t793)
  store i64 %t794, ptr %local.t.760
  %t795 = load i64, ptr %local.t.760
  %t796 = call i64 @"train_with_consolidation"(i64 %t795, i64 200, i64 20, i64 42)
  store i64 %t796, ptr %local.loss.764
  %t797 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.109)
  %t798 = ptrtoint ptr %t797 to i64
  %t799 = inttoptr i64 %t798 to ptr
  call void @intrinsic_print(ptr %t799)
  %t800 = load i64, ptr %local.t.760
  %t801 = call i64 @"print_f64"(i64 %t800)
  %t802 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.110)
  %t803 = ptrtoint ptr %t802 to i64
  %t804 = inttoptr i64 %t803 to ptr
  call void @intrinsic_print(ptr %t804)
  %t805 = load i64, ptr %local.loss.764
  %t806 = call i64 @"print_f64"(i64 %t805)
  %t807 = load i64, ptr %local.t.760
  %t808 = call i64 @f64_parse(ptr @.str.exp_anima_deep.111)
  %t809 = call i64 @"sx_f64_lt"(i64 %t807, i64 %t808)
  %t810 = icmp ne i64 %t809, 0
  br i1 %t810, label %then24, label %else24
then24:
  %t811 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.112)
  %t812 = ptrtoint ptr %t811 to i64
  %t813 = inttoptr i64 %t812 to ptr
  call void @intrinsic_println(ptr %t813)
  br label %then24_end
then24_end:
  br label %endif24
else24:
  %t814 = load i64, ptr %local.t.760
  %t815 = call i64 @f64_parse(ptr @.str.exp_anima_deep.113)
  %t816 = call i64 @"sx_f64_gt"(i64 %t814, i64 %t815)
  %t817 = icmp ne i64 %t816, 0
  br i1 %t817, label %then25, label %else25
then25:
  %t818 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.114)
  %t819 = ptrtoint ptr %t818 to i64
  %t820 = inttoptr i64 %t819 to ptr
  call void @intrinsic_println(ptr %t820)
  br label %then25_end
then25_end:
  br label %endif25
else25:
  %t821 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.115)
  %t822 = ptrtoint ptr %t821 to i64
  %t823 = inttoptr i64 %t822 to ptr
  call void @intrinsic_println(ptr %t823)
  br label %else25_end
else25_end:
  br label %endif25
endif25:
  %t824 = phi i64 [ 0, %then25_end ], [ 0, %else25_end ]
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t825 = phi i64 [ 0, %then24_end ], [ %t824, %else24_end ]
  %t826 = load i64, ptr %local.loss.764
  %t827 = load i64, ptr %local.best_loss.762
  %t828 = call i64 @"sx_f64_lt"(i64 %t826, i64 %t827)
  %t829 = icmp ne i64 %t828, 0
  br i1 %t829, label %then26, label %else26
then26:
  %t830 = load i64, ptr %local.loss.764
  store i64 %t830, ptr %local.best_loss.762
  %t831 = load i64, ptr %local.t.760
  store i64 %t831, ptr %local.best_t.761
  br label %then26_end
then26_end:
  br label %endif26
else26:
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t832 = phi i64 [ 0, %then26_end ], [ 0, %else26_end ]
  %t833 = load i64, ptr %local.sweep.763
  %t834 = add i64 %t833, 1
  store i64 %t834, ptr %local.sweep.763
  br label %loop23
endloop23:
  %t835 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.116)
  %t836 = ptrtoint ptr %t835 to i64
  %t837 = inttoptr i64 %t836 to ptr
  call void @intrinsic_println(ptr %t837)
  %t838 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.117)
  %t839 = ptrtoint ptr %t838 to i64
  %t840 = inttoptr i64 %t839 to ptr
  call void @intrinsic_print(ptr %t840)
  %t841 = load i64, ptr %local.best_t.761
  %t842 = call i64 @"print_f64"(i64 %t841)
  %t843 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.118)
  %t844 = ptrtoint ptr %t843 to i64
  %t845 = inttoptr i64 %t844 to ptr
  call void @intrinsic_print(ptr %t845)
  %t846 = load i64, ptr %local.best_loss.762
  %t847 = call i64 @"print_f64"(i64 %t846)
  %t848 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.119)
  %t849 = ptrtoint ptr %t848 to i64
  %t850 = inttoptr i64 %t849 to ptr
  call void @intrinsic_println(ptr %t850)
  %t851 = call i64 @f64_parse(ptr @.str.exp_anima_deep.120)
  store i64 %t851, ptr %local.learned_t.765
  store i64 0, ptr %local.cycle.766
  %t852 = call i64 @f64_parse(ptr @.str.exp_anima_deep.121)
  store i64 %t852, ptr %local.h.767
  br label %loop27
loop27:
  %t853 = load i64, ptr %local.cycle.766
  %t854 = icmp slt i64 %t853, 30
  %t855 = zext i1 %t854 to i64
  %t856 = icmp ne i64 %t855, 0
  br i1 %t856, label %body27, label %endloop27
body27:
  %t857 = load i64, ptr %local.learned_t.765
  %t858 = load i64, ptr %local.h.767
  %t859 = call i64 @"sx_f64_add"(i64 %t857, i64 %t858)
  %t860 = call i64 @"train_with_consolidation"(i64 %t859, i64 200, i64 20, i64 42)
  %t861 = load i64, ptr %local.learned_t.765
  %t862 = load i64, ptr %local.h.767
  %t863 = call i64 @"sx_f64_add"(i64 %t861, i64 %t862)
  %t864 = call i64 @"train_with_consolidation"(i64 %t863, i64 200, i64 20, i64 137)
  %t865 = call i64 @"sx_f64_add"(i64 %t860, i64 %t864)
  store i64 %t865, ptr %local.lp.768
  %t866 = load i64, ptr %local.learned_t.765
  %t867 = load i64, ptr %local.h.767
  %t868 = call i64 @"sx_f64_sub"(i64 %t866, i64 %t867)
  %t869 = call i64 @"train_with_consolidation"(i64 %t868, i64 200, i64 20, i64 42)
  %t870 = load i64, ptr %local.learned_t.765
  %t871 = load i64, ptr %local.h.767
  %t872 = call i64 @"sx_f64_sub"(i64 %t870, i64 %t871)
  %t873 = call i64 @"train_with_consolidation"(i64 %t872, i64 200, i64 20, i64 137)
  %t874 = call i64 @"sx_f64_add"(i64 %t869, i64 %t873)
  store i64 %t874, ptr %local.lm.769
  %t875 = load i64, ptr %local.lp.768
  %t876 = load i64, ptr %local.lm.769
  %t877 = call i64 @"sx_f64_sub"(i64 %t875, i64 %t876)
  %t878 = call i64 @f64_parse(ptr @.str.exp_anima_deep.122)
  %t879 = load i64, ptr %local.h.767
  %t880 = call i64 @"sx_f64_mul"(i64 %t878, i64 %t879)
  %t881 = call i64 @"sx_f64_div"(i64 %t877, i64 %t880)
  store i64 %t881, ptr %local.mg.770
  %t882 = load i64, ptr %local.learned_t.765
  %t883 = call i64 @f64_parse(ptr @.str.exp_anima_deep.123)
  %t884 = load i64, ptr %local.mg.770
  %t885 = call i64 @"sx_f64_mul"(i64 %t883, i64 %t884)
  %t886 = call i64 @"sx_f64_sub"(i64 %t882, i64 %t885)
  %t887 = call i64 @f64_parse(ptr @.str.exp_anima_deep.124)
  %t888 = call i64 @f64_parse(ptr @.str.exp_anima_deep.125)
  %t889 = call i64 @"clamp"(i64 %t886, i64 %t887, i64 %t888)
  store i64 %t889, ptr %local.learned_t.765
  %t890 = load i64, ptr %local.cycle.766
  %t891 = add i64 %t890, 1
  store i64 %t891, ptr %local.cycle.766
  br label %loop27
endloop27:
  %t892 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.126)
  %t893 = ptrtoint ptr %t892 to i64
  %t894 = inttoptr i64 %t893 to ptr
  call void @intrinsic_print(ptr %t894)
  %t895 = load i64, ptr %local.learned_t.765
  %t896 = call i64 @"print_f64"(i64 %t895)
  %t897 = load i64, ptr %local.learned_t.765
  %t898 = call i64 @"train_with_consolidation"(i64 %t897, i64 200, i64 20, i64 42)
  store i64 %t898, ptr %local.learned_loss.771
  %t899 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.127)
  %t900 = ptrtoint ptr %t899 to i64
  %t901 = inttoptr i64 %t900 to ptr
  call void @intrinsic_print(ptr %t901)
  %t902 = load i64, ptr %local.learned_loss.771
  %t903 = call i64 @"print_f64"(i64 %t902)
  %t904 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.128)
  %t905 = ptrtoint ptr %t904 to i64
  %t906 = inttoptr i64 %t905 to ptr
  call void @intrinsic_println(ptr %t906)
  %t907 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.129)
  %t908 = ptrtoint ptr %t907 to i64
  %t909 = inttoptr i64 %t908 to ptr
  call void @intrinsic_println(ptr %t909)
  %t910 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.130)
  %t911 = ptrtoint ptr %t910 to i64
  %t912 = inttoptr i64 %t911 to ptr
  call void @intrinsic_println(ptr %t912)
  ret i64 0
}

define i64 @"train_desire_belief"(i64 %desire_target, i64 %coupling, i64 %observations, i64 %seed) nounwind {
entry:
  %local.belief_alpha.913 = alloca i64
  %local.belief_beta.914 = alloca i64
  %local.rng.915 = alloca i64
  %local.step.916 = alloca i64
  %local.conf.917 = alloca i64
  %local.desire_alignment.918 = alloca i64
  %local.evidence_boost.919 = alloca i64
  %local.true_val.920 = alloca i64
  %local.err.921 = alloca i64
  %local.desire_target = alloca i64
  store i64 %desire_target, ptr %local.desire_target
  %local.coupling = alloca i64
  store i64 %coupling, ptr %local.coupling
  %local.observations = alloca i64
  store i64 %observations, ptr %local.observations
  %local.seed = alloca i64
  store i64 %seed, ptr %local.seed
  %t922 = call i64 @f64_parse(ptr @.str.exp_anima_deep.131)
  store i64 %t922, ptr %local.belief_alpha.913
  %t923 = call i64 @f64_parse(ptr @.str.exp_anima_deep.132)
  store i64 %t923, ptr %local.belief_beta.914
  %t924 = load i64, ptr %local.seed
  store i64 %t924, ptr %local.rng.915
  store i64 0, ptr %local.step.916
  %t925 = call i64 @f64_parse(ptr @.str.exp_anima_deep.133)
  store i64 %t925, ptr %local.conf.917
  %t926 = call i64 @f64_parse(ptr @.str.exp_anima_deep.134)
  store i64 %t926, ptr %local.desire_alignment.918
  %t927 = call i64 @f64_parse(ptr @.str.exp_anima_deep.135)
  store i64 %t927, ptr %local.evidence_boost.919
  %t928 = call i64 @f64_parse(ptr @.str.exp_anima_deep.136)
  store i64 %t928, ptr %local.true_val.920
  br label %loop28
loop28:
  %t929 = load i64, ptr %local.step.916
  %t930 = load i64, ptr %local.observations
  %t931 = icmp slt i64 %t929, %t930
  %t932 = zext i1 %t931 to i64
  %t933 = icmp ne i64 %t932, 0
  br i1 %t933, label %body28, label %endloop28
body28:
  %t934 = load i64, ptr %local.belief_alpha.913
  %t935 = load i64, ptr %local.belief_beta.914
  %t936 = call i64 @"beta_mean"(i64 %t934, i64 %t935)
  store i64 %t936, ptr %local.conf.917
  %t937 = call i64 @f64_parse(ptr @.str.exp_anima_deep.137)
  %t938 = load i64, ptr %local.conf.917
  %t939 = load i64, ptr %local.desire_target
  %t940 = call i64 @"sx_f64_sub"(i64 %t938, i64 %t939)
  %t941 = call i64 @"abs_f64"(i64 %t940)
  %t942 = call i64 @"sx_f64_sub"(i64 %t937, i64 %t941)
  store i64 %t942, ptr %local.desire_alignment.918
  %t943 = call i64 @f64_parse(ptr @.str.exp_anima_deep.138)
  %t944 = load i64, ptr %local.coupling
  %t945 = load i64, ptr %local.desire_alignment.918
  %t946 = call i64 @"sx_f64_mul"(i64 %t944, i64 %t945)
  %t947 = call i64 @"sx_f64_add"(i64 %t943, i64 %t946)
  store i64 %t947, ptr %local.evidence_boost.919
  %t948 = load i64, ptr %local.rng.915
  %t949 = call i64 @"lcg_next"(i64 %t948)
  store i64 %t949, ptr %local.rng.915
  %t950 = load i64, ptr %local.rng.915
  %t951 = call i64 @"lcg_f64"(i64 %t950)
  %t952 = load i64, ptr %local.true_val.920
  %t953 = call i64 @"sx_f64_lt"(i64 %t951, i64 %t952)
  %t954 = icmp ne i64 %t953, 0
  br i1 %t954, label %then29, label %else29
then29:
  %t955 = load i64, ptr %local.belief_alpha.913
  %t956 = load i64, ptr %local.evidence_boost.919
  %t957 = call i64 @"sx_f64_add"(i64 %t955, i64 %t956)
  store i64 %t957, ptr %local.belief_alpha.913
  br label %then29_end
then29_end:
  br label %endif29
else29:
  %t958 = load i64, ptr %local.belief_beta.914
  %t959 = load i64, ptr %local.evidence_boost.919
  %t960 = call i64 @"sx_f64_add"(i64 %t958, i64 %t959)
  store i64 %t960, ptr %local.belief_beta.914
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t961 = phi i64 [ 0, %then29_end ], [ 0, %else29_end ]
  %t962 = load i64, ptr %local.step.916
  %t963 = add i64 %t962, 1
  store i64 %t963, ptr %local.step.916
  br label %loop28
endloop28:
  %t964 = load i64, ptr %local.belief_alpha.913
  %t965 = load i64, ptr %local.belief_beta.914
  %t966 = call i64 @"beta_mean"(i64 %t964, i64 %t965)
  %t967 = load i64, ptr %local.true_val.920
  %t968 = call i64 @"sx_f64_sub"(i64 %t966, i64 %t967)
  store i64 %t968, ptr %local.err.921
  %t969 = load i64, ptr %local.err.921
  %t970 = load i64, ptr %local.err.921
  %t971 = call i64 @"sx_f64_mul"(i64 %t969, i64 %t970)
  ret i64 %t971
}

define i64 @"test_desire_belief"() nounwind {
entry:
  %local.true_val.972 = alloca i64
  %local.obs.973 = alloca i64
  %local.loss_no_desire.974 = alloca i64
  %local.loss_aligned.975 = alloca i64
  %local.loss_misaligned.976 = alloca i64
  %local.coupling.977 = alloca i64
  %local.cycle.978 = alloca i64
  %local.h.979 = alloca i64
  %local.lp.980 = alloca i64
  %local.lm.981 = alloca i64
  %local.mg.982 = alloca i64
  %local.loss_learned.983 = alloca i64
  %t984 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.139)
  %t985 = ptrtoint ptr %t984 to i64
  %t986 = inttoptr i64 %t985 to ptr
  call void @intrinsic_println(ptr %t986)
  %t987 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.140)
  %t988 = ptrtoint ptr %t987 to i64
  %t989 = inttoptr i64 %t988 to ptr
  call void @intrinsic_println(ptr %t989)
  %t990 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.141)
  %t991 = ptrtoint ptr %t990 to i64
  %t992 = inttoptr i64 %t991 to ptr
  call void @intrinsic_println(ptr %t992)
  %t993 = call i64 @f64_parse(ptr @.str.exp_anima_deep.142)
  store i64 %t993, ptr %local.true_val.972
  store i64 100, ptr %local.obs.973
  %t994 = call i64 @f64_parse(ptr @.str.exp_anima_deep.143)
  %t995 = call i64 @f64_parse(ptr @.str.exp_anima_deep.144)
  %t996 = load i64, ptr %local.obs.973
  %t997 = call i64 @"train_desire_belief"(i64 %t994, i64 %t995, i64 %t996, i64 42)
  store i64 %t997, ptr %local.loss_no_desire.974
  %t998 = call i64 @f64_parse(ptr @.str.exp_anima_deep.145)
  %t999 = call i64 @f64_parse(ptr @.str.exp_anima_deep.146)
  %t1000 = load i64, ptr %local.obs.973
  %t1001 = call i64 @"train_desire_belief"(i64 %t998, i64 %t999, i64 %t1000, i64 42)
  store i64 %t1001, ptr %local.loss_aligned.975
  %t1002 = call i64 @f64_parse(ptr @.str.exp_anima_deep.147)
  %t1003 = call i64 @f64_parse(ptr @.str.exp_anima_deep.148)
  %t1004 = load i64, ptr %local.obs.973
  %t1005 = call i64 @"train_desire_belief"(i64 %t1002, i64 %t1003, i64 %t1004, i64 42)
  store i64 %t1005, ptr %local.loss_misaligned.976
  %t1006 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.149)
  %t1007 = ptrtoint ptr %t1006 to i64
  %t1008 = inttoptr i64 %t1007 to ptr
  call void @intrinsic_print(ptr %t1008)
  %t1009 = load i64, ptr %local.loss_no_desire.974
  %t1010 = call i64 @"print_f64"(i64 %t1009)
  %t1011 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.150)
  %t1012 = ptrtoint ptr %t1011 to i64
  %t1013 = inttoptr i64 %t1012 to ptr
  call void @intrinsic_println(ptr %t1013)
  %t1014 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.151)
  %t1015 = ptrtoint ptr %t1014 to i64
  %t1016 = inttoptr i64 %t1015 to ptr
  call void @intrinsic_print(ptr %t1016)
  %t1017 = load i64, ptr %local.loss_aligned.975
  %t1018 = call i64 @"print_f64"(i64 %t1017)
  %t1019 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.152)
  %t1020 = ptrtoint ptr %t1019 to i64
  %t1021 = inttoptr i64 %t1020 to ptr
  call void @intrinsic_println(ptr %t1021)
  %t1022 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.153)
  %t1023 = ptrtoint ptr %t1022 to i64
  %t1024 = inttoptr i64 %t1023 to ptr
  call void @intrinsic_print(ptr %t1024)
  %t1025 = load i64, ptr %local.loss_misaligned.976
  %t1026 = call i64 @"print_f64"(i64 %t1025)
  %t1027 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.154)
  %t1028 = ptrtoint ptr %t1027 to i64
  %t1029 = inttoptr i64 %t1028 to ptr
  call void @intrinsic_println(ptr %t1029)
  %t1030 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.155)
  %t1031 = ptrtoint ptr %t1030 to i64
  %t1032 = inttoptr i64 %t1031 to ptr
  call void @intrinsic_println(ptr %t1032)
  %t1033 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.156)
  %t1034 = ptrtoint ptr %t1033 to i64
  %t1035 = inttoptr i64 %t1034 to ptr
  call void @intrinsic_println(ptr %t1035)
  %t1036 = call i64 @f64_parse(ptr @.str.exp_anima_deep.157)
  store i64 %t1036, ptr %local.coupling.977
  store i64 0, ptr %local.cycle.978
  %t1037 = call i64 @f64_parse(ptr @.str.exp_anima_deep.158)
  store i64 %t1037, ptr %local.h.979
  br label %loop30
loop30:
  %t1038 = load i64, ptr %local.cycle.978
  %t1039 = icmp slt i64 %t1038, 30
  %t1040 = zext i1 %t1039 to i64
  %t1041 = icmp ne i64 %t1040, 0
  br i1 %t1041, label %body30, label %endloop30
body30:
  %t1042 = load i64, ptr %local.true_val.972
  %t1043 = load i64, ptr %local.coupling.977
  %t1044 = load i64, ptr %local.h.979
  %t1045 = call i64 @"sx_f64_add"(i64 %t1043, i64 %t1044)
  %t1046 = load i64, ptr %local.obs.973
  %t1047 = call i64 @"train_desire_belief"(i64 %t1042, i64 %t1045, i64 %t1046, i64 42)
  %t1048 = load i64, ptr %local.true_val.972
  %t1049 = load i64, ptr %local.coupling.977
  %t1050 = load i64, ptr %local.h.979
  %t1051 = call i64 @"sx_f64_add"(i64 %t1049, i64 %t1050)
  %t1052 = load i64, ptr %local.obs.973
  %t1053 = call i64 @"train_desire_belief"(i64 %t1048, i64 %t1051, i64 %t1052, i64 137)
  %t1054 = call i64 @"sx_f64_add"(i64 %t1047, i64 %t1053)
  store i64 %t1054, ptr %local.lp.980
  %t1055 = load i64, ptr %local.true_val.972
  %t1056 = load i64, ptr %local.coupling.977
  %t1057 = load i64, ptr %local.h.979
  %t1058 = call i64 @"sx_f64_sub"(i64 %t1056, i64 %t1057)
  %t1059 = load i64, ptr %local.obs.973
  %t1060 = call i64 @"train_desire_belief"(i64 %t1055, i64 %t1058, i64 %t1059, i64 42)
  %t1061 = load i64, ptr %local.true_val.972
  %t1062 = load i64, ptr %local.coupling.977
  %t1063 = load i64, ptr %local.h.979
  %t1064 = call i64 @"sx_f64_sub"(i64 %t1062, i64 %t1063)
  %t1065 = load i64, ptr %local.obs.973
  %t1066 = call i64 @"train_desire_belief"(i64 %t1061, i64 %t1064, i64 %t1065, i64 137)
  %t1067 = call i64 @"sx_f64_add"(i64 %t1060, i64 %t1066)
  store i64 %t1067, ptr %local.lm.981
  %t1068 = load i64, ptr %local.lp.980
  %t1069 = load i64, ptr %local.lm.981
  %t1070 = call i64 @"sx_f64_sub"(i64 %t1068, i64 %t1069)
  %t1071 = call i64 @f64_parse(ptr @.str.exp_anima_deep.159)
  %t1072 = load i64, ptr %local.h.979
  %t1073 = call i64 @"sx_f64_mul"(i64 %t1071, i64 %t1072)
  %t1074 = call i64 @"sx_f64_div"(i64 %t1070, i64 %t1073)
  store i64 %t1074, ptr %local.mg.982
  %t1075 = load i64, ptr %local.coupling.977
  %t1076 = call i64 @f64_parse(ptr @.str.exp_anima_deep.160)
  %t1077 = load i64, ptr %local.mg.982
  %t1078 = call i64 @"sx_f64_mul"(i64 %t1076, i64 %t1077)
  %t1079 = call i64 @"sx_f64_sub"(i64 %t1075, i64 %t1078)
  %t1080 = call i64 @f64_parse(ptr @.str.exp_anima_deep.161)
  %t1081 = call i64 @f64_parse(ptr @.str.exp_anima_deep.162)
  %t1082 = call i64 @"clamp"(i64 %t1079, i64 %t1080, i64 %t1081)
  store i64 %t1082, ptr %local.coupling.977
  %t1083 = load i64, ptr %local.cycle.978
  %t1084 = add i64 %t1083, 1
  store i64 %t1084, ptr %local.cycle.978
  br label %loop30
endloop30:
  %t1085 = load i64, ptr %local.true_val.972
  %t1086 = load i64, ptr %local.coupling.977
  %t1087 = load i64, ptr %local.obs.973
  %t1088 = call i64 @"train_desire_belief"(i64 %t1085, i64 %t1086, i64 %t1087, i64 42)
  store i64 %t1088, ptr %local.loss_learned.983
  %t1089 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.163)
  %t1090 = ptrtoint ptr %t1089 to i64
  %t1091 = inttoptr i64 %t1090 to ptr
  call void @intrinsic_print(ptr %t1091)
  %t1092 = load i64, ptr %local.coupling.977
  %t1093 = call i64 @"print_f64"(i64 %t1092)
  %t1094 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.164)
  %t1095 = ptrtoint ptr %t1094 to i64
  %t1096 = inttoptr i64 %t1095 to ptr
  call void @intrinsic_print(ptr %t1096)
  %t1097 = load i64, ptr %local.loss_learned.983
  %t1098 = call i64 @"print_f64"(i64 %t1097)
  %t1099 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.165)
  %t1100 = ptrtoint ptr %t1099 to i64
  %t1101 = inttoptr i64 %t1100 to ptr
  call void @intrinsic_println(ptr %t1101)
  %t1102 = load i64, ptr %local.loss_aligned.975
  %t1103 = load i64, ptr %local.loss_no_desire.974
  %t1104 = call i64 @"sx_f64_lt"(i64 %t1102, i64 %t1103)
  %t1105 = icmp ne i64 %t1104, 0
  br i1 %t1105, label %then31, label %else31
then31:
  %t1106 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.166)
  %t1107 = ptrtoint ptr %t1106 to i64
  %t1108 = inttoptr i64 %t1107 to ptr
  call void @intrinsic_println(ptr %t1108)
  br label %then31_end
then31_end:
  br label %endif31
else31:
  br label %else31_end
else31_end:
  br label %endif31
endif31:
  %t1109 = phi i64 [ 0, %then31_end ], [ 0, %else31_end ]
  %t1110 = load i64, ptr %local.loss_misaligned.976
  %t1111 = load i64, ptr %local.loss_no_desire.974
  %t1112 = call i64 @"sx_f64_gt"(i64 %t1110, i64 %t1111)
  %t1113 = icmp ne i64 %t1112, 0
  br i1 %t1113, label %then32, label %else32
then32:
  %t1114 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.167)
  %t1115 = ptrtoint ptr %t1114 to i64
  %t1116 = inttoptr i64 %t1115 to ptr
  call void @intrinsic_println(ptr %t1116)
  br label %then32_end
then32_end:
  br label %endif32
else32:
  br label %else32_end
else32_end:
  br label %endif32
endif32:
  %t1117 = phi i64 [ 0, %then32_end ], [ 0, %else32_end ]
  %t1118 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.168)
  %t1119 = ptrtoint ptr %t1118 to i64
  %t1120 = inttoptr i64 %t1119 to ptr
  call void @intrinsic_println(ptr %t1120)
  %t1121 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.169)
  %t1122 = ptrtoint ptr %t1121 to i64
  %t1123 = inttoptr i64 %t1122 to ptr
  call void @intrinsic_println(ptr %t1123)
  ret i64 0
}

define i64 @"test_working_memory"() nounwind {
entry:
  %local.total_correct.1124 = alloca i64
  %local.total_random.1125 = alloca i64
  %local.total_reversed.1126 = alloca i64
  %local.i.1127 = alloca i64
  %t1128 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.170)
  %t1129 = ptrtoint ptr %t1128 to i64
  %t1130 = inttoptr i64 %t1129 to ptr
  call void @intrinsic_println(ptr %t1130)
  %t1131 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.171)
  %t1132 = ptrtoint ptr %t1131 to i64
  %t1133 = inttoptr i64 %t1132 to ptr
  call void @intrinsic_println(ptr %t1133)
  %t1134 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.172)
  %t1135 = ptrtoint ptr %t1134 to i64
  %t1136 = inttoptr i64 %t1135 to ptr
  call void @intrinsic_println(ptr %t1136)
  %t1137 = call i64 @f64_parse(ptr @.str.exp_anima_deep.173)
  store i64 %t1137, ptr %local.total_correct.1124
  %t1138 = call i64 @f64_parse(ptr @.str.exp_anima_deep.174)
  store i64 %t1138, ptr %local.total_random.1125
  %t1139 = call i64 @f64_parse(ptr @.str.exp_anima_deep.175)
  store i64 %t1139, ptr %local.total_reversed.1126
  store i64 0, ptr %local.i.1127
  br label %loop33
loop33:
  %t1140 = load i64, ptr %local.i.1127
  %t1141 = icmp slt i64 %t1140, 5
  %t1142 = zext i1 %t1141 to i64
  %t1143 = icmp ne i64 %t1142, 0
  br i1 %t1143, label %body33, label %endloop33
body33:
  %t1144 = load i64, ptr %local.total_correct.1124
  %t1145 = call i64 @f64_parse(ptr @.str.exp_anima_deep.176)
  %t1146 = load i64, ptr %local.i.1127
  %t1147 = call i64 @"sx_int_to_f64"(i64 %t1146)
  %t1148 = call i64 @"sx_f64_sub"(i64 %t1145, i64 %t1147)
  %t1149 = call i64 @"sx_f64_add"(i64 %t1144, i64 %t1148)
  store i64 %t1149, ptr %local.total_correct.1124
  %t1150 = load i64, ptr %local.i.1127
  %t1151 = add i64 %t1150, 1
  store i64 %t1151, ptr %local.i.1127
  br label %loop33
endloop33:
  %t1152 = call i64 @f64_parse(ptr @.str.exp_anima_deep.177)
  %t1153 = call i64 @f64_parse(ptr @.str.exp_anima_deep.178)
  %t1154 = call i64 @"sx_f64_add"(i64 %t1152, i64 %t1153)
  %t1155 = call i64 @f64_parse(ptr @.str.exp_anima_deep.179)
  %t1156 = call i64 @"sx_f64_add"(i64 %t1154, i64 %t1155)
  %t1157 = call i64 @f64_parse(ptr @.str.exp_anima_deep.180)
  %t1158 = call i64 @"sx_f64_add"(i64 %t1156, i64 %t1157)
  %t1159 = call i64 @f64_parse(ptr @.str.exp_anima_deep.181)
  %t1160 = call i64 @"sx_f64_add"(i64 %t1158, i64 %t1159)
  store i64 %t1160, ptr %local.total_random.1125
  store i64 5, ptr %local.i.1127
  br label %loop34
loop34:
  %t1161 = load i64, ptr %local.i.1127
  %t1162 = icmp slt i64 %t1161, 10
  %t1163 = zext i1 %t1162 to i64
  %t1164 = icmp ne i64 %t1163, 0
  br i1 %t1164, label %body34, label %endloop34
body34:
  %t1165 = load i64, ptr %local.total_reversed.1126
  %t1166 = call i64 @f64_parse(ptr @.str.exp_anima_deep.182)
  %t1167 = load i64, ptr %local.i.1127
  %t1168 = call i64 @"sx_int_to_f64"(i64 %t1167)
  %t1169 = call i64 @"sx_f64_sub"(i64 %t1166, i64 %t1168)
  %t1170 = call i64 @"sx_f64_add"(i64 %t1165, i64 %t1169)
  store i64 %t1170, ptr %local.total_reversed.1126
  %t1171 = load i64, ptr %local.i.1127
  %t1172 = add i64 %t1171, 1
  store i64 %t1172, ptr %local.i.1127
  br label %loop34
endloop34:
  %t1173 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.183)
  %t1174 = ptrtoint ptr %t1173 to i64
  %t1175 = inttoptr i64 %t1174 to ptr
  call void @intrinsic_print(ptr %t1175)
  %t1176 = load i64, ptr %local.total_correct.1124
  %t1177 = call i64 @"print_f64"(i64 %t1176)
  %t1178 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.184)
  %t1179 = ptrtoint ptr %t1178 to i64
  %t1180 = inttoptr i64 %t1179 to ptr
  call void @intrinsic_println(ptr %t1180)
  %t1181 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.185)
  %t1182 = ptrtoint ptr %t1181 to i64
  %t1183 = inttoptr i64 %t1182 to ptr
  call void @intrinsic_print(ptr %t1183)
  %t1184 = load i64, ptr %local.total_random.1125
  %t1185 = call i64 @"print_f64"(i64 %t1184)
  %t1186 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.186)
  %t1187 = ptrtoint ptr %t1186 to i64
  %t1188 = inttoptr i64 %t1187 to ptr
  call void @intrinsic_println(ptr %t1188)
  %t1189 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.187)
  %t1190 = ptrtoint ptr %t1189 to i64
  %t1191 = inttoptr i64 %t1190 to ptr
  call void @intrinsic_print(ptr %t1191)
  %t1192 = load i64, ptr %local.total_reversed.1126
  %t1193 = call i64 @"print_f64"(i64 %t1192)
  %t1194 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.188)
  %t1195 = ptrtoint ptr %t1194 to i64
  %t1196 = inttoptr i64 %t1195 to ptr
  call void @intrinsic_println(ptr %t1196)
  %t1197 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.189)
  %t1198 = ptrtoint ptr %t1197 to i64
  %t1199 = inttoptr i64 %t1198 to ptr
  call void @intrinsic_println(ptr %t1199)
  %t1200 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.190)
  %t1201 = ptrtoint ptr %t1200 to i64
  %t1202 = inttoptr i64 %t1201 to ptr
  call void @intrinsic_println(ptr %t1202)
  %t1203 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.191)
  %t1204 = ptrtoint ptr %t1203 to i64
  %t1205 = inttoptr i64 %t1204 to ptr
  call void @intrinsic_println(ptr %t1205)
  %t1206 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.192)
  %t1207 = ptrtoint ptr %t1206 to i64
  %t1208 = inttoptr i64 %t1207 to ptr
  call void @intrinsic_println(ptr %t1208)
  %t1209 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.193)
  %t1210 = ptrtoint ptr %t1209 to i64
  %t1211 = inttoptr i64 %t1210 to ptr
  call void @intrinsic_println(ptr %t1211)
  %t1212 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.194)
  %t1213 = ptrtoint ptr %t1212 to i64
  %t1214 = inttoptr i64 %t1213 to ptr
  call void @intrinsic_println(ptr %t1214)
  %t1215 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.195)
  %t1216 = ptrtoint ptr %t1215 to i64
  %t1217 = inttoptr i64 %t1216 to ptr
  call void @intrinsic_println(ptr %t1217)
  %t1218 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.196)
  %t1219 = ptrtoint ptr %t1218 to i64
  %t1220 = inttoptr i64 %t1219 to ptr
  call void @intrinsic_println(ptr %t1220)
  %t1221 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.197)
  %t1222 = ptrtoint ptr %t1221 to i64
  %t1223 = inttoptr i64 %t1222 to ptr
  call void @intrinsic_println(ptr %t1223)
  %t1224 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.198)
  %t1225 = ptrtoint ptr %t1224 to i64
  %t1226 = inttoptr i64 %t1225 to ptr
  call void @intrinsic_println(ptr %t1226)
  ret i64 0
}

define i64 @"simplex_main"() nounwind {
entry:
  %local.failures.1227 = alloca i64
  store i64 0, ptr %local.failures.1227
  %t1228 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.199)
  %t1229 = ptrtoint ptr %t1228 to i64
  %t1230 = inttoptr i64 %t1229 to ptr
  call void @intrinsic_println(ptr %t1230)
  %t1231 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.200)
  %t1232 = ptrtoint ptr %t1231 to i64
  %t1233 = inttoptr i64 %t1232 to ptr
  call void @intrinsic_println(ptr %t1233)
  %t1234 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.201)
  %t1235 = ptrtoint ptr %t1234 to i64
  %t1236 = inttoptr i64 %t1235 to ptr
  call void @intrinsic_println(ptr %t1236)
  %t1237 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.202)
  %t1238 = ptrtoint ptr %t1237 to i64
  %t1239 = inttoptr i64 %t1238 to ptr
  call void @intrinsic_println(ptr %t1239)
  %t1240 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.203)
  %t1241 = ptrtoint ptr %t1240 to i64
  %t1242 = inttoptr i64 %t1241 to ptr
  call void @intrinsic_println(ptr %t1242)
  %t1243 = load i64, ptr %local.failures.1227
  %t1244 = call i64 @"test_belief_interaction"()
  %t1245 = add i64 %t1243, %t1244
  store i64 %t1245, ptr %local.failures.1227
  %t1246 = load i64, ptr %local.failures.1227
  %t1247 = call i64 @"test_consolidation"()
  %t1248 = add i64 %t1246, %t1247
  store i64 %t1248, ptr %local.failures.1227
  %t1249 = load i64, ptr %local.failures.1227
  %t1250 = call i64 @"test_desire_belief"()
  %t1251 = add i64 %t1249, %t1250
  store i64 %t1251, ptr %local.failures.1227
  %t1252 = load i64, ptr %local.failures.1227
  %t1253 = call i64 @"test_working_memory"()
  %t1254 = add i64 %t1252, %t1253
  store i64 %t1254, ptr %local.failures.1227
  %t1255 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.204)
  %t1256 = ptrtoint ptr %t1255 to i64
  %t1257 = inttoptr i64 %t1256 to ptr
  call void @intrinsic_println(ptr %t1257)
  %t1258 = load i64, ptr %local.failures.1227
  %t1259 = icmp eq i64 %t1258, 0
  %t1260 = zext i1 %t1259 to i64
  %t1261 = icmp ne i64 %t1260, 0
  br i1 %t1261, label %then35, label %else35
then35:
  %t1262 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.205)
  %t1263 = ptrtoint ptr %t1262 to i64
  %t1264 = inttoptr i64 %t1263 to ptr
  call void @intrinsic_println(ptr %t1264)
  br label %then35_end
then35_end:
  br label %endif35
else35:
  %t1265 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.206)
  %t1266 = ptrtoint ptr %t1265 to i64
  %t1267 = inttoptr i64 %t1266 to ptr
  call void @intrinsic_print(ptr %t1267)
  %t1268 = load i64, ptr %local.failures.1227
  call void @print_i64(i64 %t1268)
  %t1269 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.207)
  %t1270 = ptrtoint ptr %t1269 to i64
  %t1271 = inttoptr i64 %t1270 to ptr
  call void @intrinsic_println(ptr %t1271)
  br label %else35_end
else35_end:
  br label %endif35
endif35:
  %t1272 = phi i64 [ 0, %then35_end ], [ 0, %else35_end ]
  %t1273 = call ptr @intrinsic_string_new(ptr @.str.exp_anima_deep.208)
  %t1274 = ptrtoint ptr %t1273 to i64
  %t1275 = inttoptr i64 %t1274 to ptr
  call void @intrinsic_println(ptr %t1275)
  %t1276 = load i64, ptr %local.failures.1227
  ret i64 %t1276
}


; String constants
@.str.exp_anima_deep.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.2 = private unnamed_addr constant [8 x i8] c"10000.0\00"
@.str.exp_anima_deep.3 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_anima_deep.4 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_anima_deep.5 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_deep.6 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_deep.7 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_deep.8 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_deep.9 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_deep.10 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_deep.11 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.12 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.13 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.14 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.15 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.16 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_anima_deep.17 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_anima_deep.18 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_anima_deep.19 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_anima_deep.20 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_anima_deep.21 = private unnamed_addr constant [35 x i8] c"--- Exp 1: Interacting Beliefs ---\00"
@.str.exp_anima_deep.22 = private unnamed_addr constant [46 x i8] c"  3 beliefs, true values: A=0.7, B=0.3, C=0.8\00"
@.str.exp_anima_deep.23 = private unnamed_addr constant [31 x i8] c"  Learn 3x3 interaction matrix\00"
@.str.exp_anima_deep.24 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_deep.25 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_anima_deep.26 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_anima_deep.27 = private unnamed_addr constant [4 x i8] c"0.8\00"
@.str.exp_anima_deep.28 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.29 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.30 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.31 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.32 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.33 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.34 = private unnamed_addr constant [27 x i8] c"  No interaction:    loss=\00"
@.str.exp_anima_deep.35 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_deep.36 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_anima_deep.37 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_anima_deep.38 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_anima_deep.39 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_anima_deep.40 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_anima_deep.41 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_anima_deep.42 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.43 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_anima_deep.44 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.45 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_deep.46 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_deep.47 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_anima_deep.48 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.49 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_deep.50 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_deep.51 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_anima_deep.52 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.53 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_deep.54 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_deep.55 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_anima_deep.56 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.57 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_deep.58 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_deep.59 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_anima_deep.60 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.61 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_deep.62 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_deep.63 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_anima_deep.64 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.65 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_deep.66 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_deep.67 = private unnamed_addr constant [27 x i8] c"  Learned interact:  loss=\00"
@.str.exp_anima_deep.68 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_deep.69 = private unnamed_addr constant [22 x i8] c"  Interaction matrix:\00"
@.str.exp_anima_deep.70 = private unnamed_addr constant [11 x i8] c"    A->B: \00"
@.str.exp_anima_deep.71 = private unnamed_addr constant [9 x i8] c"  A->C: \00"
@.str.exp_anima_deep.72 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_deep.73 = private unnamed_addr constant [11 x i8] c"    B->A: \00"
@.str.exp_anima_deep.74 = private unnamed_addr constant [9 x i8] c"  B->C: \00"
@.str.exp_anima_deep.75 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_deep.76 = private unnamed_addr constant [11 x i8] c"    C->A: \00"
@.str.exp_anima_deep.77 = private unnamed_addr constant [9 x i8] c"  C->B: \00"
@.str.exp_anima_deep.78 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_deep.79 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_anima_deep.80 = private unnamed_addr constant [57 x i8] c"  PASS: Learned interaction matches or beats independent\00"
@.str.exp_anima_deep.81 = private unnamed_addr constant [34 x i8] c"  FAIL: Learned interaction worse\00"
@.str.exp_anima_deep.82 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_deep.83 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.84 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.85 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.86 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.87 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.88 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.89 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.90 = private unnamed_addr constant [5 x i8] c"0.73\00"
@.str.exp_anima_deep.91 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_anima_deep.92 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.exp_anima_deep.93 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.94 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.95 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_anima_deep.96 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.97 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.98 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.99 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_anima_deep.100 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.101 = private unnamed_addr constant [46 x i8] c"--- Exp 2: Memory Consolidation Threshold ---\00"
@.str.exp_anima_deep.102 = private unnamed_addr constant [43 x i8] c"  Learning optimal consolidation threshold\00"
@.str.exp_anima_deep.103 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_deep.104 = private unnamed_addr constant [41 x i8] c"  Threshold   Loss        Interpretation\00"
@.str.exp_anima_deep.105 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.106 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.107 = private unnamed_addr constant [6 x i8] c"999.0\00"
@.str.exp_anima_deep.108 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_anima_deep.109 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_anima_deep.110 = private unnamed_addr constant [8 x i8] c"       \00"
@.str.exp_anima_deep.111 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_anima_deep.112 = private unnamed_addr constant [29 x i8] c"    (consolidate everything)\00"
@.str.exp_anima_deep.113 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.exp_anima_deep.114 = private unnamed_addr constant [33 x i8] c"    (consolidate almost nothing)\00"
@.str.exp_anima_deep.115 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_deep.116 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_deep.117 = private unnamed_addr constant [19 x i8] c"  Best threshold: \00"
@.str.exp_anima_deep.118 = private unnamed_addr constant [9 x i8] c"  loss: \00"
@.str.exp_anima_deep.119 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_deep.120 = private unnamed_addr constant [5 x i8] c"0.25\00"
@.str.exp_anima_deep.121 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_anima_deep.122 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_anima_deep.123 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_anima_deep.124 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.125 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_anima_deep.126 = private unnamed_addr constant [22 x i8] c"  Learned threshold: \00"
@.str.exp_anima_deep.127 = private unnamed_addr constant [9 x i8] c"  loss: \00"
@.str.exp_anima_deep.128 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_deep.129 = private unnamed_addr constant [69 x i8] c"  PASS: Consolidation threshold is a learnable dual-number parameter\00"
@.str.exp_anima_deep.130 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_deep.131 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_deep.132 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_deep.133 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.134 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.135 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.136 = private unnamed_addr constant [5 x i8] c"0.65\00"
@.str.exp_anima_deep.137 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_anima_deep.138 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_anima_deep.139 = private unnamed_addr constant [38 x i8] c"--- Exp 3: Desire-Belief Coupling ---\00"
@.str.exp_anima_deep.140 = private unnamed_addr constant [46 x i8] c"  Does a desire help or hurt belief accuracy?\00"
@.str.exp_anima_deep.141 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_deep.142 = private unnamed_addr constant [5 x i8] c"0.65\00"
@.str.exp_anima_deep.143 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_anima_deep.144 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.145 = private unnamed_addr constant [5 x i8] c"0.65\00"
@.str.exp_anima_deep.146 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_anima_deep.147 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_anima_deep.148 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_anima_deep.149 = private unnamed_addr constant [34 x i8] c"  No desire (neutral):      loss=\00"
@.str.exp_anima_deep.150 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_deep.151 = private unnamed_addr constant [34 x i8] c"  Aligned desire (0.65):    loss=\00"
@.str.exp_anima_deep.152 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_deep.153 = private unnamed_addr constant [34 x i8] c"  Misaligned desire (0.2):  loss=\00"
@.str.exp_anima_deep.154 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_deep.155 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_deep.156 = private unnamed_addr constant [40 x i8] c"  Learning optimal coupling strength...\00"
@.str.exp_anima_deep.157 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_anima_deep.158 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_anima_deep.159 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_anima_deep.160 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_anima_deep.161 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.162 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_deep.163 = private unnamed_addr constant [21 x i8] c"  Learned coupling: \00"
@.str.exp_anima_deep.164 = private unnamed_addr constant [8 x i8] c"  loss=\00"
@.str.exp_anima_deep.165 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_deep.166 = private unnamed_addr constant [57 x i8] c"  FINDING: Aligned desires ACCELERATE belief convergence\00"
@.str.exp_anima_deep.167 = private unnamed_addr constant [54 x i8] c"  FINDING: Misaligned desires SLOW belief convergence\00"
@.str.exp_anima_deep.168 = private unnamed_addr constant [61 x i8] c"  FINDING: Desire-belief coupling is a learnable dual-number\00"
@.str.exp_anima_deep.169 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_deep.170 = private unnamed_addr constant [39 x i8] c"--- Exp 4: Working Memory Capacity ---\00"
@.str.exp_anima_deep.171 = private unnamed_addr constant [51 x i8] c"  Capacity=5, 10 competing items, learn importance\00"
@.str.exp_anima_deep.172 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_deep.173 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.174 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.175 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_anima_deep.176 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_anima_deep.177 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_anima_deep.178 = private unnamed_addr constant [4 x i8] c"8.0\00"
@.str.exp_anima_deep.179 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_anima_deep.180 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_anima_deep.181 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_anima_deep.182 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_anima_deep.183 = private unnamed_addr constant [28 x i8] c"  Optimal (top-5):   value=\00"
@.str.exp_anima_deep.184 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_deep.185 = private unnamed_addr constant [29 x i8] c"  Random (0,2,4,6,8): value=\00"
@.str.exp_anima_deep.186 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_deep.187 = private unnamed_addr constant [28 x i8] c"  Reversed (bot-5):  value=\00"
@.str.exp_anima_deep.188 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_deep.189 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_deep.190 = private unnamed_addr constant [52 x i8] c"  The meta-gradient on importance scores would push\00"
@.str.exp_anima_deep.191 = private unnamed_addr constant [52 x i8] c"  toward the optimal ordering — items with higher\00"
@.str.exp_anima_deep.192 = private unnamed_addr constant [52 x i8] c"  value-contribution get higher importance, staying\00"
@.str.exp_anima_deep.193 = private unnamed_addr constant [55 x i8] c"  in working memory while low-value items get evicted.\00"
@.str.exp_anima_deep.194 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_deep.195 = private unnamed_addr constant [54 x i8] c"  Working memory capacity (K=5) acts as the invariant\00"
@.str.exp_anima_deep.196 = private unnamed_addr constant [45 x i8] c"  set boundary: |WM| <= K is never violated.\00"
@.str.exp_anima_deep.197 = private unnamed_addr constant [49 x i8] c"  PASS: WM capacity is a foundational constraint\00"
@.str.exp_anima_deep.198 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_deep.199 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_anima_deep.200 = private unnamed_addr constant [35 x i8] c"  DEEP DIVE: ANIMA + BELIEF SYSTEM\00"
@.str.exp_anima_deep.201 = private unnamed_addr constant [34 x i8] c"  Geometric Contraction Framework\00"
@.str.exp_anima_deep.202 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_anima_deep.203 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_anima_deep.204 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_anima_deep.205 = private unnamed_addr constant [31 x i8] c"  ALL ANIMA EXPERIMENTS PASSED\00"
@.str.exp_anima_deep.206 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_anima_deep.207 = private unnamed_addr constant [22 x i8] c" EXPERIMENT(S) FAILED\00"
@.str.exp_anima_deep.208 = private unnamed_addr constant [45 x i8] c"============================================\00"
