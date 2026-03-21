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
  %t1 = call i64 @f64_parse(ptr @.str.exp_balance_residual.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_balance_residual.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"balance_1d"(i64 %theta) nounwind {
entry:
  %local.g1.9 = alloca i64
  %local.g2.10 = alloca i64
  %local.sum_g.11 = alloca i64
  %local.sum_sq.12 = alloca i64
  %local.theta = alloca i64
  store i64 %theta, ptr %local.theta
  %t13 = call i64 @f64_parse(ptr @.str.exp_balance_residual.2)
  %t14 = load i64, ptr %local.theta
  %t15 = call i64 @f64_parse(ptr @.str.exp_balance_residual.3)
  %t16 = call i64 @"sx_f64_sub"(i64 %t14, i64 %t15)
  %t17 = call i64 @"sx_f64_mul"(i64 %t13, i64 %t16)
  store i64 %t17, ptr %local.g1.9
  %t18 = call i64 @f64_parse(ptr @.str.exp_balance_residual.4)
  %t19 = load i64, ptr %local.theta
  %t20 = call i64 @f64_parse(ptr @.str.exp_balance_residual.5)
  %t21 = call i64 @"sx_f64_add"(i64 %t19, i64 %t20)
  %t22 = call i64 @"sx_f64_mul"(i64 %t18, i64 %t21)
  store i64 %t22, ptr %local.g2.10
  %t23 = load i64, ptr %local.g1.9
  %t24 = load i64, ptr %local.g2.10
  %t25 = call i64 @"sx_f64_add"(i64 %t23, i64 %t24)
  store i64 %t25, ptr %local.sum_g.11
  %t26 = load i64, ptr %local.g1.9
  %t27 = load i64, ptr %local.g1.9
  %t28 = call i64 @"sx_f64_mul"(i64 %t26, i64 %t27)
  %t29 = load i64, ptr %local.g2.10
  %t30 = load i64, ptr %local.g2.10
  %t31 = call i64 @"sx_f64_mul"(i64 %t29, i64 %t30)
  %t32 = call i64 @"sx_f64_add"(i64 %t28, i64 %t31)
  store i64 %t32, ptr %local.sum_sq.12
  %t33 = load i64, ptr %local.sum_sq.12
  %t34 = call i64 @f64_parse(ptr @.str.exp_balance_residual.6)
  %t35 = call i64 @"sx_f64_lt"(i64 %t33, i64 %t34)
  %t36 = icmp ne i64 %t35, 0
  br i1 %t36, label %then1, label %else1
then1:
  %t37 = call i64 @f64_parse(ptr @.str.exp_balance_residual.7)
  ret i64 %t37
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t38 = phi i64 [ 0, %else1_end ]
  %t39 = load i64, ptr %local.sum_g.11
  %t40 = load i64, ptr %local.sum_g.11
  %t41 = call i64 @"sx_f64_mul"(i64 %t39, i64 %t40)
  %t42 = load i64, ptr %local.sum_sq.12
  %t43 = call i64 @"sx_f64_div"(i64 %t41, i64 %t42)
  ret i64 %t43
}

define i64 @"iratio_1d"(i64 %theta) nounwind {
entry:
  %local.g1.44 = alloca i64
  %local.g2.45 = alloca i64
  %local.dot12.46 = alloca i64
  %local.sum_sq.47 = alloca i64
  %local.theta = alloca i64
  store i64 %theta, ptr %local.theta
  %t48 = call i64 @f64_parse(ptr @.str.exp_balance_residual.8)
  %t49 = load i64, ptr %local.theta
  %t50 = call i64 @f64_parse(ptr @.str.exp_balance_residual.9)
  %t51 = call i64 @"sx_f64_sub"(i64 %t49, i64 %t50)
  %t52 = call i64 @"sx_f64_mul"(i64 %t48, i64 %t51)
  store i64 %t52, ptr %local.g1.44
  %t53 = call i64 @f64_parse(ptr @.str.exp_balance_residual.10)
  %t54 = load i64, ptr %local.theta
  %t55 = call i64 @f64_parse(ptr @.str.exp_balance_residual.11)
  %t56 = call i64 @"sx_f64_add"(i64 %t54, i64 %t55)
  %t57 = call i64 @"sx_f64_mul"(i64 %t53, i64 %t56)
  store i64 %t57, ptr %local.g2.45
  %t58 = load i64, ptr %local.g1.44
  %t59 = load i64, ptr %local.g2.45
  %t60 = call i64 @"sx_f64_mul"(i64 %t58, i64 %t59)
  store i64 %t60, ptr %local.dot12.46
  %t61 = load i64, ptr %local.g1.44
  %t62 = load i64, ptr %local.g1.44
  %t63 = call i64 @"sx_f64_mul"(i64 %t61, i64 %t62)
  %t64 = load i64, ptr %local.g2.45
  %t65 = load i64, ptr %local.g2.45
  %t66 = call i64 @"sx_f64_mul"(i64 %t64, i64 %t65)
  %t67 = call i64 @"sx_f64_add"(i64 %t63, i64 %t66)
  store i64 %t67, ptr %local.sum_sq.47
  %t68 = load i64, ptr %local.sum_sq.47
  %t69 = call i64 @f64_parse(ptr @.str.exp_balance_residual.12)
  %t70 = call i64 @"sx_f64_lt"(i64 %t68, i64 %t69)
  %t71 = icmp ne i64 %t70, 0
  br i1 %t71, label %then2, label %else2
then2:
  %t72 = call i64 @f64_parse(ptr @.str.exp_balance_residual.13)
  ret i64 %t72
else2:
  br label %else2_end
else2_end:
  br label %endif2
endif2:
  %t73 = phi i64 [ 0, %else2_end ]
  %t74 = load i64, ptr %local.dot12.46
  %t75 = load i64, ptr %local.sum_sq.47
  %t76 = call i64 @"sx_f64_div"(i64 %t74, i64 %t75)
  ret i64 %t76
}

define i64 @"dB_dtheta_1d"(i64 %theta) nounwind {
entry:
  %local.h.77 = alloca i64
  %local.theta = alloca i64
  store i64 %theta, ptr %local.theta
  %t78 = call i64 @f64_parse(ptr @.str.exp_balance_residual.14)
  store i64 %t78, ptr %local.h.77
  %t79 = load i64, ptr %local.theta
  %t80 = load i64, ptr %local.h.77
  %t81 = call i64 @"sx_f64_add"(i64 %t79, i64 %t80)
  %t82 = call i64 @"balance_1d"(i64 %t81)
  %t83 = load i64, ptr %local.theta
  %t84 = load i64, ptr %local.h.77
  %t85 = call i64 @"sx_f64_sub"(i64 %t83, i64 %t84)
  %t86 = call i64 @"balance_1d"(i64 %t85)
  %t87 = call i64 @"sx_f64_sub"(i64 %t82, i64 %t86)
  %t88 = call i64 @f64_parse(ptr @.str.exp_balance_residual.15)
  %t89 = load i64, ptr %local.h.77
  %t90 = call i64 @"sx_f64_mul"(i64 %t88, i64 %t89)
  %t91 = call i64 @"sx_f64_div"(i64 %t87, i64 %t90)
  ret i64 %t91
}

define i64 @"test_1d"() nounwind {
entry:
  %local.theta.92 = alloca i64
  %local.b.93 = alloca i64
  %local.ir.94 = alloca i64
  %local.db.95 = alloca i64
  %local.bx.96 = alloca i64
  %local.step.97 = alloca i64
  %local.db.98 = alloca i64
  %local.lx.99 = alloca i64
  %local.g.100 = alloca i64
  %local.d_b.101 = alloca i64
  %local.d_l.102 = alloca i64
  %t103 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.16)
  %t104 = ptrtoint ptr %t103 to i64
  %t105 = inttoptr i64 %t104 to ptr
  call void @intrinsic_println(ptr %t105)
  %t106 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.17)
  %t107 = ptrtoint ptr %t106 to i64
  %t108 = inttoptr i64 %t107 to ptr
  call void @intrinsic_println(ptr %t108)
  %t109 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.18)
  %t110 = ptrtoint ptr %t109 to i64
  %t111 = inttoptr i64 %t110 to ptr
  call void @intrinsic_println(ptr %t111)
  %t112 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.19)
  %t113 = ptrtoint ptr %t112 to i64
  %t114 = inttoptr i64 %t113 to ptr
  call void @intrinsic_println(ptr %t114)
  %t115 = call i64 @f64_parse(ptr @.str.exp_balance_residual.20)
  %t116 = xor i64 %t115, -9223372036854775808
  store i64 %t116, ptr %local.theta.92
  br label %loop3
loop3:
  %t117 = load i64, ptr %local.theta.92
  %t118 = call i64 @f64_parse(ptr @.str.exp_balance_residual.21)
  %t119 = call i64 @"sx_f64_le"(i64 %t117, i64 %t118)
  %t120 = icmp ne i64 %t119, 0
  br i1 %t120, label %body3, label %endloop3
body3:
  %t121 = load i64, ptr %local.theta.92
  %t122 = call i64 @"balance_1d"(i64 %t121)
  store i64 %t122, ptr %local.b.93
  %t123 = load i64, ptr %local.theta.92
  %t124 = call i64 @"iratio_1d"(i64 %t123)
  store i64 %t124, ptr %local.ir.94
  %t125 = load i64, ptr %local.theta.92
  %t126 = call i64 @"dB_dtheta_1d"(i64 %t125)
  store i64 %t126, ptr %local.db.95
  %t127 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.22)
  %t128 = ptrtoint ptr %t127 to i64
  %t129 = inttoptr i64 %t128 to ptr
  call void @intrinsic_print(ptr %t129)
  %t130 = load i64, ptr %local.theta.92
  %t131 = call i64 @"print_f64"(i64 %t130)
  %t132 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.23)
  %t133 = ptrtoint ptr %t132 to i64
  %t134 = inttoptr i64 %t133 to ptr
  call void @intrinsic_print(ptr %t134)
  %t135 = load i64, ptr %local.b.93
  %t136 = call i64 @"print_f64"(i64 %t135)
  %t137 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.24)
  %t138 = ptrtoint ptr %t137 to i64
  %t139 = inttoptr i64 %t138 to ptr
  call void @intrinsic_print(ptr %t139)
  %t140 = load i64, ptr %local.ir.94
  %t141 = call i64 @"print_f64"(i64 %t140)
  %t142 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.25)
  %t143 = ptrtoint ptr %t142 to i64
  %t144 = inttoptr i64 %t143 to ptr
  call void @intrinsic_print(ptr %t144)
  %t145 = load i64, ptr %local.db.95
  %t146 = call i64 @"print_f64"(i64 %t145)
  %t147 = load i64, ptr %local.theta.92
  %t148 = call i64 @f64_parse(ptr @.str.exp_balance_residual.26)
  %t149 = call i64 @"sx_f64_sub"(i64 %t147, i64 %t148)
  %t150 = call i64 @"abs_f64"(i64 %t149)
  %t151 = call i64 @f64_parse(ptr @.str.exp_balance_residual.27)
  %t152 = call i64 @"sx_f64_lt"(i64 %t150, i64 %t151)
  %t153 = icmp ne i64 %t152, 0
  br i1 %t153, label %then4, label %else4
then4:
  %t154 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.28)
  %t155 = ptrtoint ptr %t154 to i64
  %t156 = inttoptr i64 %t155 to ptr
  call void @intrinsic_println(ptr %t156)
  br label %then4_end
then4_end:
  br label %endif4
else4:
  %t157 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.29)
  %t158 = ptrtoint ptr %t157 to i64
  %t159 = inttoptr i64 %t158 to ptr
  call void @intrinsic_println(ptr %t159)
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t160 = phi i64 [ 0, %then4_end ], [ 0, %else4_end ]
  %t161 = load i64, ptr %local.theta.92
  %t162 = call i64 @f64_parse(ptr @.str.exp_balance_residual.30)
  %t163 = call i64 @"sx_f64_add"(i64 %t161, i64 %t162)
  store i64 %t163, ptr %local.theta.92
  br label %loop3
endloop3:
  %t164 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.31)
  %t165 = ptrtoint ptr %t164 to i64
  %t166 = inttoptr i64 %t165 to ptr
  call void @intrinsic_println(ptr %t166)
  %t167 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.32)
  %t168 = ptrtoint ptr %t167 to i64
  %t169 = inttoptr i64 %t168 to ptr
  call void @intrinsic_println(ptr %t169)
  %t170 = call i64 @f64_parse(ptr @.str.exp_balance_residual.33)
  %t171 = xor i64 %t170, -9223372036854775808
  store i64 %t171, ptr %local.bx.96
  store i64 0, ptr %local.step.97
  br label %loop5
loop5:
  %t172 = load i64, ptr %local.step.97
  %t173 = icmp slt i64 %t172, 200
  %t174 = zext i1 %t173 to i64
  %t175 = icmp ne i64 %t174, 0
  br i1 %t175, label %body5, label %endloop5
body5:
  %t176 = load i64, ptr %local.bx.96
  %t177 = call i64 @"dB_dtheta_1d"(i64 %t176)
  store i64 %t177, ptr %local.db.98
  %t178 = load i64, ptr %local.bx.96
  %t179 = call i64 @f64_parse(ptr @.str.exp_balance_residual.34)
  %t180 = load i64, ptr %local.db.98
  %t181 = call i64 @"sx_f64_mul"(i64 %t179, i64 %t180)
  %t182 = call i64 @"sx_f64_sub"(i64 %t178, i64 %t181)
  store i64 %t182, ptr %local.bx.96
  %t183 = load i64, ptr %local.step.97
  %t184 = icmp slt i64 %t183, 5
  %t185 = zext i1 %t184 to i64
  %t186 = icmp ne i64 %t185, 0
  br i1 %t186, label %then6, label %else6
then6:
  %t187 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.35)
  %t188 = ptrtoint ptr %t187 to i64
  %t189 = inttoptr i64 %t188 to ptr
  call void @intrinsic_print(ptr %t189)
  %t190 = load i64, ptr %local.step.97
  call void @print_i64(i64 %t190)
  %t191 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.36)
  %t192 = ptrtoint ptr %t191 to i64
  %t193 = inttoptr i64 %t192 to ptr
  call void @intrinsic_print(ptr %t193)
  %t194 = load i64, ptr %local.bx.96
  %t195 = call i64 @"print_f64"(i64 %t194)
  %t196 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.37)
  %t197 = ptrtoint ptr %t196 to i64
  %t198 = inttoptr i64 %t197 to ptr
  call void @intrinsic_print(ptr %t198)
  %t199 = load i64, ptr %local.bx.96
  %t200 = call i64 @"balance_1d"(i64 %t199)
  %t201 = call i64 @"print_f64"(i64 %t200)
  %t202 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.38)
  %t203 = ptrtoint ptr %t202 to i64
  %t204 = inttoptr i64 %t203 to ptr
  call void @intrinsic_println(ptr %t204)
  br label %then6_end
then6_end:
  br label %endif6
else6:
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t205 = phi i64 [ 0, %then6_end ], [ 0, %else6_end ]
  %t206 = load i64, ptr %local.step.97
  %t207 = add i64 %t206, 1
  store i64 %t207, ptr %local.step.97
  br label %loop5
endloop5:
  %t208 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.39)
  %t209 = ptrtoint ptr %t208 to i64
  %t210 = inttoptr i64 %t209 to ptr
  call void @intrinsic_print(ptr %t210)
  %t211 = load i64, ptr %local.bx.96
  %t212 = call i64 @"print_f64"(i64 %t211)
  %t213 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.40)
  %t214 = ptrtoint ptr %t213 to i64
  %t215 = inttoptr i64 %t214 to ptr
  call void @intrinsic_print(ptr %t215)
  %t216 = load i64, ptr %local.bx.96
  %t217 = call i64 @"balance_1d"(i64 %t216)
  %t218 = call i64 @"print_f64"(i64 %t217)
  %t219 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.41)
  %t220 = ptrtoint ptr %t219 to i64
  %t221 = inttoptr i64 %t220 to ptr
  call void @intrinsic_println(ptr %t221)
  %t222 = call i64 @f64_parse(ptr @.str.exp_balance_residual.42)
  %t223 = xor i64 %t222, -9223372036854775808
  store i64 %t223, ptr %local.lx.99
  store i64 0, ptr %local.step.97
  br label %loop7
loop7:
  %t224 = load i64, ptr %local.step.97
  %t225 = icmp slt i64 %t224, 200
  %t226 = zext i1 %t225 to i64
  %t227 = icmp ne i64 %t226, 0
  br i1 %t227, label %body7, label %endloop7
body7:
  %t228 = call i64 @f64_parse(ptr @.str.exp_balance_residual.43)
  %t229 = load i64, ptr %local.lx.99
  %t230 = call i64 @f64_parse(ptr @.str.exp_balance_residual.44)
  %t231 = call i64 @"sx_f64_sub"(i64 %t229, i64 %t230)
  %t232 = call i64 @"sx_f64_mul"(i64 %t228, i64 %t231)
  %t233 = call i64 @f64_parse(ptr @.str.exp_balance_residual.45)
  %t234 = load i64, ptr %local.lx.99
  %t235 = call i64 @f64_parse(ptr @.str.exp_balance_residual.46)
  %t236 = call i64 @"sx_f64_add"(i64 %t234, i64 %t235)
  %t237 = call i64 @"sx_f64_mul"(i64 %t233, i64 %t236)
  %t238 = call i64 @"sx_f64_add"(i64 %t232, i64 %t237)
  store i64 %t238, ptr %local.g.100
  %t239 = load i64, ptr %local.lx.99
  %t240 = call i64 @f64_parse(ptr @.str.exp_balance_residual.47)
  %t241 = load i64, ptr %local.g.100
  %t242 = call i64 @"sx_f64_mul"(i64 %t240, i64 %t241)
  %t243 = call i64 @"sx_f64_sub"(i64 %t239, i64 %t242)
  store i64 %t243, ptr %local.lx.99
  %t244 = load i64, ptr %local.step.97
  %t245 = add i64 %t244, 1
  store i64 %t245, ptr %local.step.97
  br label %loop7
endloop7:
  %t246 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.48)
  %t247 = ptrtoint ptr %t246 to i64
  %t248 = inttoptr i64 %t247 to ptr
  call void @intrinsic_print(ptr %t248)
  %t249 = load i64, ptr %local.lx.99
  %t250 = call i64 @"print_f64"(i64 %t249)
  %t251 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.49)
  %t252 = ptrtoint ptr %t251 to i64
  %t253 = inttoptr i64 %t252 to ptr
  call void @intrinsic_println(ptr %t253)
  %t254 = load i64, ptr %local.bx.96
  %t255 = call i64 @f64_parse(ptr @.str.exp_balance_residual.50)
  %t256 = call i64 @"sx_f64_sub"(i64 %t254, i64 %t255)
  %t257 = call i64 @"abs_f64"(i64 %t256)
  store i64 %t257, ptr %local.d_b.101
  %t258 = load i64, ptr %local.lx.99
  %t259 = call i64 @f64_parse(ptr @.str.exp_balance_residual.51)
  %t260 = call i64 @"sx_f64_sub"(i64 %t258, i64 %t259)
  %t261 = call i64 @"abs_f64"(i64 %t260)
  store i64 %t261, ptr %local.d_l.102
  %t262 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.52)
  %t263 = ptrtoint ptr %t262 to i64
  %t264 = inttoptr i64 %t263 to ptr
  call void @intrinsic_print(ptr %t264)
  %t265 = load i64, ptr %local.d_b.101
  %t266 = call i64 @"print_f64"(i64 %t265)
  %t267 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.53)
  %t268 = ptrtoint ptr %t267 to i64
  %t269 = inttoptr i64 %t268 to ptr
  call void @intrinsic_println(ptr %t269)
  %t270 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.54)
  %t271 = ptrtoint ptr %t270 to i64
  %t272 = inttoptr i64 %t271 to ptr
  call void @intrinsic_print(ptr %t272)
  %t273 = load i64, ptr %local.d_l.102
  %t274 = call i64 @"print_f64"(i64 %t273)
  %t275 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.55)
  %t276 = ptrtoint ptr %t275 to i64
  %t277 = inttoptr i64 %t276 to ptr
  call void @intrinsic_println(ptr %t277)
  %t278 = load i64, ptr %local.d_b.101
  %t279 = call i64 @f64_parse(ptr @.str.exp_balance_residual.56)
  %t280 = call i64 @"sx_f64_lt"(i64 %t278, i64 %t279)
  %t281 = icmp ne i64 %t280, 0
  br i1 %t281, label %then8, label %else8
then8:
  %t282 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.57)
  %t283 = ptrtoint ptr %t282 to i64
  %t284 = inttoptr i64 %t283 to ptr
  call void @intrinsic_println(ptr %t284)
  br label %then8_end
then8_end:
  br label %endif8
else8:
  %t285 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.58)
  %t286 = ptrtoint ptr %t285 to i64
  %t287 = inttoptr i64 %t286 to ptr
  call void @intrinsic_println(ptr %t287)
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t288 = phi i64 [ 0, %then8_end ], [ 0, %else8_end ]
  %t289 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.59)
  %t290 = ptrtoint ptr %t289 to i64
  %t291 = inttoptr i64 %t290 to ptr
  call void @intrinsic_println(ptr %t291)
  ret i64 0
}

define i64 @"balance_2d"(i64 %x, i64 %y) nounwind {
entry:
  %local.g1x.292 = alloca i64
  %local.g1y.293 = alloca i64
  %local.g2x.294 = alloca i64
  %local.g2y.295 = alloca i64
  %local.g3x.296 = alloca i64
  %local.g3y.297 = alloca i64
  %local.sx.298 = alloca i64
  %local.sy.299 = alloca i64
  %local.sum_g_sq.300 = alloca i64
  %local.ind_sq.301 = alloca i64
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %local.y = alloca i64
  store i64 %y, ptr %local.y
  %t302 = call i64 @f64_parse(ptr @.str.exp_balance_residual.60)
  %t303 = load i64, ptr %local.x
  %t304 = call i64 @f64_parse(ptr @.str.exp_balance_residual.61)
  %t305 = call i64 @"sx_f64_sub"(i64 %t303, i64 %t304)
  %t306 = call i64 @"sx_f64_mul"(i64 %t302, i64 %t305)
  store i64 %t306, ptr %local.g1x.292
  %t307 = call i64 @f64_parse(ptr @.str.exp_balance_residual.62)
  %t308 = load i64, ptr %local.y
  %t309 = call i64 @f64_parse(ptr @.str.exp_balance_residual.63)
  %t310 = call i64 @"sx_f64_sub"(i64 %t308, i64 %t309)
  %t311 = call i64 @"sx_f64_mul"(i64 %t307, i64 %t310)
  store i64 %t311, ptr %local.g1y.293
  %t312 = call i64 @f64_parse(ptr @.str.exp_balance_residual.64)
  %t313 = load i64, ptr %local.x
  %t314 = call i64 @f64_parse(ptr @.str.exp_balance_residual.65)
  %t315 = call i64 @"sx_f64_add"(i64 %t313, i64 %t314)
  %t316 = call i64 @"sx_f64_mul"(i64 %t312, i64 %t315)
  store i64 %t316, ptr %local.g2x.294
  %t317 = call i64 @f64_parse(ptr @.str.exp_balance_residual.66)
  %t318 = load i64, ptr %local.y
  %t319 = call i64 @f64_parse(ptr @.str.exp_balance_residual.67)
  %t320 = call i64 @"sx_f64_sub"(i64 %t318, i64 %t319)
  %t321 = call i64 @"sx_f64_mul"(i64 %t317, i64 %t320)
  store i64 %t321, ptr %local.g2y.295
  %t322 = call i64 @f64_parse(ptr @.str.exp_balance_residual.68)
  %t323 = load i64, ptr %local.x
  %t324 = call i64 @f64_parse(ptr @.str.exp_balance_residual.69)
  %t325 = call i64 @"sx_f64_sub"(i64 %t323, i64 %t324)
  %t326 = call i64 @"sx_f64_mul"(i64 %t322, i64 %t325)
  store i64 %t326, ptr %local.g3x.296
  %t327 = call i64 @f64_parse(ptr @.str.exp_balance_residual.70)
  %t328 = load i64, ptr %local.y
  %t329 = call i64 @f64_parse(ptr @.str.exp_balance_residual.71)
  %t330 = call i64 @"sx_f64_add"(i64 %t328, i64 %t329)
  %t331 = call i64 @"sx_f64_mul"(i64 %t327, i64 %t330)
  store i64 %t331, ptr %local.g3y.297
  %t332 = load i64, ptr %local.g1x.292
  %t333 = load i64, ptr %local.g2x.294
  %t334 = call i64 @"sx_f64_add"(i64 %t332, i64 %t333)
  %t335 = load i64, ptr %local.g3x.296
  %t336 = call i64 @"sx_f64_add"(i64 %t334, i64 %t335)
  store i64 %t336, ptr %local.sx.298
  %t337 = load i64, ptr %local.g1y.293
  %t338 = load i64, ptr %local.g2y.295
  %t339 = call i64 @"sx_f64_add"(i64 %t337, i64 %t338)
  %t340 = load i64, ptr %local.g3y.297
  %t341 = call i64 @"sx_f64_add"(i64 %t339, i64 %t340)
  store i64 %t341, ptr %local.sy.299
  %t342 = load i64, ptr %local.sx.298
  %t343 = load i64, ptr %local.sx.298
  %t344 = call i64 @"sx_f64_mul"(i64 %t342, i64 %t343)
  %t345 = load i64, ptr %local.sy.299
  %t346 = load i64, ptr %local.sy.299
  %t347 = call i64 @"sx_f64_mul"(i64 %t345, i64 %t346)
  %t348 = call i64 @"sx_f64_add"(i64 %t344, i64 %t347)
  store i64 %t348, ptr %local.sum_g_sq.300
  %t349 = load i64, ptr %local.g1x.292
  %t350 = load i64, ptr %local.g1x.292
  %t351 = call i64 @"sx_f64_mul"(i64 %t349, i64 %t350)
  %t352 = load i64, ptr %local.g1y.293
  %t353 = load i64, ptr %local.g1y.293
  %t354 = call i64 @"sx_f64_mul"(i64 %t352, i64 %t353)
  %t355 = call i64 @"sx_f64_add"(i64 %t351, i64 %t354)
  %t356 = load i64, ptr %local.g2x.294
  %t357 = load i64, ptr %local.g2x.294
  %t358 = call i64 @"sx_f64_mul"(i64 %t356, i64 %t357)
  %t359 = call i64 @"sx_f64_add"(i64 %t355, i64 %t358)
  %t360 = load i64, ptr %local.g2y.295
  %t361 = load i64, ptr %local.g2y.295
  %t362 = call i64 @"sx_f64_mul"(i64 %t360, i64 %t361)
  %t363 = call i64 @"sx_f64_add"(i64 %t359, i64 %t362)
  %t364 = load i64, ptr %local.g3x.296
  %t365 = load i64, ptr %local.g3x.296
  %t366 = call i64 @"sx_f64_mul"(i64 %t364, i64 %t365)
  %t367 = call i64 @"sx_f64_add"(i64 %t363, i64 %t366)
  %t368 = load i64, ptr %local.g3y.297
  %t369 = load i64, ptr %local.g3y.297
  %t370 = call i64 @"sx_f64_mul"(i64 %t368, i64 %t369)
  %t371 = call i64 @"sx_f64_add"(i64 %t367, i64 %t370)
  store i64 %t371, ptr %local.ind_sq.301
  %t372 = load i64, ptr %local.ind_sq.301
  %t373 = call i64 @f64_parse(ptr @.str.exp_balance_residual.72)
  %t374 = call i64 @"sx_f64_lt"(i64 %t372, i64 %t373)
  %t375 = icmp ne i64 %t374, 0
  br i1 %t375, label %then9, label %else9
then9:
  %t376 = call i64 @f64_parse(ptr @.str.exp_balance_residual.73)
  ret i64 %t376
else9:
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t377 = phi i64 [ 0, %else9_end ]
  %t378 = load i64, ptr %local.sum_g_sq.300
  %t379 = load i64, ptr %local.ind_sq.301
  %t380 = call i64 @"sx_f64_div"(i64 %t378, i64 %t379)
  ret i64 %t380
}

define i64 @"iratio_2d"(i64 %x, i64 %y) nounwind {
entry:
  %local.g1x.381 = alloca i64
  %local.g1y.382 = alloca i64
  %local.g2x.383 = alloca i64
  %local.g2y.384 = alloca i64
  %local.g3x.385 = alloca i64
  %local.g3y.386 = alloca i64
  %local.d12.387 = alloca i64
  %local.d13.388 = alloca i64
  %local.d23.389 = alloca i64
  %local.cross_sum.390 = alloca i64
  %local.ind_sq.391 = alloca i64
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %local.y = alloca i64
  store i64 %y, ptr %local.y
  %t392 = call i64 @f64_parse(ptr @.str.exp_balance_residual.74)
  %t393 = load i64, ptr %local.x
  %t394 = call i64 @f64_parse(ptr @.str.exp_balance_residual.75)
  %t395 = call i64 @"sx_f64_sub"(i64 %t393, i64 %t394)
  %t396 = call i64 @"sx_f64_mul"(i64 %t392, i64 %t395)
  store i64 %t396, ptr %local.g1x.381
  %t397 = call i64 @f64_parse(ptr @.str.exp_balance_residual.76)
  %t398 = load i64, ptr %local.y
  %t399 = call i64 @f64_parse(ptr @.str.exp_balance_residual.77)
  %t400 = call i64 @"sx_f64_sub"(i64 %t398, i64 %t399)
  %t401 = call i64 @"sx_f64_mul"(i64 %t397, i64 %t400)
  store i64 %t401, ptr %local.g1y.382
  %t402 = call i64 @f64_parse(ptr @.str.exp_balance_residual.78)
  %t403 = load i64, ptr %local.x
  %t404 = call i64 @f64_parse(ptr @.str.exp_balance_residual.79)
  %t405 = call i64 @"sx_f64_add"(i64 %t403, i64 %t404)
  %t406 = call i64 @"sx_f64_mul"(i64 %t402, i64 %t405)
  store i64 %t406, ptr %local.g2x.383
  %t407 = call i64 @f64_parse(ptr @.str.exp_balance_residual.80)
  %t408 = load i64, ptr %local.y
  %t409 = call i64 @f64_parse(ptr @.str.exp_balance_residual.81)
  %t410 = call i64 @"sx_f64_sub"(i64 %t408, i64 %t409)
  %t411 = call i64 @"sx_f64_mul"(i64 %t407, i64 %t410)
  store i64 %t411, ptr %local.g2y.384
  %t412 = call i64 @f64_parse(ptr @.str.exp_balance_residual.82)
  %t413 = load i64, ptr %local.x
  %t414 = call i64 @f64_parse(ptr @.str.exp_balance_residual.83)
  %t415 = call i64 @"sx_f64_sub"(i64 %t413, i64 %t414)
  %t416 = call i64 @"sx_f64_mul"(i64 %t412, i64 %t415)
  store i64 %t416, ptr %local.g3x.385
  %t417 = call i64 @f64_parse(ptr @.str.exp_balance_residual.84)
  %t418 = load i64, ptr %local.y
  %t419 = call i64 @f64_parse(ptr @.str.exp_balance_residual.85)
  %t420 = call i64 @"sx_f64_add"(i64 %t418, i64 %t419)
  %t421 = call i64 @"sx_f64_mul"(i64 %t417, i64 %t420)
  store i64 %t421, ptr %local.g3y.386
  %t422 = load i64, ptr %local.g1x.381
  %t423 = load i64, ptr %local.g2x.383
  %t424 = call i64 @"sx_f64_mul"(i64 %t422, i64 %t423)
  %t425 = load i64, ptr %local.g1y.382
  %t426 = load i64, ptr %local.g2y.384
  %t427 = call i64 @"sx_f64_mul"(i64 %t425, i64 %t426)
  %t428 = call i64 @"sx_f64_add"(i64 %t424, i64 %t427)
  store i64 %t428, ptr %local.d12.387
  %t429 = load i64, ptr %local.g1x.381
  %t430 = load i64, ptr %local.g3x.385
  %t431 = call i64 @"sx_f64_mul"(i64 %t429, i64 %t430)
  %t432 = load i64, ptr %local.g1y.382
  %t433 = load i64, ptr %local.g3y.386
  %t434 = call i64 @"sx_f64_mul"(i64 %t432, i64 %t433)
  %t435 = call i64 @"sx_f64_add"(i64 %t431, i64 %t434)
  store i64 %t435, ptr %local.d13.388
  %t436 = load i64, ptr %local.g2x.383
  %t437 = load i64, ptr %local.g3x.385
  %t438 = call i64 @"sx_f64_mul"(i64 %t436, i64 %t437)
  %t439 = load i64, ptr %local.g2y.384
  %t440 = load i64, ptr %local.g3y.386
  %t441 = call i64 @"sx_f64_mul"(i64 %t439, i64 %t440)
  %t442 = call i64 @"sx_f64_add"(i64 %t438, i64 %t441)
  store i64 %t442, ptr %local.d23.389
  %t443 = load i64, ptr %local.d12.387
  %t444 = load i64, ptr %local.d13.388
  %t445 = call i64 @"sx_f64_add"(i64 %t443, i64 %t444)
  %t446 = load i64, ptr %local.d23.389
  %t447 = call i64 @"sx_f64_add"(i64 %t445, i64 %t446)
  store i64 %t447, ptr %local.cross_sum.390
  %t448 = load i64, ptr %local.g1x.381
  %t449 = load i64, ptr %local.g1x.381
  %t450 = call i64 @"sx_f64_mul"(i64 %t448, i64 %t449)
  %t451 = load i64, ptr %local.g1y.382
  %t452 = load i64, ptr %local.g1y.382
  %t453 = call i64 @"sx_f64_mul"(i64 %t451, i64 %t452)
  %t454 = call i64 @"sx_f64_add"(i64 %t450, i64 %t453)
  %t455 = load i64, ptr %local.g2x.383
  %t456 = load i64, ptr %local.g2x.383
  %t457 = call i64 @"sx_f64_mul"(i64 %t455, i64 %t456)
  %t458 = call i64 @"sx_f64_add"(i64 %t454, i64 %t457)
  %t459 = load i64, ptr %local.g2y.384
  %t460 = load i64, ptr %local.g2y.384
  %t461 = call i64 @"sx_f64_mul"(i64 %t459, i64 %t460)
  %t462 = call i64 @"sx_f64_add"(i64 %t458, i64 %t461)
  %t463 = load i64, ptr %local.g3x.385
  %t464 = load i64, ptr %local.g3x.385
  %t465 = call i64 @"sx_f64_mul"(i64 %t463, i64 %t464)
  %t466 = call i64 @"sx_f64_add"(i64 %t462, i64 %t465)
  %t467 = load i64, ptr %local.g3y.386
  %t468 = load i64, ptr %local.g3y.386
  %t469 = call i64 @"sx_f64_mul"(i64 %t467, i64 %t468)
  %t470 = call i64 @"sx_f64_add"(i64 %t466, i64 %t469)
  store i64 %t470, ptr %local.ind_sq.391
  %t471 = load i64, ptr %local.ind_sq.391
  %t472 = call i64 @f64_parse(ptr @.str.exp_balance_residual.86)
  %t473 = call i64 @"sx_f64_lt"(i64 %t471, i64 %t472)
  %t474 = icmp ne i64 %t473, 0
  br i1 %t474, label %then10, label %else10
then10:
  %t475 = call i64 @f64_parse(ptr @.str.exp_balance_residual.87)
  ret i64 %t475
else10:
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t476 = phi i64 [ 0, %else10_end ]
  %t477 = load i64, ptr %local.cross_sum.390
  %t478 = load i64, ptr %local.ind_sq.391
  %t479 = call i64 @"sx_f64_div"(i64 %t477, i64 %t478)
  ret i64 %t479
}

define i64 @"dB_dx"(i64 %x, i64 %y) nounwind {
entry:
  %local.h.480 = alloca i64
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %local.y = alloca i64
  store i64 %y, ptr %local.y
  %t481 = call i64 @f64_parse(ptr @.str.exp_balance_residual.88)
  store i64 %t481, ptr %local.h.480
  %t482 = load i64, ptr %local.x
  %t483 = load i64, ptr %local.h.480
  %t484 = call i64 @"sx_f64_add"(i64 %t482, i64 %t483)
  %t485 = load i64, ptr %local.y
  %t486 = call i64 @"balance_2d"(i64 %t484, i64 %t485)
  %t487 = load i64, ptr %local.x
  %t488 = load i64, ptr %local.h.480
  %t489 = call i64 @"sx_f64_sub"(i64 %t487, i64 %t488)
  %t490 = load i64, ptr %local.y
  %t491 = call i64 @"balance_2d"(i64 %t489, i64 %t490)
  %t492 = call i64 @"sx_f64_sub"(i64 %t486, i64 %t491)
  %t493 = call i64 @f64_parse(ptr @.str.exp_balance_residual.89)
  %t494 = load i64, ptr %local.h.480
  %t495 = call i64 @"sx_f64_mul"(i64 %t493, i64 %t494)
  %t496 = call i64 @"sx_f64_div"(i64 %t492, i64 %t495)
  ret i64 %t496
}

define i64 @"dB_dy"(i64 %x, i64 %y) nounwind {
entry:
  %local.h.497 = alloca i64
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %local.y = alloca i64
  store i64 %y, ptr %local.y
  %t498 = call i64 @f64_parse(ptr @.str.exp_balance_residual.90)
  store i64 %t498, ptr %local.h.497
  %t499 = load i64, ptr %local.x
  %t500 = load i64, ptr %local.y
  %t501 = load i64, ptr %local.h.497
  %t502 = call i64 @"sx_f64_add"(i64 %t500, i64 %t501)
  %t503 = call i64 @"balance_2d"(i64 %t499, i64 %t502)
  %t504 = load i64, ptr %local.x
  %t505 = load i64, ptr %local.y
  %t506 = load i64, ptr %local.h.497
  %t507 = call i64 @"sx_f64_sub"(i64 %t505, i64 %t506)
  %t508 = call i64 @"balance_2d"(i64 %t504, i64 %t507)
  %t509 = call i64 @"sx_f64_sub"(i64 %t503, i64 %t508)
  %t510 = call i64 @f64_parse(ptr @.str.exp_balance_residual.91)
  %t511 = load i64, ptr %local.h.497
  %t512 = call i64 @"sx_f64_mul"(i64 %t510, i64 %t511)
  %t513 = call i64 @"sx_f64_div"(i64 %t509, i64 %t512)
  ret i64 %t513
}

define i64 @"test_2d"() nounwind {
entry:
  %local.bx.514 = alloca i64
  %local.by.515 = alloca i64
  %local.step.516 = alloca i64
  %local.dx.517 = alloca i64
  %local.dy.518 = alloca i64
  %local.lx.519 = alloca i64
  %local.ly.520 = alloca i64
  %local.gx.521 = alloca i64
  %local.gy.522 = alloca i64
  %local.d_b.523 = alloca i64
  %local.d_l.524 = alloca i64
  %t525 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.92)
  %t526 = ptrtoint ptr %t525 to i64
  %t527 = inttoptr i64 %t526 to ptr
  call void @intrinsic_println(ptr %t527)
  %t528 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.93)
  %t529 = ptrtoint ptr %t528 to i64
  %t530 = inttoptr i64 %t529 to ptr
  call void @intrinsic_println(ptr %t530)
  %t531 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.94)
  %t532 = ptrtoint ptr %t531 to i64
  %t533 = inttoptr i64 %t532 to ptr
  call void @intrinsic_println(ptr %t533)
  %t534 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.95)
  %t535 = ptrtoint ptr %t534 to i64
  %t536 = inttoptr i64 %t535 to ptr
  call void @intrinsic_println(ptr %t536)
  %t537 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.96)
  %t538 = ptrtoint ptr %t537 to i64
  %t539 = inttoptr i64 %t538 to ptr
  call void @intrinsic_println(ptr %t539)
  %t540 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.97)
  %t541 = ptrtoint ptr %t540 to i64
  %t542 = inttoptr i64 %t541 to ptr
  call void @intrinsic_print(ptr %t542)
  %t543 = call i64 @f64_parse(ptr @.str.exp_balance_residual.98)
  %t544 = call i64 @f64_parse(ptr @.str.exp_balance_residual.99)
  %t545 = call i64 @"balance_2d"(i64 %t543, i64 %t544)
  %t546 = call i64 @"print_f64"(i64 %t545)
  %t547 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.100)
  %t548 = ptrtoint ptr %t547 to i64
  %t549 = inttoptr i64 %t548 to ptr
  call void @intrinsic_print(ptr %t549)
  %t550 = call i64 @f64_parse(ptr @.str.exp_balance_residual.101)
  %t551 = call i64 @f64_parse(ptr @.str.exp_balance_residual.102)
  %t552 = call i64 @"iratio_2d"(i64 %t550, i64 %t551)
  %t553 = call i64 @"print_f64"(i64 %t552)
  %t554 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.103)
  %t555 = ptrtoint ptr %t554 to i64
  %t556 = inttoptr i64 %t555 to ptr
  call void @intrinsic_println(ptr %t556)
  %t557 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.104)
  %t558 = ptrtoint ptr %t557 to i64
  %t559 = inttoptr i64 %t558 to ptr
  call void @intrinsic_print(ptr %t559)
  %t560 = call i64 @f64_parse(ptr @.str.exp_balance_residual.105)
  %t561 = call i64 @f64_parse(ptr @.str.exp_balance_residual.106)
  %t562 = call i64 @"balance_2d"(i64 %t560, i64 %t561)
  %t563 = call i64 @"print_f64"(i64 %t562)
  %t564 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.107)
  %t565 = ptrtoint ptr %t564 to i64
  %t566 = inttoptr i64 %t565 to ptr
  call void @intrinsic_print(ptr %t566)
  %t567 = call i64 @f64_parse(ptr @.str.exp_balance_residual.108)
  %t568 = call i64 @f64_parse(ptr @.str.exp_balance_residual.109)
  %t569 = call i64 @"iratio_2d"(i64 %t567, i64 %t568)
  %t570 = call i64 @"print_f64"(i64 %t569)
  %t571 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.110)
  %t572 = ptrtoint ptr %t571 to i64
  %t573 = inttoptr i64 %t572 to ptr
  call void @intrinsic_println(ptr %t573)
  %t574 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.111)
  %t575 = ptrtoint ptr %t574 to i64
  %t576 = inttoptr i64 %t575 to ptr
  call void @intrinsic_print(ptr %t576)
  %t577 = call i64 @f64_parse(ptr @.str.exp_balance_residual.112)
  %t578 = xor i64 %t577, -9223372036854775808
  %t579 = call i64 @f64_parse(ptr @.str.exp_balance_residual.113)
  %t580 = call i64 @"balance_2d"(i64 %t578, i64 %t579)
  %t581 = call i64 @"print_f64"(i64 %t580)
  %t582 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.114)
  %t583 = ptrtoint ptr %t582 to i64
  %t584 = inttoptr i64 %t583 to ptr
  call void @intrinsic_print(ptr %t584)
  %t585 = call i64 @f64_parse(ptr @.str.exp_balance_residual.115)
  %t586 = xor i64 %t585, -9223372036854775808
  %t587 = call i64 @f64_parse(ptr @.str.exp_balance_residual.116)
  %t588 = call i64 @"iratio_2d"(i64 %t586, i64 %t587)
  %t589 = call i64 @"print_f64"(i64 %t588)
  %t590 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.117)
  %t591 = ptrtoint ptr %t590 to i64
  %t592 = inttoptr i64 %t591 to ptr
  call void @intrinsic_println(ptr %t592)
  %t593 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.118)
  %t594 = ptrtoint ptr %t593 to i64
  %t595 = inttoptr i64 %t594 to ptr
  call void @intrinsic_print(ptr %t595)
  %t596 = call i64 @f64_parse(ptr @.str.exp_balance_residual.119)
  %t597 = call i64 @f64_parse(ptr @.str.exp_balance_residual.120)
  %t598 = call i64 @"balance_2d"(i64 %t596, i64 %t597)
  %t599 = call i64 @"print_f64"(i64 %t598)
  %t600 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.121)
  %t601 = ptrtoint ptr %t600 to i64
  %t602 = inttoptr i64 %t601 to ptr
  call void @intrinsic_print(ptr %t602)
  %t603 = call i64 @f64_parse(ptr @.str.exp_balance_residual.122)
  %t604 = call i64 @f64_parse(ptr @.str.exp_balance_residual.123)
  %t605 = call i64 @"iratio_2d"(i64 %t603, i64 %t604)
  %t606 = call i64 @"print_f64"(i64 %t605)
  %t607 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.124)
  %t608 = ptrtoint ptr %t607 to i64
  %t609 = inttoptr i64 %t608 to ptr
  call void @intrinsic_println(ptr %t609)
  %t610 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.125)
  %t611 = ptrtoint ptr %t610 to i64
  %t612 = inttoptr i64 %t611 to ptr
  call void @intrinsic_print(ptr %t612)
  %t613 = call i64 @f64_parse(ptr @.str.exp_balance_residual.126)
  %t614 = xor i64 %t613, -9223372036854775808
  %t615 = call i64 @f64_parse(ptr @.str.exp_balance_residual.127)
  %t616 = xor i64 %t615, -9223372036854775808
  %t617 = call i64 @"balance_2d"(i64 %t614, i64 %t616)
  %t618 = call i64 @"print_f64"(i64 %t617)
  %t619 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.128)
  %t620 = ptrtoint ptr %t619 to i64
  %t621 = inttoptr i64 %t620 to ptr
  call void @intrinsic_print(ptr %t621)
  %t622 = call i64 @f64_parse(ptr @.str.exp_balance_residual.129)
  %t623 = xor i64 %t622, -9223372036854775808
  %t624 = call i64 @f64_parse(ptr @.str.exp_balance_residual.130)
  %t625 = xor i64 %t624, -9223372036854775808
  %t626 = call i64 @"iratio_2d"(i64 %t623, i64 %t625)
  %t627 = call i64 @"print_f64"(i64 %t626)
  %t628 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.131)
  %t629 = ptrtoint ptr %t628 to i64
  %t630 = inttoptr i64 %t629 to ptr
  call void @intrinsic_println(ptr %t630)
  %t631 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.132)
  %t632 = ptrtoint ptr %t631 to i64
  %t633 = inttoptr i64 %t632 to ptr
  call void @intrinsic_println(ptr %t633)
  %t634 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.133)
  %t635 = ptrtoint ptr %t634 to i64
  %t636 = inttoptr i64 %t635 to ptr
  call void @intrinsic_println(ptr %t636)
  %t637 = call i64 @f64_parse(ptr @.str.exp_balance_residual.134)
  %t638 = xor i64 %t637, -9223372036854775808
  store i64 %t638, ptr %local.bx.514
  %t639 = call i64 @f64_parse(ptr @.str.exp_balance_residual.135)
  %t640 = xor i64 %t639, -9223372036854775808
  store i64 %t640, ptr %local.by.515
  store i64 0, ptr %local.step.516
  br label %loop11
loop11:
  %t641 = load i64, ptr %local.step.516
  %t642 = icmp slt i64 %t641, 500
  %t643 = zext i1 %t642 to i64
  %t644 = icmp ne i64 %t643, 0
  br i1 %t644, label %body11, label %endloop11
body11:
  %t645 = load i64, ptr %local.bx.514
  %t646 = load i64, ptr %local.by.515
  %t647 = call i64 @"dB_dx"(i64 %t645, i64 %t646)
  store i64 %t647, ptr %local.dx.517
  %t648 = load i64, ptr %local.bx.514
  %t649 = load i64, ptr %local.by.515
  %t650 = call i64 @"dB_dy"(i64 %t648, i64 %t649)
  store i64 %t650, ptr %local.dy.518
  %t651 = load i64, ptr %local.bx.514
  %t652 = call i64 @f64_parse(ptr @.str.exp_balance_residual.136)
  %t653 = load i64, ptr %local.dx.517
  %t654 = call i64 @"sx_f64_mul"(i64 %t652, i64 %t653)
  %t655 = call i64 @"sx_f64_sub"(i64 %t651, i64 %t654)
  store i64 %t655, ptr %local.bx.514
  %t656 = load i64, ptr %local.by.515
  %t657 = call i64 @f64_parse(ptr @.str.exp_balance_residual.137)
  %t658 = load i64, ptr %local.dy.518
  %t659 = call i64 @"sx_f64_mul"(i64 %t657, i64 %t658)
  %t660 = call i64 @"sx_f64_sub"(i64 %t656, i64 %t659)
  store i64 %t660, ptr %local.by.515
  %t661 = load i64, ptr %local.step.516
  %t662 = icmp slt i64 %t661, 5
  %t663 = zext i1 %t662 to i64
  %t664 = icmp ne i64 %t663, 0
  br i1 %t664, label %then12, label %else12
then12:
  %t665 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.138)
  %t666 = ptrtoint ptr %t665 to i64
  %t667 = inttoptr i64 %t666 to ptr
  call void @intrinsic_print(ptr %t667)
  %t668 = load i64, ptr %local.step.516
  call void @print_i64(i64 %t668)
  %t669 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.139)
  %t670 = ptrtoint ptr %t669 to i64
  %t671 = inttoptr i64 %t670 to ptr
  call void @intrinsic_print(ptr %t671)
  %t672 = load i64, ptr %local.bx.514
  %t673 = call i64 @"print_f64"(i64 %t672)
  %t674 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.140)
  %t675 = ptrtoint ptr %t674 to i64
  %t676 = inttoptr i64 %t675 to ptr
  call void @intrinsic_print(ptr %t676)
  %t677 = load i64, ptr %local.by.515
  %t678 = call i64 @"print_f64"(i64 %t677)
  %t679 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.141)
  %t680 = ptrtoint ptr %t679 to i64
  %t681 = inttoptr i64 %t680 to ptr
  call void @intrinsic_print(ptr %t681)
  %t682 = load i64, ptr %local.bx.514
  %t683 = load i64, ptr %local.by.515
  %t684 = call i64 @"balance_2d"(i64 %t682, i64 %t683)
  %t685 = call i64 @"print_f64"(i64 %t684)
  %t686 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.142)
  %t687 = ptrtoint ptr %t686 to i64
  %t688 = inttoptr i64 %t687 to ptr
  call void @intrinsic_println(ptr %t688)
  br label %then12_end
then12_end:
  br label %endif12
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t689 = phi i64 [ 0, %then12_end ], [ 0, %else12_end ]
  %t690 = load i64, ptr %local.step.516
  %t691 = icmp eq i64 %t690, 50
  %t692 = zext i1 %t691 to i64
  %t693 = icmp ne i64 %t692, 0
  br i1 %t693, label %then13, label %else13
then13:
  %t694 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.143)
  %t695 = ptrtoint ptr %t694 to i64
  %t696 = inttoptr i64 %t695 to ptr
  call void @intrinsic_print(ptr %t696)
  %t697 = load i64, ptr %local.bx.514
  %t698 = call i64 @"print_f64"(i64 %t697)
  %t699 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.144)
  %t700 = ptrtoint ptr %t699 to i64
  %t701 = inttoptr i64 %t700 to ptr
  call void @intrinsic_print(ptr %t701)
  %t702 = load i64, ptr %local.by.515
  %t703 = call i64 @"print_f64"(i64 %t702)
  %t704 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.145)
  %t705 = ptrtoint ptr %t704 to i64
  %t706 = inttoptr i64 %t705 to ptr
  call void @intrinsic_print(ptr %t706)
  %t707 = load i64, ptr %local.bx.514
  %t708 = load i64, ptr %local.by.515
  %t709 = call i64 @"balance_2d"(i64 %t707, i64 %t708)
  %t710 = call i64 @"print_f64"(i64 %t709)
  %t711 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.146)
  %t712 = ptrtoint ptr %t711 to i64
  %t713 = inttoptr i64 %t712 to ptr
  call void @intrinsic_println(ptr %t713)
  br label %then13_end
then13_end:
  br label %endif13
else13:
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t714 = phi i64 [ 0, %then13_end ], [ 0, %else13_end ]
  %t715 = load i64, ptr %local.step.516
  %t716 = icmp eq i64 %t715, 499
  %t717 = zext i1 %t716 to i64
  %t718 = icmp ne i64 %t717, 0
  br i1 %t718, label %then14, label %else14
then14:
  %t719 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.147)
  %t720 = ptrtoint ptr %t719 to i64
  %t721 = inttoptr i64 %t720 to ptr
  call void @intrinsic_print(ptr %t721)
  %t722 = load i64, ptr %local.bx.514
  %t723 = call i64 @"print_f64"(i64 %t722)
  %t724 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.148)
  %t725 = ptrtoint ptr %t724 to i64
  %t726 = inttoptr i64 %t725 to ptr
  call void @intrinsic_print(ptr %t726)
  %t727 = load i64, ptr %local.by.515
  %t728 = call i64 @"print_f64"(i64 %t727)
  %t729 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.149)
  %t730 = ptrtoint ptr %t729 to i64
  %t731 = inttoptr i64 %t730 to ptr
  call void @intrinsic_print(ptr %t731)
  %t732 = load i64, ptr %local.bx.514
  %t733 = load i64, ptr %local.by.515
  %t734 = call i64 @"balance_2d"(i64 %t732, i64 %t733)
  %t735 = call i64 @"print_f64"(i64 %t734)
  %t736 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.150)
  %t737 = ptrtoint ptr %t736 to i64
  %t738 = inttoptr i64 %t737 to ptr
  call void @intrinsic_println(ptr %t738)
  br label %then14_end
then14_end:
  br label %endif14
else14:
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t739 = phi i64 [ 0, %then14_end ], [ 0, %else14_end ]
  %t740 = load i64, ptr %local.step.516
  %t741 = add i64 %t740, 1
  store i64 %t741, ptr %local.step.516
  br label %loop11
endloop11:
  %t742 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.151)
  %t743 = ptrtoint ptr %t742 to i64
  %t744 = inttoptr i64 %t743 to ptr
  call void @intrinsic_println(ptr %t744)
  %t745 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.152)
  %t746 = ptrtoint ptr %t745 to i64
  %t747 = inttoptr i64 %t746 to ptr
  call void @intrinsic_println(ptr %t747)
  %t748 = call i64 @f64_parse(ptr @.str.exp_balance_residual.153)
  %t749 = xor i64 %t748, -9223372036854775808
  store i64 %t749, ptr %local.lx.519
  %t750 = call i64 @f64_parse(ptr @.str.exp_balance_residual.154)
  %t751 = xor i64 %t750, -9223372036854775808
  store i64 %t751, ptr %local.ly.520
  store i64 0, ptr %local.step.516
  br label %loop15
loop15:
  %t752 = load i64, ptr %local.step.516
  %t753 = icmp slt i64 %t752, 500
  %t754 = zext i1 %t753 to i64
  %t755 = icmp ne i64 %t754, 0
  br i1 %t755, label %body15, label %endloop15
body15:
  %t756 = call i64 @f64_parse(ptr @.str.exp_balance_residual.155)
  %t757 = load i64, ptr %local.lx.519
  %t758 = call i64 @f64_parse(ptr @.str.exp_balance_residual.156)
  %t759 = call i64 @"sx_f64_sub"(i64 %t757, i64 %t758)
  %t760 = call i64 @"sx_f64_mul"(i64 %t756, i64 %t759)
  %t761 = call i64 @f64_parse(ptr @.str.exp_balance_residual.157)
  %t762 = load i64, ptr %local.lx.519
  %t763 = call i64 @f64_parse(ptr @.str.exp_balance_residual.158)
  %t764 = call i64 @"sx_f64_add"(i64 %t762, i64 %t763)
  %t765 = call i64 @"sx_f64_mul"(i64 %t761, i64 %t764)
  %t766 = call i64 @"sx_f64_add"(i64 %t760, i64 %t765)
  %t767 = call i64 @f64_parse(ptr @.str.exp_balance_residual.159)
  %t768 = load i64, ptr %local.lx.519
  %t769 = call i64 @f64_parse(ptr @.str.exp_balance_residual.160)
  %t770 = call i64 @"sx_f64_sub"(i64 %t768, i64 %t769)
  %t771 = call i64 @"sx_f64_mul"(i64 %t767, i64 %t770)
  %t772 = call i64 @"sx_f64_add"(i64 %t766, i64 %t771)
  store i64 %t772, ptr %local.gx.521
  %t773 = call i64 @f64_parse(ptr @.str.exp_balance_residual.161)
  %t774 = load i64, ptr %local.ly.520
  %t775 = call i64 @f64_parse(ptr @.str.exp_balance_residual.162)
  %t776 = call i64 @"sx_f64_sub"(i64 %t774, i64 %t775)
  %t777 = call i64 @"sx_f64_mul"(i64 %t773, i64 %t776)
  %t778 = call i64 @f64_parse(ptr @.str.exp_balance_residual.163)
  %t779 = load i64, ptr %local.ly.520
  %t780 = call i64 @f64_parse(ptr @.str.exp_balance_residual.164)
  %t781 = call i64 @"sx_f64_sub"(i64 %t779, i64 %t780)
  %t782 = call i64 @"sx_f64_mul"(i64 %t778, i64 %t781)
  %t783 = call i64 @"sx_f64_add"(i64 %t777, i64 %t782)
  %t784 = call i64 @f64_parse(ptr @.str.exp_balance_residual.165)
  %t785 = load i64, ptr %local.ly.520
  %t786 = call i64 @f64_parse(ptr @.str.exp_balance_residual.166)
  %t787 = call i64 @"sx_f64_add"(i64 %t785, i64 %t786)
  %t788 = call i64 @"sx_f64_mul"(i64 %t784, i64 %t787)
  %t789 = call i64 @"sx_f64_add"(i64 %t783, i64 %t788)
  store i64 %t789, ptr %local.gy.522
  %t790 = load i64, ptr %local.lx.519
  %t791 = call i64 @f64_parse(ptr @.str.exp_balance_residual.167)
  %t792 = load i64, ptr %local.gx.521
  %t793 = call i64 @"sx_f64_mul"(i64 %t791, i64 %t792)
  %t794 = call i64 @f64_parse(ptr @.str.exp_balance_residual.168)
  %t795 = call i64 @"sx_f64_div"(i64 %t793, i64 %t794)
  %t796 = call i64 @"sx_f64_sub"(i64 %t790, i64 %t795)
  store i64 %t796, ptr %local.lx.519
  %t797 = load i64, ptr %local.ly.520
  %t798 = call i64 @f64_parse(ptr @.str.exp_balance_residual.169)
  %t799 = load i64, ptr %local.gy.522
  %t800 = call i64 @"sx_f64_mul"(i64 %t798, i64 %t799)
  %t801 = call i64 @f64_parse(ptr @.str.exp_balance_residual.170)
  %t802 = call i64 @"sx_f64_div"(i64 %t800, i64 %t801)
  %t803 = call i64 @"sx_f64_sub"(i64 %t797, i64 %t802)
  store i64 %t803, ptr %local.ly.520
  %t804 = load i64, ptr %local.step.516
  %t805 = add i64 %t804, 1
  store i64 %t805, ptr %local.step.516
  br label %loop15
endloop15:
  %t806 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.171)
  %t807 = ptrtoint ptr %t806 to i64
  %t808 = inttoptr i64 %t807 to ptr
  call void @intrinsic_print(ptr %t808)
  %t809 = load i64, ptr %local.lx.519
  %t810 = call i64 @"print_f64"(i64 %t809)
  %t811 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.172)
  %t812 = ptrtoint ptr %t811 to i64
  %t813 = inttoptr i64 %t812 to ptr
  call void @intrinsic_print(ptr %t813)
  %t814 = load i64, ptr %local.ly.520
  %t815 = call i64 @"print_f64"(i64 %t814)
  %t816 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.173)
  %t817 = ptrtoint ptr %t816 to i64
  %t818 = inttoptr i64 %t817 to ptr
  call void @intrinsic_println(ptr %t818)
  %t819 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.174)
  %t820 = ptrtoint ptr %t819 to i64
  %t821 = inttoptr i64 %t820 to ptr
  call void @intrinsic_println(ptr %t821)
  %t822 = load i64, ptr %local.bx.514
  %t823 = call i64 @f64_parse(ptr @.str.exp_balance_residual.175)
  %t824 = call i64 @"sx_f64_sub"(i64 %t822, i64 %t823)
  %t825 = load i64, ptr %local.bx.514
  %t826 = call i64 @f64_parse(ptr @.str.exp_balance_residual.176)
  %t827 = call i64 @"sx_f64_sub"(i64 %t825, i64 %t826)
  %t828 = call i64 @"sx_f64_mul"(i64 %t824, i64 %t827)
  %t829 = load i64, ptr %local.by.515
  %t830 = call i64 @f64_parse(ptr @.str.exp_balance_residual.177)
  %t831 = call i64 @"sx_f64_sub"(i64 %t829, i64 %t830)
  %t832 = load i64, ptr %local.by.515
  %t833 = call i64 @f64_parse(ptr @.str.exp_balance_residual.178)
  %t834 = call i64 @"sx_f64_sub"(i64 %t832, i64 %t833)
  %t835 = call i64 @"sx_f64_mul"(i64 %t831, i64 %t834)
  %t836 = call i64 @"sx_f64_add"(i64 %t828, i64 %t835)
  %t837 = call i64 @"sqrt_f64"(i64 %t836)
  store i64 %t837, ptr %local.d_b.523
  %t838 = load i64, ptr %local.lx.519
  %t839 = call i64 @f64_parse(ptr @.str.exp_balance_residual.179)
  %t840 = call i64 @"sx_f64_sub"(i64 %t838, i64 %t839)
  %t841 = load i64, ptr %local.lx.519
  %t842 = call i64 @f64_parse(ptr @.str.exp_balance_residual.180)
  %t843 = call i64 @"sx_f64_sub"(i64 %t841, i64 %t842)
  %t844 = call i64 @"sx_f64_mul"(i64 %t840, i64 %t843)
  %t845 = load i64, ptr %local.ly.520
  %t846 = call i64 @f64_parse(ptr @.str.exp_balance_residual.181)
  %t847 = call i64 @"sx_f64_sub"(i64 %t845, i64 %t846)
  %t848 = load i64, ptr %local.ly.520
  %t849 = call i64 @f64_parse(ptr @.str.exp_balance_residual.182)
  %t850 = call i64 @"sx_f64_sub"(i64 %t848, i64 %t849)
  %t851 = call i64 @"sx_f64_mul"(i64 %t847, i64 %t850)
  %t852 = call i64 @"sx_f64_add"(i64 %t844, i64 %t851)
  %t853 = call i64 @"sqrt_f64"(i64 %t852)
  store i64 %t853, ptr %local.d_l.524
  %t854 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.183)
  %t855 = ptrtoint ptr %t854 to i64
  %t856 = inttoptr i64 %t855 to ptr
  call void @intrinsic_print(ptr %t856)
  %t857 = load i64, ptr %local.d_b.523
  %t858 = call i64 @"print_f64"(i64 %t857)
  %t859 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.184)
  %t860 = ptrtoint ptr %t859 to i64
  %t861 = inttoptr i64 %t860 to ptr
  call void @intrinsic_println(ptr %t861)
  %t862 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.185)
  %t863 = ptrtoint ptr %t862 to i64
  %t864 = inttoptr i64 %t863 to ptr
  call void @intrinsic_print(ptr %t864)
  %t865 = load i64, ptr %local.d_l.524
  %t866 = call i64 @"print_f64"(i64 %t865)
  %t867 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.186)
  %t868 = ptrtoint ptr %t867 to i64
  %t869 = inttoptr i64 %t868 to ptr
  call void @intrinsic_println(ptr %t869)
  %t870 = load i64, ptr %local.d_b.523
  %t871 = call i64 @f64_parse(ptr @.str.exp_balance_residual.187)
  %t872 = call i64 @"sx_f64_lt"(i64 %t870, i64 %t871)
  %t873 = icmp ne i64 %t872, 0
  br i1 %t873, label %then16, label %else16
then16:
  %t874 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.188)
  %t875 = ptrtoint ptr %t874 to i64
  %t876 = inttoptr i64 %t875 to ptr
  call void @intrinsic_println(ptr %t876)
  br label %then16_end
then16_end:
  br label %endif16
else16:
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t877 = phi i64 [ 0, %then16_end ], [ 0, %else16_end ]
  %t878 = load i64, ptr %local.d_b.523
  %t879 = load i64, ptr %local.d_l.524
  %t880 = call i64 @"sx_f64_lt"(i64 %t878, i64 %t879)
  %t881 = icmp ne i64 %t880, 0
  br i1 %t881, label %then17, label %else17
then17:
  %t882 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.189)
  %t883 = ptrtoint ptr %t882 to i64
  %t884 = inttoptr i64 %t883 to ptr
  call void @intrinsic_println(ptr %t884)
  br label %then17_end
then17_end:
  br label %endif17
else17:
  br label %else17_end
else17_end:
  br label %endif17
endif17:
  %t885 = phi i64 [ 0, %then17_end ], [ 0, %else17_end ]
  %t886 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.190)
  %t887 = ptrtoint ptr %t886 to i64
  %t888 = inttoptr i64 %t887 to ptr
  call void @intrinsic_println(ptr %t888)
  ret i64 0
}

define i64 @"rast_grad"(i64 %x, i64 %target) nounwind {
entry:
  %local.pi.889 = alloca i64
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %local.target = alloca i64
  store i64 %target, ptr %local.target
  %t890 = call i64 @f64_parse(ptr @.str.exp_balance_residual.191)
  store i64 %t890, ptr %local.pi.889
  %t891 = call i64 @f64_parse(ptr @.str.exp_balance_residual.192)
  %t892 = load i64, ptr %local.x
  %t893 = load i64, ptr %local.target
  %t894 = call i64 @"sx_f64_sub"(i64 %t892, i64 %t893)
  %t895 = call i64 @"sx_f64_mul"(i64 %t891, i64 %t894)
  %t896 = call i64 @f64_parse(ptr @.str.exp_balance_residual.193)
  %t897 = load i64, ptr %local.pi.889
  %t898 = call i64 @"sx_f64_mul"(i64 %t896, i64 %t897)
  %t899 = call i64 @f64_parse(ptr @.str.exp_balance_residual.194)
  %t900 = load i64, ptr %local.pi.889
  %t901 = call i64 @"sx_f64_mul"(i64 %t899, i64 %t900)
  %t902 = load i64, ptr %local.x
  %t903 = load i64, ptr %local.target
  %t904 = call i64 @"sx_f64_sub"(i64 %t902, i64 %t903)
  %t905 = call i64 @"sx_f64_mul"(i64 %t901, i64 %t904)
  %t906 = call i64 @"sin_f64"(i64 %t905)
  %t907 = call i64 @"sx_f64_mul"(i64 %t898, i64 %t906)
  %t908 = call i64 @"sx_f64_add"(i64 %t895, i64 %t907)
  ret i64 %t908
}

define i64 @"balance_rast"(i64 %x, i64 %y) nounwind {
entry:
  %local.g1x.909 = alloca i64
  %local.g1y.910 = alloca i64
  %local.g2x.911 = alloca i64
  %local.g2y.912 = alloca i64
  %local.g3x.913 = alloca i64
  %local.g3y.914 = alloca i64
  %local.sx.915 = alloca i64
  %local.sy.916 = alloca i64
  %local.sum_g_sq.917 = alloca i64
  %local.ind_sq.918 = alloca i64
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %local.y = alloca i64
  store i64 %y, ptr %local.y
  %t919 = load i64, ptr %local.x
  %t920 = call i64 @f64_parse(ptr @.str.exp_balance_residual.195)
  %t921 = call i64 @"rast_grad"(i64 %t919, i64 %t920)
  store i64 %t921, ptr %local.g1x.909
  %t922 = load i64, ptr %local.y
  %t923 = call i64 @f64_parse(ptr @.str.exp_balance_residual.196)
  %t924 = call i64 @"rast_grad"(i64 %t922, i64 %t923)
  store i64 %t924, ptr %local.g1y.910
  %t925 = load i64, ptr %local.x
  %t926 = call i64 @f64_parse(ptr @.str.exp_balance_residual.197)
  %t927 = xor i64 %t926, -9223372036854775808
  %t928 = call i64 @"rast_grad"(i64 %t925, i64 %t927)
  store i64 %t928, ptr %local.g2x.911
  %t929 = load i64, ptr %local.y
  %t930 = call i64 @f64_parse(ptr @.str.exp_balance_residual.198)
  %t931 = call i64 @"rast_grad"(i64 %t929, i64 %t930)
  store i64 %t931, ptr %local.g2y.912
  %t932 = load i64, ptr %local.x
  %t933 = call i64 @f64_parse(ptr @.str.exp_balance_residual.199)
  %t934 = call i64 @"rast_grad"(i64 %t932, i64 %t933)
  store i64 %t934, ptr %local.g3x.913
  %t935 = load i64, ptr %local.y
  %t936 = call i64 @f64_parse(ptr @.str.exp_balance_residual.200)
  %t937 = xor i64 %t936, -9223372036854775808
  %t938 = call i64 @"rast_grad"(i64 %t935, i64 %t937)
  store i64 %t938, ptr %local.g3y.914
  %t939 = load i64, ptr %local.g1x.909
  %t940 = load i64, ptr %local.g2x.911
  %t941 = call i64 @"sx_f64_add"(i64 %t939, i64 %t940)
  %t942 = load i64, ptr %local.g3x.913
  %t943 = call i64 @"sx_f64_add"(i64 %t941, i64 %t942)
  store i64 %t943, ptr %local.sx.915
  %t944 = load i64, ptr %local.g1y.910
  %t945 = load i64, ptr %local.g2y.912
  %t946 = call i64 @"sx_f64_add"(i64 %t944, i64 %t945)
  %t947 = load i64, ptr %local.g3y.914
  %t948 = call i64 @"sx_f64_add"(i64 %t946, i64 %t947)
  store i64 %t948, ptr %local.sy.916
  %t949 = load i64, ptr %local.sx.915
  %t950 = load i64, ptr %local.sx.915
  %t951 = call i64 @"sx_f64_mul"(i64 %t949, i64 %t950)
  %t952 = load i64, ptr %local.sy.916
  %t953 = load i64, ptr %local.sy.916
  %t954 = call i64 @"sx_f64_mul"(i64 %t952, i64 %t953)
  %t955 = call i64 @"sx_f64_add"(i64 %t951, i64 %t954)
  store i64 %t955, ptr %local.sum_g_sq.917
  %t956 = load i64, ptr %local.g1x.909
  %t957 = load i64, ptr %local.g1x.909
  %t958 = call i64 @"sx_f64_mul"(i64 %t956, i64 %t957)
  %t959 = load i64, ptr %local.g1y.910
  %t960 = load i64, ptr %local.g1y.910
  %t961 = call i64 @"sx_f64_mul"(i64 %t959, i64 %t960)
  %t962 = call i64 @"sx_f64_add"(i64 %t958, i64 %t961)
  %t963 = load i64, ptr %local.g2x.911
  %t964 = load i64, ptr %local.g2x.911
  %t965 = call i64 @"sx_f64_mul"(i64 %t963, i64 %t964)
  %t966 = call i64 @"sx_f64_add"(i64 %t962, i64 %t965)
  %t967 = load i64, ptr %local.g2y.912
  %t968 = load i64, ptr %local.g2y.912
  %t969 = call i64 @"sx_f64_mul"(i64 %t967, i64 %t968)
  %t970 = call i64 @"sx_f64_add"(i64 %t966, i64 %t969)
  %t971 = load i64, ptr %local.g3x.913
  %t972 = load i64, ptr %local.g3x.913
  %t973 = call i64 @"sx_f64_mul"(i64 %t971, i64 %t972)
  %t974 = call i64 @"sx_f64_add"(i64 %t970, i64 %t973)
  %t975 = load i64, ptr %local.g3y.914
  %t976 = load i64, ptr %local.g3y.914
  %t977 = call i64 @"sx_f64_mul"(i64 %t975, i64 %t976)
  %t978 = call i64 @"sx_f64_add"(i64 %t974, i64 %t977)
  store i64 %t978, ptr %local.ind_sq.918
  %t979 = load i64, ptr %local.ind_sq.918
  %t980 = call i64 @f64_parse(ptr @.str.exp_balance_residual.201)
  %t981 = call i64 @"sx_f64_lt"(i64 %t979, i64 %t980)
  %t982 = icmp ne i64 %t981, 0
  br i1 %t982, label %then18, label %else18
then18:
  %t983 = call i64 @f64_parse(ptr @.str.exp_balance_residual.202)
  ret i64 %t983
else18:
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t984 = phi i64 [ 0, %else18_end ]
  %t985 = load i64, ptr %local.sum_g_sq.917
  %t986 = load i64, ptr %local.ind_sq.918
  %t987 = call i64 @"sx_f64_div"(i64 %t985, i64 %t986)
  ret i64 %t987
}

define i64 @"dBr_dx"(i64 %x, i64 %y) nounwind {
entry:
  %local.h.988 = alloca i64
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %local.y = alloca i64
  store i64 %y, ptr %local.y
  %t989 = call i64 @f64_parse(ptr @.str.exp_balance_residual.203)
  store i64 %t989, ptr %local.h.988
  %t990 = load i64, ptr %local.x
  %t991 = load i64, ptr %local.h.988
  %t992 = call i64 @"sx_f64_add"(i64 %t990, i64 %t991)
  %t993 = load i64, ptr %local.y
  %t994 = call i64 @"balance_rast"(i64 %t992, i64 %t993)
  %t995 = load i64, ptr %local.x
  %t996 = load i64, ptr %local.h.988
  %t997 = call i64 @"sx_f64_sub"(i64 %t995, i64 %t996)
  %t998 = load i64, ptr %local.y
  %t999 = call i64 @"balance_rast"(i64 %t997, i64 %t998)
  %t1000 = call i64 @"sx_f64_sub"(i64 %t994, i64 %t999)
  %t1001 = call i64 @f64_parse(ptr @.str.exp_balance_residual.204)
  %t1002 = load i64, ptr %local.h.988
  %t1003 = call i64 @"sx_f64_mul"(i64 %t1001, i64 %t1002)
  %t1004 = call i64 @"sx_f64_div"(i64 %t1000, i64 %t1003)
  ret i64 %t1004
}

define i64 @"dBr_dy"(i64 %x, i64 %y) nounwind {
entry:
  %local.h.1005 = alloca i64
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %local.y = alloca i64
  store i64 %y, ptr %local.y
  %t1006 = call i64 @f64_parse(ptr @.str.exp_balance_residual.205)
  store i64 %t1006, ptr %local.h.1005
  %t1007 = load i64, ptr %local.x
  %t1008 = load i64, ptr %local.y
  %t1009 = load i64, ptr %local.h.1005
  %t1010 = call i64 @"sx_f64_add"(i64 %t1008, i64 %t1009)
  %t1011 = call i64 @"balance_rast"(i64 %t1007, i64 %t1010)
  %t1012 = load i64, ptr %local.x
  %t1013 = load i64, ptr %local.y
  %t1014 = load i64, ptr %local.h.1005
  %t1015 = call i64 @"sx_f64_sub"(i64 %t1013, i64 %t1014)
  %t1016 = call i64 @"balance_rast"(i64 %t1012, i64 %t1015)
  %t1017 = call i64 @"sx_f64_sub"(i64 %t1011, i64 %t1016)
  %t1018 = call i64 @f64_parse(ptr @.str.exp_balance_residual.206)
  %t1019 = load i64, ptr %local.h.1005
  %t1020 = call i64 @"sx_f64_mul"(i64 %t1018, i64 %t1019)
  %t1021 = call i64 @"sx_f64_div"(i64 %t1017, i64 %t1020)
  ret i64 %t1021
}

define i64 @"rast_loss"(i64 %x, i64 %y) nounwind {
entry:
  %local.pi.1022 = alloca i64
  %local.l1.1023 = alloca i64
  %local.l2.1024 = alloca i64
  %local.l3.1025 = alloca i64
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %local.y = alloca i64
  store i64 %y, ptr %local.y
  %t1026 = call i64 @f64_parse(ptr @.str.exp_balance_residual.207)
  store i64 %t1026, ptr %local.pi.1022
  %t1027 = load i64, ptr %local.x
  %t1028 = call i64 @f64_parse(ptr @.str.exp_balance_residual.208)
  %t1029 = call i64 @"sx_f64_sub"(i64 %t1027, i64 %t1028)
  %t1030 = load i64, ptr %local.x
  %t1031 = call i64 @f64_parse(ptr @.str.exp_balance_residual.209)
  %t1032 = call i64 @"sx_f64_sub"(i64 %t1030, i64 %t1031)
  %t1033 = call i64 @"sx_f64_mul"(i64 %t1029, i64 %t1032)
  %t1034 = load i64, ptr %local.y
  %t1035 = call i64 @f64_parse(ptr @.str.exp_balance_residual.210)
  %t1036 = call i64 @"sx_f64_sub"(i64 %t1034, i64 %t1035)
  %t1037 = load i64, ptr %local.y
  %t1038 = call i64 @f64_parse(ptr @.str.exp_balance_residual.211)
  %t1039 = call i64 @"sx_f64_sub"(i64 %t1037, i64 %t1038)
  %t1040 = call i64 @"sx_f64_mul"(i64 %t1036, i64 %t1039)
  %t1041 = call i64 @"sx_f64_add"(i64 %t1033, i64 %t1040)
  %t1042 = call i64 @f64_parse(ptr @.str.exp_balance_residual.212)
  %t1043 = call i64 @f64_parse(ptr @.str.exp_balance_residual.213)
  %t1044 = call i64 @f64_parse(ptr @.str.exp_balance_residual.214)
  %t1045 = load i64, ptr %local.pi.1022
  %t1046 = call i64 @"sx_f64_mul"(i64 %t1044, i64 %t1045)
  %t1047 = load i64, ptr %local.x
  %t1048 = call i64 @f64_parse(ptr @.str.exp_balance_residual.215)
  %t1049 = call i64 @"sx_f64_sub"(i64 %t1047, i64 %t1048)
  %t1050 = call i64 @"sx_f64_mul"(i64 %t1046, i64 %t1049)
  %t1051 = call i64 @"cos_f64"(i64 %t1050)
  %t1052 = call i64 @"sx_f64_sub"(i64 %t1043, i64 %t1051)
  %t1053 = call i64 @"sx_f64_mul"(i64 %t1042, i64 %t1052)
  %t1054 = call i64 @"sx_f64_add"(i64 %t1041, i64 %t1053)
  %t1055 = call i64 @f64_parse(ptr @.str.exp_balance_residual.216)
  %t1056 = call i64 @f64_parse(ptr @.str.exp_balance_residual.217)
  %t1057 = call i64 @f64_parse(ptr @.str.exp_balance_residual.218)
  %t1058 = load i64, ptr %local.pi.1022
  %t1059 = call i64 @"sx_f64_mul"(i64 %t1057, i64 %t1058)
  %t1060 = load i64, ptr %local.y
  %t1061 = call i64 @f64_parse(ptr @.str.exp_balance_residual.219)
  %t1062 = call i64 @"sx_f64_sub"(i64 %t1060, i64 %t1061)
  %t1063 = call i64 @"sx_f64_mul"(i64 %t1059, i64 %t1062)
  %t1064 = call i64 @"cos_f64"(i64 %t1063)
  %t1065 = call i64 @"sx_f64_sub"(i64 %t1056, i64 %t1064)
  %t1066 = call i64 @"sx_f64_mul"(i64 %t1055, i64 %t1065)
  %t1067 = call i64 @"sx_f64_add"(i64 %t1054, i64 %t1066)
  store i64 %t1067, ptr %local.l1.1023
  %t1068 = load i64, ptr %local.x
  %t1069 = call i64 @f64_parse(ptr @.str.exp_balance_residual.220)
  %t1070 = call i64 @"sx_f64_add"(i64 %t1068, i64 %t1069)
  %t1071 = load i64, ptr %local.x
  %t1072 = call i64 @f64_parse(ptr @.str.exp_balance_residual.221)
  %t1073 = call i64 @"sx_f64_add"(i64 %t1071, i64 %t1072)
  %t1074 = call i64 @"sx_f64_mul"(i64 %t1070, i64 %t1073)
  %t1075 = load i64, ptr %local.y
  %t1076 = call i64 @f64_parse(ptr @.str.exp_balance_residual.222)
  %t1077 = call i64 @"sx_f64_sub"(i64 %t1075, i64 %t1076)
  %t1078 = load i64, ptr %local.y
  %t1079 = call i64 @f64_parse(ptr @.str.exp_balance_residual.223)
  %t1080 = call i64 @"sx_f64_sub"(i64 %t1078, i64 %t1079)
  %t1081 = call i64 @"sx_f64_mul"(i64 %t1077, i64 %t1080)
  %t1082 = call i64 @"sx_f64_add"(i64 %t1074, i64 %t1081)
  %t1083 = call i64 @f64_parse(ptr @.str.exp_balance_residual.224)
  %t1084 = call i64 @f64_parse(ptr @.str.exp_balance_residual.225)
  %t1085 = call i64 @f64_parse(ptr @.str.exp_balance_residual.226)
  %t1086 = load i64, ptr %local.pi.1022
  %t1087 = call i64 @"sx_f64_mul"(i64 %t1085, i64 %t1086)
  %t1088 = load i64, ptr %local.x
  %t1089 = call i64 @f64_parse(ptr @.str.exp_balance_residual.227)
  %t1090 = call i64 @"sx_f64_add"(i64 %t1088, i64 %t1089)
  %t1091 = call i64 @"sx_f64_mul"(i64 %t1087, i64 %t1090)
  %t1092 = call i64 @"cos_f64"(i64 %t1091)
  %t1093 = call i64 @"sx_f64_sub"(i64 %t1084, i64 %t1092)
  %t1094 = call i64 @"sx_f64_mul"(i64 %t1083, i64 %t1093)
  %t1095 = call i64 @"sx_f64_add"(i64 %t1082, i64 %t1094)
  %t1096 = call i64 @f64_parse(ptr @.str.exp_balance_residual.228)
  %t1097 = call i64 @f64_parse(ptr @.str.exp_balance_residual.229)
  %t1098 = call i64 @f64_parse(ptr @.str.exp_balance_residual.230)
  %t1099 = load i64, ptr %local.pi.1022
  %t1100 = call i64 @"sx_f64_mul"(i64 %t1098, i64 %t1099)
  %t1101 = load i64, ptr %local.y
  %t1102 = call i64 @f64_parse(ptr @.str.exp_balance_residual.231)
  %t1103 = call i64 @"sx_f64_sub"(i64 %t1101, i64 %t1102)
  %t1104 = call i64 @"sx_f64_mul"(i64 %t1100, i64 %t1103)
  %t1105 = call i64 @"cos_f64"(i64 %t1104)
  %t1106 = call i64 @"sx_f64_sub"(i64 %t1097, i64 %t1105)
  %t1107 = call i64 @"sx_f64_mul"(i64 %t1096, i64 %t1106)
  %t1108 = call i64 @"sx_f64_add"(i64 %t1095, i64 %t1107)
  store i64 %t1108, ptr %local.l2.1024
  %t1109 = load i64, ptr %local.x
  %t1110 = load i64, ptr %local.x
  %t1111 = call i64 @"sx_f64_mul"(i64 %t1109, i64 %t1110)
  %t1112 = load i64, ptr %local.y
  %t1113 = call i64 @f64_parse(ptr @.str.exp_balance_residual.232)
  %t1114 = call i64 @"sx_f64_add"(i64 %t1112, i64 %t1113)
  %t1115 = load i64, ptr %local.y
  %t1116 = call i64 @f64_parse(ptr @.str.exp_balance_residual.233)
  %t1117 = call i64 @"sx_f64_add"(i64 %t1115, i64 %t1116)
  %t1118 = call i64 @"sx_f64_mul"(i64 %t1114, i64 %t1117)
  %t1119 = call i64 @"sx_f64_add"(i64 %t1111, i64 %t1118)
  %t1120 = call i64 @f64_parse(ptr @.str.exp_balance_residual.234)
  %t1121 = call i64 @f64_parse(ptr @.str.exp_balance_residual.235)
  %t1122 = call i64 @f64_parse(ptr @.str.exp_balance_residual.236)
  %t1123 = load i64, ptr %local.pi.1022
  %t1124 = call i64 @"sx_f64_mul"(i64 %t1122, i64 %t1123)
  %t1125 = load i64, ptr %local.x
  %t1126 = call i64 @"sx_f64_mul"(i64 %t1124, i64 %t1125)
  %t1127 = call i64 @"cos_f64"(i64 %t1126)
  %t1128 = call i64 @"sx_f64_sub"(i64 %t1121, i64 %t1127)
  %t1129 = call i64 @"sx_f64_mul"(i64 %t1120, i64 %t1128)
  %t1130 = call i64 @"sx_f64_add"(i64 %t1119, i64 %t1129)
  %t1131 = call i64 @f64_parse(ptr @.str.exp_balance_residual.237)
  %t1132 = call i64 @f64_parse(ptr @.str.exp_balance_residual.238)
  %t1133 = call i64 @f64_parse(ptr @.str.exp_balance_residual.239)
  %t1134 = load i64, ptr %local.pi.1022
  %t1135 = call i64 @"sx_f64_mul"(i64 %t1133, i64 %t1134)
  %t1136 = load i64, ptr %local.y
  %t1137 = call i64 @f64_parse(ptr @.str.exp_balance_residual.240)
  %t1138 = call i64 @"sx_f64_add"(i64 %t1136, i64 %t1137)
  %t1139 = call i64 @"sx_f64_mul"(i64 %t1135, i64 %t1138)
  %t1140 = call i64 @"cos_f64"(i64 %t1139)
  %t1141 = call i64 @"sx_f64_sub"(i64 %t1132, i64 %t1140)
  %t1142 = call i64 @"sx_f64_mul"(i64 %t1131, i64 %t1141)
  %t1143 = call i64 @"sx_f64_add"(i64 %t1130, i64 %t1142)
  store i64 %t1143, ptr %local.l3.1025
  %t1144 = load i64, ptr %local.l1.1023
  %t1145 = load i64, ptr %local.l2.1024
  %t1146 = call i64 @"sx_f64_add"(i64 %t1144, i64 %t1145)
  %t1147 = load i64, ptr %local.l3.1025
  %t1148 = call i64 @"sx_f64_add"(i64 %t1146, i64 %t1147)
  ret i64 %t1148
}

define i64 @"test_nonconvex"() nounwind {
entry:
  %local.bx.1149 = alloca i64
  %local.by.1150 = alloca i64
  %local.step.1151 = alloca i64
  %local.dx.1152 = alloca i64
  %local.dy.1153 = alloca i64
  %local.b_loss.1154 = alloca i64
  %local.lx.1155 = alloca i64
  %local.ly.1156 = alloca i64
  %local.gx.1157 = alloca i64
  %local.gy.1158 = alloca i64
  %local.l_loss.1159 = alloca i64
  %t1160 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.241)
  %t1161 = ptrtoint ptr %t1160 to i64
  %t1162 = inttoptr i64 %t1161 to ptr
  call void @intrinsic_println(ptr %t1162)
  %t1163 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.242)
  %t1164 = ptrtoint ptr %t1163 to i64
  %t1165 = inttoptr i64 %t1164 to ptr
  call void @intrinsic_println(ptr %t1165)
  %t1166 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.243)
  %t1167 = ptrtoint ptr %t1166 to i64
  %t1168 = inttoptr i64 %t1167 to ptr
  call void @intrinsic_println(ptr %t1168)
  %t1169 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.244)
  %t1170 = ptrtoint ptr %t1169 to i64
  %t1171 = inttoptr i64 %t1170 to ptr
  call void @intrinsic_println(ptr %t1171)
  %t1172 = call i64 @f64_parse(ptr @.str.exp_balance_residual.245)
  store i64 %t1172, ptr %local.bx.1149
  %t1173 = call i64 @f64_parse(ptr @.str.exp_balance_residual.246)
  store i64 %t1173, ptr %local.by.1150
  store i64 0, ptr %local.step.1151
  br label %loop19
loop19:
  %t1174 = load i64, ptr %local.step.1151
  %t1175 = icmp slt i64 %t1174, 1000
  %t1176 = zext i1 %t1175 to i64
  %t1177 = icmp ne i64 %t1176, 0
  br i1 %t1177, label %body19, label %endloop19
body19:
  %t1178 = load i64, ptr %local.bx.1149
  %t1179 = load i64, ptr %local.by.1150
  %t1180 = call i64 @"dBr_dx"(i64 %t1178, i64 %t1179)
  store i64 %t1180, ptr %local.dx.1152
  %t1181 = load i64, ptr %local.bx.1149
  %t1182 = load i64, ptr %local.by.1150
  %t1183 = call i64 @"dBr_dy"(i64 %t1181, i64 %t1182)
  store i64 %t1183, ptr %local.dy.1153
  %t1184 = load i64, ptr %local.bx.1149
  %t1185 = call i64 @f64_parse(ptr @.str.exp_balance_residual.247)
  %t1186 = load i64, ptr %local.dx.1152
  %t1187 = call i64 @"sx_f64_mul"(i64 %t1185, i64 %t1186)
  %t1188 = call i64 @"sx_f64_sub"(i64 %t1184, i64 %t1187)
  store i64 %t1188, ptr %local.bx.1149
  %t1189 = load i64, ptr %local.by.1150
  %t1190 = call i64 @f64_parse(ptr @.str.exp_balance_residual.248)
  %t1191 = load i64, ptr %local.dy.1153
  %t1192 = call i64 @"sx_f64_mul"(i64 %t1190, i64 %t1191)
  %t1193 = call i64 @"sx_f64_sub"(i64 %t1189, i64 %t1192)
  store i64 %t1193, ptr %local.by.1150
  %t1194 = load i64, ptr %local.step.1151
  %t1195 = add i64 %t1194, 1
  store i64 %t1195, ptr %local.step.1151
  br label %loop19
endloop19:
  %t1196 = load i64, ptr %local.bx.1149
  %t1197 = load i64, ptr %local.by.1150
  %t1198 = call i64 @"rast_loss"(i64 %t1196, i64 %t1197)
  store i64 %t1198, ptr %local.b_loss.1154
  %t1199 = call i64 @f64_parse(ptr @.str.exp_balance_residual.249)
  store i64 %t1199, ptr %local.lx.1155
  %t1200 = call i64 @f64_parse(ptr @.str.exp_balance_residual.250)
  store i64 %t1200, ptr %local.ly.1156
  store i64 0, ptr %local.step.1151
  br label %loop20
loop20:
  %t1201 = load i64, ptr %local.step.1151
  %t1202 = icmp slt i64 %t1201, 1000
  %t1203 = zext i1 %t1202 to i64
  %t1204 = icmp ne i64 %t1203, 0
  br i1 %t1204, label %body20, label %endloop20
body20:
  %t1205 = load i64, ptr %local.lx.1155
  %t1206 = call i64 @f64_parse(ptr @.str.exp_balance_residual.251)
  %t1207 = call i64 @"rast_grad"(i64 %t1205, i64 %t1206)
  %t1208 = load i64, ptr %local.lx.1155
  %t1209 = call i64 @f64_parse(ptr @.str.exp_balance_residual.252)
  %t1210 = xor i64 %t1209, -9223372036854775808
  %t1211 = call i64 @"rast_grad"(i64 %t1208, i64 %t1210)
  %t1212 = call i64 @"sx_f64_add"(i64 %t1207, i64 %t1211)
  %t1213 = load i64, ptr %local.lx.1155
  %t1214 = call i64 @f64_parse(ptr @.str.exp_balance_residual.253)
  %t1215 = call i64 @"rast_grad"(i64 %t1213, i64 %t1214)
  %t1216 = call i64 @"sx_f64_add"(i64 %t1212, i64 %t1215)
  store i64 %t1216, ptr %local.gx.1157
  %t1217 = load i64, ptr %local.ly.1156
  %t1218 = call i64 @f64_parse(ptr @.str.exp_balance_residual.254)
  %t1219 = call i64 @"rast_grad"(i64 %t1217, i64 %t1218)
  %t1220 = load i64, ptr %local.ly.1156
  %t1221 = call i64 @f64_parse(ptr @.str.exp_balance_residual.255)
  %t1222 = call i64 @"rast_grad"(i64 %t1220, i64 %t1221)
  %t1223 = call i64 @"sx_f64_add"(i64 %t1219, i64 %t1222)
  %t1224 = load i64, ptr %local.ly.1156
  %t1225 = call i64 @f64_parse(ptr @.str.exp_balance_residual.256)
  %t1226 = xor i64 %t1225, -9223372036854775808
  %t1227 = call i64 @"rast_grad"(i64 %t1224, i64 %t1226)
  %t1228 = call i64 @"sx_f64_add"(i64 %t1223, i64 %t1227)
  store i64 %t1228, ptr %local.gy.1158
  %t1229 = load i64, ptr %local.lx.1155
  %t1230 = call i64 @f64_parse(ptr @.str.exp_balance_residual.257)
  %t1231 = load i64, ptr %local.gx.1157
  %t1232 = call i64 @"sx_f64_mul"(i64 %t1230, i64 %t1231)
  %t1233 = call i64 @f64_parse(ptr @.str.exp_balance_residual.258)
  %t1234 = call i64 @"sx_f64_div"(i64 %t1232, i64 %t1233)
  %t1235 = call i64 @"sx_f64_sub"(i64 %t1229, i64 %t1234)
  store i64 %t1235, ptr %local.lx.1155
  %t1236 = load i64, ptr %local.ly.1156
  %t1237 = call i64 @f64_parse(ptr @.str.exp_balance_residual.259)
  %t1238 = load i64, ptr %local.gy.1158
  %t1239 = call i64 @"sx_f64_mul"(i64 %t1237, i64 %t1238)
  %t1240 = call i64 @f64_parse(ptr @.str.exp_balance_residual.260)
  %t1241 = call i64 @"sx_f64_div"(i64 %t1239, i64 %t1240)
  %t1242 = call i64 @"sx_f64_sub"(i64 %t1236, i64 %t1241)
  store i64 %t1242, ptr %local.ly.1156
  %t1243 = load i64, ptr %local.step.1151
  %t1244 = add i64 %t1243, 1
  store i64 %t1244, ptr %local.step.1151
  br label %loop20
endloop20:
  %t1245 = load i64, ptr %local.lx.1155
  %t1246 = load i64, ptr %local.ly.1156
  %t1247 = call i64 @"rast_loss"(i64 %t1245, i64 %t1246)
  store i64 %t1247, ptr %local.l_loss.1159
  %t1248 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.261)
  %t1249 = ptrtoint ptr %t1248 to i64
  %t1250 = inttoptr i64 %t1249 to ptr
  call void @intrinsic_print(ptr %t1250)
  %t1251 = load i64, ptr %local.bx.1149
  %t1252 = call i64 @"print_f64"(i64 %t1251)
  %t1253 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.262)
  %t1254 = ptrtoint ptr %t1253 to i64
  %t1255 = inttoptr i64 %t1254 to ptr
  call void @intrinsic_print(ptr %t1255)
  %t1256 = load i64, ptr %local.by.1150
  %t1257 = call i64 @"print_f64"(i64 %t1256)
  %t1258 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.263)
  %t1259 = ptrtoint ptr %t1258 to i64
  %t1260 = inttoptr i64 %t1259 to ptr
  call void @intrinsic_print(ptr %t1260)
  %t1261 = load i64, ptr %local.b_loss.1154
  %t1262 = call i64 @"print_f64"(i64 %t1261)
  %t1263 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.264)
  %t1264 = ptrtoint ptr %t1263 to i64
  %t1265 = inttoptr i64 %t1264 to ptr
  call void @intrinsic_print(ptr %t1265)
  %t1266 = load i64, ptr %local.bx.1149
  %t1267 = load i64, ptr %local.by.1150
  %t1268 = call i64 @"balance_rast"(i64 %t1266, i64 %t1267)
  %t1269 = call i64 @"print_f64"(i64 %t1268)
  %t1270 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.265)
  %t1271 = ptrtoint ptr %t1270 to i64
  %t1272 = inttoptr i64 %t1271 to ptr
  call void @intrinsic_println(ptr %t1272)
  %t1273 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.266)
  %t1274 = ptrtoint ptr %t1273 to i64
  %t1275 = inttoptr i64 %t1274 to ptr
  call void @intrinsic_print(ptr %t1275)
  %t1276 = load i64, ptr %local.lx.1155
  %t1277 = call i64 @"print_f64"(i64 %t1276)
  %t1278 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.267)
  %t1279 = ptrtoint ptr %t1278 to i64
  %t1280 = inttoptr i64 %t1279 to ptr
  call void @intrinsic_print(ptr %t1280)
  %t1281 = load i64, ptr %local.ly.1156
  %t1282 = call i64 @"print_f64"(i64 %t1281)
  %t1283 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.268)
  %t1284 = ptrtoint ptr %t1283 to i64
  %t1285 = inttoptr i64 %t1284 to ptr
  call void @intrinsic_print(ptr %t1285)
  %t1286 = load i64, ptr %local.l_loss.1159
  %t1287 = call i64 @"print_f64"(i64 %t1286)
  %t1288 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.269)
  %t1289 = ptrtoint ptr %t1288 to i64
  %t1290 = inttoptr i64 %t1289 to ptr
  call void @intrinsic_print(ptr %t1290)
  %t1291 = load i64, ptr %local.lx.1155
  %t1292 = load i64, ptr %local.ly.1156
  %t1293 = call i64 @"balance_rast"(i64 %t1291, i64 %t1292)
  %t1294 = call i64 @"print_f64"(i64 %t1293)
  %t1295 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.270)
  %t1296 = ptrtoint ptr %t1295 to i64
  %t1297 = inttoptr i64 %t1296 to ptr
  call void @intrinsic_println(ptr %t1297)
  %t1298 = load i64, ptr %local.b_loss.1154
  %t1299 = load i64, ptr %local.l_loss.1159
  %t1300 = call i64 @"sx_f64_lt"(i64 %t1298, i64 %t1299)
  %t1301 = icmp ne i64 %t1300, 0
  br i1 %t1301, label %then21, label %else21
then21:
  %t1302 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.271)
  %t1303 = ptrtoint ptr %t1302 to i64
  %t1304 = inttoptr i64 %t1303 to ptr
  call void @intrinsic_println(ptr %t1304)
  %t1305 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.272)
  %t1306 = ptrtoint ptr %t1305 to i64
  %t1307 = inttoptr i64 %t1306 to ptr
  call void @intrinsic_println(ptr %t1307)
  %t1308 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.273)
  %t1309 = ptrtoint ptr %t1308 to i64
  %t1310 = inttoptr i64 %t1309 to ptr
  call void @intrinsic_println(ptr %t1310)
  br label %then21_end
then21_end:
  br label %endif21
else21:
  %t1311 = load i64, ptr %local.b_loss.1154
  %t1312 = load i64, ptr %local.l_loss.1159
  %t1313 = call i64 @"sx_f64_sub"(i64 %t1311, i64 %t1312)
  %t1314 = call i64 @"abs_f64"(i64 %t1313)
  %t1315 = call i64 @f64_parse(ptr @.str.exp_balance_residual.274)
  %t1316 = call i64 @"sx_f64_lt"(i64 %t1314, i64 %t1315)
  %t1317 = icmp ne i64 %t1316, 0
  br i1 %t1317, label %then22, label %else22
then22:
  %t1318 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.275)
  %t1319 = ptrtoint ptr %t1318 to i64
  %t1320 = inttoptr i64 %t1319 to ptr
  call void @intrinsic_println(ptr %t1320)
  br label %then22_end
then22_end:
  br label %endif22
else22:
  %t1321 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.276)
  %t1322 = ptrtoint ptr %t1321 to i64
  %t1323 = inttoptr i64 %t1322 to ptr
  call void @intrinsic_println(ptr %t1323)
  br label %else22_end
else22_end:
  br label %endif22
endif22:
  %t1324 = phi i64 [ 0, %then22_end ], [ 0, %else22_end ]
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t1325 = phi i64 [ 0, %then21_end ], [ %t1324, %else21_end ]
  %t1326 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.277)
  %t1327 = ptrtoint ptr %t1326 to i64
  %t1328 = inttoptr i64 %t1327 to ptr
  call void @intrinsic_println(ptr %t1328)
  ret i64 0
}

define i64 @"test_iratio_theorem"() nounwind {
entry:
  %local.ir2.1329 = alloca i64
  %local.ir3.1330 = alloca i64
  %local.ir_off.1331 = alloca i64
  %t1332 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.278)
  %t1333 = ptrtoint ptr %t1332 to i64
  %t1334 = inttoptr i64 %t1333 to ptr
  call void @intrinsic_println(ptr %t1334)
  %t1335 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.279)
  %t1336 = ptrtoint ptr %t1335 to i64
  %t1337 = inttoptr i64 %t1336 to ptr
  call void @intrinsic_println(ptr %t1337)
  %t1338 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.280)
  %t1339 = ptrtoint ptr %t1338 to i64
  %t1340 = inttoptr i64 %t1339 to ptr
  call void @intrinsic_println(ptr %t1340)
  %t1341 = call i64 @f64_parse(ptr @.str.exp_balance_residual.281)
  %t1342 = call i64 @"iratio_1d"(i64 %t1341)
  store i64 %t1342, ptr %local.ir2.1329
  %t1343 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.282)
  %t1344 = ptrtoint ptr %t1343 to i64
  %t1345 = inttoptr i64 %t1344 to ptr
  call void @intrinsic_print(ptr %t1345)
  %t1346 = load i64, ptr %local.ir2.1329
  %t1347 = call i64 @"print_f64"(i64 %t1346)
  %t1348 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.283)
  %t1349 = ptrtoint ptr %t1348 to i64
  %t1350 = inttoptr i64 %t1349 to ptr
  call void @intrinsic_println(ptr %t1350)
  %t1351 = call i64 @f64_parse(ptr @.str.exp_balance_residual.284)
  %t1352 = call i64 @f64_parse(ptr @.str.exp_balance_residual.285)
  %t1353 = call i64 @"iratio_2d"(i64 %t1351, i64 %t1352)
  store i64 %t1353, ptr %local.ir3.1330
  %t1354 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.286)
  %t1355 = ptrtoint ptr %t1354 to i64
  %t1356 = inttoptr i64 %t1355 to ptr
  call void @intrinsic_print(ptr %t1356)
  %t1357 = load i64, ptr %local.ir3.1330
  %t1358 = call i64 @"print_f64"(i64 %t1357)
  %t1359 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.287)
  %t1360 = ptrtoint ptr %t1359 to i64
  %t1361 = inttoptr i64 %t1360 to ptr
  call void @intrinsic_println(ptr %t1361)
  %t1362 = call i64 @f64_parse(ptr @.str.exp_balance_residual.288)
  %t1363 = call i64 @f64_parse(ptr @.str.exp_balance_residual.289)
  %t1364 = call i64 @"iratio_2d"(i64 %t1362, i64 %t1363)
  store i64 %t1364, ptr %local.ir_off.1331
  %t1365 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.290)
  %t1366 = ptrtoint ptr %t1365 to i64
  %t1367 = inttoptr i64 %t1366 to ptr
  call void @intrinsic_print(ptr %t1367)
  %t1368 = load i64, ptr %local.ir_off.1331
  %t1369 = call i64 @"print_f64"(i64 %t1368)
  %t1370 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.291)
  %t1371 = ptrtoint ptr %t1370 to i64
  %t1372 = inttoptr i64 %t1371 to ptr
  call void @intrinsic_println(ptr %t1372)
  %t1373 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.292)
  %t1374 = ptrtoint ptr %t1373 to i64
  %t1375 = inttoptr i64 %t1374 to ptr
  call void @intrinsic_println(ptr %t1375)
  %t1376 = load i64, ptr %local.ir2.1329
  %t1377 = call i64 @f64_parse(ptr @.str.exp_balance_residual.293)
  %t1378 = call i64 @"sx_f64_add"(i64 %t1376, i64 %t1377)
  %t1379 = call i64 @"abs_f64"(i64 %t1378)
  %t1380 = call i64 @f64_parse(ptr @.str.exp_balance_residual.294)
  %t1381 = call i64 @"sx_f64_lt"(i64 %t1379, i64 %t1380)
  %t1382 = icmp ne i64 %t1381, 0
  br i1 %t1382, label %then23, label %else23
then23:
  %t1383 = load i64, ptr %local.ir3.1330
  %t1384 = call i64 @f64_parse(ptr @.str.exp_balance_residual.295)
  %t1385 = call i64 @"sx_f64_add"(i64 %t1383, i64 %t1384)
  %t1386 = call i64 @"abs_f64"(i64 %t1385)
  %t1387 = call i64 @f64_parse(ptr @.str.exp_balance_residual.296)
  %t1388 = call i64 @"sx_f64_lt"(i64 %t1386, i64 %t1387)
  %t1389 = icmp ne i64 %t1388, 0
  br i1 %t1389, label %then24, label %else24
then24:
  %t1390 = load i64, ptr %local.ir_off.1331
  %t1391 = call i64 @f64_parse(ptr @.str.exp_balance_residual.297)
  %t1392 = call i64 @"sx_f64_add"(i64 %t1390, i64 %t1391)
  %t1393 = call i64 @"abs_f64"(i64 %t1392)
  %t1394 = call i64 @f64_parse(ptr @.str.exp_balance_residual.298)
  %t1395 = call i64 @"sx_f64_gt"(i64 %t1393, i64 %t1394)
  %t1396 = icmp ne i64 %t1395, 0
  br i1 %t1396, label %then25, label %else25
then25:
  %t1397 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.299)
  %t1398 = ptrtoint ptr %t1397 to i64
  %t1399 = inttoptr i64 %t1398 to ptr
  call void @intrinsic_println(ptr %t1399)
  %t1400 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.300)
  %t1401 = ptrtoint ptr %t1400 to i64
  %t1402 = inttoptr i64 %t1401 to ptr
  call void @intrinsic_println(ptr %t1402)
  %t1403 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.301)
  %t1404 = ptrtoint ptr %t1403 to i64
  %t1405 = inttoptr i64 %t1404 to ptr
  call void @intrinsic_println(ptr %t1405)
  br label %then25_end
then25_end:
  br label %endif25
else25:
  br label %else25_end
else25_end:
  br label %endif25
endif25:
  %t1406 = phi i64 [ 0, %then25_end ], [ 0, %else25_end ]
  br label %then24_end
then24_end:
  br label %endif24
else24:
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t1407 = phi i64 [ %t1406, %then24_end ], [ 0, %else24_end ]
  br label %then23_end
then23_end:
  br label %endif23
else23:
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t1408 = phi i64 [ %t1407, %then23_end ], [ 0, %else23_end ]
  %t1409 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.302)
  %t1410 = ptrtoint ptr %t1409 to i64
  %t1411 = inttoptr i64 %t1410 to ptr
  call void @intrinsic_println(ptr %t1411)
  ret i64 0
}

define i64 @"simplex_main"() nounwind {
entry:
  %t1412 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.303)
  %t1413 = ptrtoint ptr %t1412 to i64
  %t1414 = inttoptr i64 %t1413 to ptr
  call void @intrinsic_println(ptr %t1414)
  %t1415 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.304)
  %t1416 = ptrtoint ptr %t1415 to i64
  %t1417 = inttoptr i64 %t1416 to ptr
  call void @intrinsic_println(ptr %t1417)
  %t1418 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.305)
  %t1419 = ptrtoint ptr %t1418 to i64
  %t1420 = inttoptr i64 %t1419 to ptr
  call void @intrinsic_println(ptr %t1420)
  %t1421 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.306)
  %t1422 = ptrtoint ptr %t1421 to i64
  %t1423 = inttoptr i64 %t1422 to ptr
  call void @intrinsic_println(ptr %t1423)
  %t1424 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.307)
  %t1425 = ptrtoint ptr %t1424 to i64
  %t1426 = inttoptr i64 %t1425 to ptr
  call void @intrinsic_println(ptr %t1426)
  %t1427 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.308)
  %t1428 = ptrtoint ptr %t1427 to i64
  %t1429 = inttoptr i64 %t1428 to ptr
  call void @intrinsic_println(ptr %t1429)
  %t1430 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.309)
  %t1431 = ptrtoint ptr %t1430 to i64
  %t1432 = inttoptr i64 %t1431 to ptr
  call void @intrinsic_println(ptr %t1432)
  %t1433 = call i64 @"test_iratio_theorem"()
  %t1434 = call i64 @"test_1d"()
  %t1435 = call i64 @"test_2d"()
  %t1436 = call i64 @"test_nonconvex"()
  %t1437 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.310)
  %t1438 = ptrtoint ptr %t1437 to i64
  %t1439 = inttoptr i64 %t1438 to ptr
  call void @intrinsic_println(ptr %t1439)
  %t1440 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.311)
  %t1441 = ptrtoint ptr %t1440 to i64
  %t1442 = inttoptr i64 %t1441 to ptr
  call void @intrinsic_println(ptr %t1442)
  %t1443 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.312)
  %t1444 = ptrtoint ptr %t1443 to i64
  %t1445 = inttoptr i64 %t1444 to ptr
  call void @intrinsic_println(ptr %t1445)
  %t1446 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.313)
  %t1447 = ptrtoint ptr %t1446 to i64
  %t1448 = inttoptr i64 %t1447 to ptr
  call void @intrinsic_println(ptr %t1448)
  %t1449 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.314)
  %t1450 = ptrtoint ptr %t1449 to i64
  %t1451 = inttoptr i64 %t1450 to ptr
  call void @intrinsic_println(ptr %t1451)
  %t1452 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.315)
  %t1453 = ptrtoint ptr %t1452 to i64
  %t1454 = inttoptr i64 %t1453 to ptr
  call void @intrinsic_println(ptr %t1454)
  %t1455 = call ptr @intrinsic_string_new(ptr @.str.exp_balance_residual.316)
  %t1456 = ptrtoint ptr %t1455 to i64
  %t1457 = inttoptr i64 %t1456 to ptr
  call void @intrinsic_println(ptr %t1457)
  ret i64 0
}


; String constants
@.str.exp_balance_residual.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_balance_residual.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_balance_residual.2 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.3 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_balance_residual.4 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.5 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.6 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_balance_residual.7 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_balance_residual.8 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.9 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_balance_residual.10 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.11 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.12 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_balance_residual.13 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_balance_residual.14 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_balance_residual.15 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.16 = private unnamed_addr constant [34 x i8] c"--- 1D: B(θ) and I_ratio(θ) ---\00"
@.str.exp_balance_residual.17 = private unnamed_addr constant [42 x i8] c"  L1=(θ-3)², L2=(θ+2)², eq at θ*=0.5\00"
@.str.exp_balance_residual.18 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_balance_residual.19 = private unnamed_addr constant [41 x i8] c"  θ       B(θ)       I_ratio    dB/dθ\00"
@.str.exp_balance_residual.20 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_balance_residual.21 = private unnamed_addr constant [5 x i8] c"6.01\00"
@.str.exp_balance_residual.22 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_balance_residual.23 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_balance_residual.24 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_balance_residual.25 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_balance_residual.26 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_balance_residual.27 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_balance_residual.28 = private unnamed_addr constant [18 x i8] c"  <-- EQUILIBRIUM\00"
@.str.exp_balance_residual.29 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_balance_residual.30 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.31 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_balance_residual.32 = private unnamed_addr constant [21 x i8] c"  B-flow from θ=-3:\00"
@.str.exp_balance_residual.33 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_balance_residual.34 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_balance_residual.35 = private unnamed_addr constant [10 x i8] c"    step \00"
@.str.exp_balance_residual.36 = private unnamed_addr constant [6 x i8] c": θ=\00"
@.str.exp_balance_residual.37 = private unnamed_addr constant [4 x i8] c" B=\00"
@.str.exp_balance_residual.38 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_balance_residual.39 = private unnamed_addr constant [15 x i8] c"    final: θ=\00"
@.str.exp_balance_residual.40 = private unnamed_addr constant [4 x i8] c" B=\00"
@.str.exp_balance_residual.41 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_balance_residual.42 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_balance_residual.43 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.44 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_balance_residual.45 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.46 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.47 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_balance_residual.48 = private unnamed_addr constant [25 x i8] c"    loss-flow final: θ=\00"
@.str.exp_balance_residual.49 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_balance_residual.50 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_balance_residual.51 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_balance_residual.52 = private unnamed_addr constant [28 x i8] c"    B-flow distance to eq: \00"
@.str.exp_balance_residual.53 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_balance_residual.54 = private unnamed_addr constant [28 x i8] c"    Loss-flow distance:    \00"
@.str.exp_balance_residual.55 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_balance_residual.56 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_balance_residual.57 = private unnamed_addr constant [35 x i8] c"    PASS: B-flow finds equilibrium\00"
@.str.exp_balance_residual.58 = private unnamed_addr constant [43 x i8] c"    B-flow did not converge to equilibrium\00"
@.str.exp_balance_residual.59 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_balance_residual.60 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.61 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_balance_residual.62 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.63 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.64 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.65 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.66 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.67 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_balance_residual.68 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.69 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.70 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.71 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.72 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_balance_residual.73 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_balance_residual.74 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.75 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_balance_residual.76 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.77 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.78 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.79 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.80 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.81 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_balance_residual.82 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.83 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.84 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.85 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.86 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_balance_residual.87 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_balance_residual.88 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_balance_residual.89 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.90 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_balance_residual.91 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.92 = private unnamed_addr constant [29 x i8] c"--- 2D: Three Objectives ---\00"
@.str.exp_balance_residual.93 = private unnamed_addr constant [61 x i8] c"  L1=(x-3)²+(y-1)², L2=(x+1)²+(y-4)², L3=(x-1)²+(y+2)²\00"
@.str.exp_balance_residual.94 = private unnamed_addr constant [31 x i8] c"  True equilibrium: (1.0, 1.0)\00"
@.str.exp_balance_residual.95 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_balance_residual.96 = private unnamed_addr constant [47 x i8] c"  Point         B          I_ratio    Expected\00"
@.str.exp_balance_residual.97 = private unnamed_addr constant [17 x i8] c"  (1,1) eq:     \00"
@.str.exp_balance_residual.98 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.99 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.100 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_balance_residual.101 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.102 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.103 = private unnamed_addr constant [14 x i8] c"  B=0, I=-0.5\00"
@.str.exp_balance_residual.104 = private unnamed_addr constant [17 x i8] c"  (3,1) L1:     \00"
@.str.exp_balance_residual.105 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_balance_residual.106 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.107 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_balance_residual.108 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_balance_residual.109 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.110 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_balance_residual.111 = private unnamed_addr constant [17 x i8] c"  (-1,4) L2:    \00"
@.str.exp_balance_residual.112 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.113 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_balance_residual.114 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_balance_residual.115 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.116 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_balance_residual.117 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_balance_residual.118 = private unnamed_addr constant [17 x i8] c"  (0,0) origin: \00"
@.str.exp_balance_residual.119 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_balance_residual.120 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_balance_residual.121 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_balance_residual.122 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_balance_residual.123 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_balance_residual.124 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_balance_residual.125 = private unnamed_addr constant [17 x i8] c"  (-3,-3) far:  \00"
@.str.exp_balance_residual.126 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_balance_residual.127 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_balance_residual.128 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_balance_residual.129 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_balance_residual.130 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_balance_residual.131 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_balance_residual.132 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_balance_residual.133 = private unnamed_addr constant [24 x i8] c"  B-flow from (-3, -3):\00"
@.str.exp_balance_residual.134 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_balance_residual.135 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_balance_residual.136 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_balance_residual.137 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_balance_residual.138 = private unnamed_addr constant [10 x i8] c"    step \00"
@.str.exp_balance_residual.139 = private unnamed_addr constant [4 x i8] c": (\00"
@.str.exp_balance_residual.140 = private unnamed_addr constant [2 x i8] c",\00"
@.str.exp_balance_residual.141 = private unnamed_addr constant [5 x i8] c") B=\00"
@.str.exp_balance_residual.142 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_balance_residual.143 = private unnamed_addr constant [15 x i8] c"    step 50: (\00"
@.str.exp_balance_residual.144 = private unnamed_addr constant [2 x i8] c",\00"
@.str.exp_balance_residual.145 = private unnamed_addr constant [5 x i8] c") B=\00"
@.str.exp_balance_residual.146 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_balance_residual.147 = private unnamed_addr constant [16 x i8] c"    step 499: (\00"
@.str.exp_balance_residual.148 = private unnamed_addr constant [2 x i8] c",\00"
@.str.exp_balance_residual.149 = private unnamed_addr constant [5 x i8] c") B=\00"
@.str.exp_balance_residual.150 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_balance_residual.151 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_balance_residual.152 = private unnamed_addr constant [27 x i8] c"  Loss-flow from (-3, -3):\00"
@.str.exp_balance_residual.153 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_balance_residual.154 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_balance_residual.155 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.156 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_balance_residual.157 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.158 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.159 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.160 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.161 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.162 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.163 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.164 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_balance_residual.165 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.166 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.167 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_balance_residual.168 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_balance_residual.169 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_balance_residual.170 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_balance_residual.171 = private unnamed_addr constant [13 x i8] c"    final: (\00"
@.str.exp_balance_residual.172 = private unnamed_addr constant [2 x i8] c",\00"
@.str.exp_balance_residual.173 = private unnamed_addr constant [2 x i8] c")\00"
@.str.exp_balance_residual.174 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_balance_residual.175 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.176 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.177 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.178 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.179 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.180 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.181 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.182 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.183 = private unnamed_addr constant [29 x i8] c"  B-flow distance to eq:    \00"
@.str.exp_balance_residual.184 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_balance_residual.185 = private unnamed_addr constant [29 x i8] c"  Loss-flow distance to eq: \00"
@.str.exp_balance_residual.186 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_balance_residual.187 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_balance_residual.188 = private unnamed_addr constant [34 x i8] c"  PASS: B-flow finds equilibrium!\00"
@.str.exp_balance_residual.189 = private unnamed_addr constant [35 x i8] c"  B-FLOW IS CLOSER than loss-flow!\00"
@.str.exp_balance_residual.190 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_balance_residual.191 = private unnamed_addr constant [17 x i8] c"3.14159265358979\00"
@.str.exp_balance_residual.192 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.193 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_balance_residual.194 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.195 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.196 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.197 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.198 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_balance_residual.199 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_balance_residual.200 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.201 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_balance_residual.202 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_balance_residual.203 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_balance_residual.204 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.205 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_balance_residual.206 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.207 = private unnamed_addr constant [17 x i8] c"3.14159265358979\00"
@.str.exp_balance_residual.208 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.209 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.210 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.211 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.212 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_balance_residual.213 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.214 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.215 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.216 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_balance_residual.217 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.218 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.219 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.220 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.221 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.222 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_balance_residual.223 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_balance_residual.224 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_balance_residual.225 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.226 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.227 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.228 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_balance_residual.229 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.230 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.231 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_balance_residual.232 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.233 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.234 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_balance_residual.235 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.236 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.237 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_balance_residual.238 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.239 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.240 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.241 = private unnamed_addr constant [51 x i8] c"--- Non-Convex: Rastrigin Competing Objectives ---\00"
@.str.exp_balance_residual.242 = private unnamed_addr constant [33 x i8] c"  Targets: (2,1), (-1,3), (0,-2)\00"
@.str.exp_balance_residual.243 = private unnamed_addr constant [35 x i8] c"  Does B-flow escape local minima?\00"
@.str.exp_balance_residual.244 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_balance_residual.245 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_balance_residual.246 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_balance_residual.247 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_balance_residual.248 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_balance_residual.249 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_balance_residual.250 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_balance_residual.251 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.252 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.253 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_balance_residual.254 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.255 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_balance_residual.256 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_balance_residual.257 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_balance_residual.258 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_balance_residual.259 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_balance_residual.260 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_balance_residual.261 = private unnamed_addr constant [18 x i8] c"  B-flow final: (\00"
@.str.exp_balance_residual.262 = private unnamed_addr constant [2 x i8] c",\00"
@.str.exp_balance_residual.263 = private unnamed_addr constant [8 x i8] c") loss=\00"
@.str.exp_balance_residual.264 = private unnamed_addr constant [4 x i8] c" B=\00"
@.str.exp_balance_residual.265 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_balance_residual.266 = private unnamed_addr constant [18 x i8] c"  L-flow final: (\00"
@.str.exp_balance_residual.267 = private unnamed_addr constant [2 x i8] c",\00"
@.str.exp_balance_residual.268 = private unnamed_addr constant [8 x i8] c") loss=\00"
@.str.exp_balance_residual.269 = private unnamed_addr constant [4 x i8] c" B=\00"
@.str.exp_balance_residual.270 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_balance_residual.271 = private unnamed_addr constant [51 x i8] c"  FINDING: B-flow finds LOWER loss than loss-flow!\00"
@.str.exp_balance_residual.272 = private unnamed_addr constant [47 x i8] c"  On non-convex landscapes, optimizing BALANCE\00"
@.str.exp_balance_residual.273 = private unnamed_addr constant [52 x i8] c"  escapes local minima better than optimizing LOSS.\00"
@.str.exp_balance_residual.274 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.275 = private unnamed_addr constant [55 x i8] c"  FINDING: B-flow and loss-flow find similar solutions\00"
@.str.exp_balance_residual.276 = private unnamed_addr constant [29 x i8] c"  Loss-flow finds lower loss\00"
@.str.exp_balance_residual.277 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_balance_residual.278 = private unnamed_addr constant [48 x i8] c"--- I_ratio = -0.5 at Equilibrium (Theorem) ---\00"
@.str.exp_balance_residual.279 = private unnamed_addr constant [57 x i8] c"  For K objectives with Σgᵢ=0: I_ratio = -0.5 exactly\00"
@.str.exp_balance_residual.280 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_balance_residual.281 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_balance_residual.282 = private unnamed_addr constant [28 x i8] c"  K=2, θ*=0.5:  I_ratio = \00"
@.str.exp_balance_residual.283 = private unnamed_addr constant [15 x i8] c" (expect -0.5)\00"
@.str.exp_balance_residual.284 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.285 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_balance_residual.286 = private unnamed_addr constant [28 x i8] c"  K=3, (1,1):    I_ratio = \00"
@.str.exp_balance_residual.287 = private unnamed_addr constant [15 x i8] c" (expect -0.5)\00"
@.str.exp_balance_residual.288 = private unnamed_addr constant [4 x i8] c"1.5\00"
@.str.exp_balance_residual.289 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_balance_residual.290 = private unnamed_addr constant [29 x i8] c"  K=3, (1.5,0.5): I_ratio = \00"
@.str.exp_balance_residual.291 = private unnamed_addr constant [19 x i8] c" (expect ≠ -0.5)\00"
@.str.exp_balance_residual.292 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_balance_residual.293 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_balance_residual.294 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_balance_residual.295 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_balance_residual.296 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_balance_residual.297 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_balance_residual.298 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_balance_residual.299 = private unnamed_addr constant [55 x i8] c"  THEOREM CONFIRMED: I_ratio = -0.5 iff at equilibrium\00"
@.str.exp_balance_residual.300 = private unnamed_addr constant [54 x i8] c"  This provides a NECESSARY AND SUFFICIENT condition:\00"
@.str.exp_balance_residual.301 = private unnamed_addr constant [54 x i8] c"  search for where I_ratio = -0.5 to find equilibria.\00"
@.str.exp_balance_residual.302 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_balance_residual.303 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_balance_residual.304 = private unnamed_addr constant [41 x i8] c"  BALANCE RESIDUAL: EQUILIBRIUM LOCATION\00"
@.str.exp_balance_residual.305 = private unnamed_addr constant [38 x i8] c"  B(θ) = ||Σgᵢ||² / Σ||gᵢ||²\00"
@.str.exp_balance_residual.306 = private unnamed_addr constant [40 x i8] c"  I_ratio = Σgᵢ·gⱼ / Σ||gᵢ||²\00"
@.str.exp_balance_residual.307 = private unnamed_addr constant [33 x i8] c"  Equilibrium: B=0, I_ratio=-0.5\00"
@.str.exp_balance_residual.308 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_balance_residual.309 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_balance_residual.310 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_balance_residual.311 = private unnamed_addr constant [47 x i8] c"  THESIS: The equilibrium of a multi-objective\00"
@.str.exp_balance_residual.312 = private unnamed_addr constant [44 x i8] c"  system is where the BALANCE RESIDUAL B=0,\00"
@.str.exp_balance_residual.313 = private unnamed_addr constant [37 x i8] c"  equivalently where I_ratio = -0.5.\00"
@.str.exp_balance_residual.314 = private unnamed_addr constant [41 x i8] c"  Following ∇B locates equilibria from\00"
@.str.exp_balance_residual.315 = private unnamed_addr constant [30 x i8] c"  gradient evaluations alone.\00"
@.str.exp_balance_residual.316 = private unnamed_addr constant [45 x i8] c"============================================\00"
