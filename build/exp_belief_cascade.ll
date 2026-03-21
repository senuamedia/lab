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
  %t1 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.1)
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
  %t24 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.2)
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

define i64 @"train_chain"(i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %obs, i64 %seed) nounwind {
entry:
  %local.al_a.44 = alloca i64
  %local.be_a.45 = alloca i64
  %local.al_b.46 = alloca i64
  %local.be_b.47 = alloca i64
  %local.al_c.48 = alloca i64
  %local.be_c.49 = alloca i64
  %local.al_d.50 = alloca i64
  %local.be_d.51 = alloca i64
  %local.al_e.52 = alloca i64
  %local.be_e.53 = alloca i64
  %local.rng.54 = alloca i64
  %local.step.55 = alloca i64
  %local.boost.56 = alloca i64
  %local.t_a.57 = alloca i64
  %local.t_b.58 = alloca i64
  %local.t_c.59 = alloca i64
  %local.t_d.60 = alloca i64
  %local.t_e.61 = alloca i64
  %local.ea.62 = alloca i64
  %local.eb.63 = alloca i64
  %local.ec.64 = alloca i64
  %local.ed.65 = alloca i64
  %local.ee.66 = alloca i64
  %local.a0 = alloca i64
  store i64 %a0, ptr %local.a0
  %local.a1 = alloca i64
  store i64 %a1, ptr %local.a1
  %local.a2 = alloca i64
  store i64 %a2, ptr %local.a2
  %local.a3 = alloca i64
  store i64 %a3, ptr %local.a3
  %local.obs = alloca i64
  store i64 %obs, ptr %local.obs
  %local.seed = alloca i64
  store i64 %seed, ptr %local.seed
  %t67 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.3)
  store i64 %t67, ptr %local.al_a.44
  %t68 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.4)
  store i64 %t68, ptr %local.be_a.45
  %t69 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.5)
  store i64 %t69, ptr %local.al_b.46
  %t70 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.6)
  store i64 %t70, ptr %local.be_b.47
  %t71 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.7)
  store i64 %t71, ptr %local.al_c.48
  %t72 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.8)
  store i64 %t72, ptr %local.be_c.49
  %t73 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.9)
  store i64 %t73, ptr %local.al_d.50
  %t74 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.10)
  store i64 %t74, ptr %local.be_d.51
  %t75 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.11)
  store i64 %t75, ptr %local.al_e.52
  %t76 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.12)
  store i64 %t76, ptr %local.be_e.53
  %t77 = load i64, ptr %local.seed
  store i64 %t77, ptr %local.rng.54
  store i64 0, ptr %local.step.55
  %t78 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.13)
  store i64 %t78, ptr %local.boost.56
  %t79 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.14)
  store i64 %t79, ptr %local.t_a.57
  %t80 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.15)
  store i64 %t80, ptr %local.t_b.58
  %t81 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.16)
  store i64 %t81, ptr %local.t_c.59
  %t82 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.17)
  store i64 %t82, ptr %local.t_d.60
  %t83 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.18)
  store i64 %t83, ptr %local.t_e.61
  br label %loop4
loop4:
  %t84 = load i64, ptr %local.step.55
  %t85 = load i64, ptr %local.obs
  %t86 = icmp slt i64 %t84, %t85
  %t87 = zext i1 %t86 to i64
  %t88 = icmp ne i64 %t87, 0
  br i1 %t88, label %body4, label %endloop4
body4:
  %t89 = load i64, ptr %local.rng.54
  %t90 = call i64 @"lcg_next"(i64 %t89)
  store i64 %t90, ptr %local.rng.54
  %t91 = load i64, ptr %local.rng.54
  %t92 = call i64 @"lcg_f64"(i64 %t91)
  %t93 = load i64, ptr %local.t_a.57
  %t94 = call i64 @"sx_f64_lt"(i64 %t92, i64 %t93)
  %t95 = icmp ne i64 %t94, 0
  br i1 %t95, label %then5, label %else5
then5:
  %t96 = load i64, ptr %local.al_a.44
  %t97 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.19)
  %t98 = call i64 @"sx_f64_add"(i64 %t96, i64 %t97)
  store i64 %t98, ptr %local.al_a.44
  %t99 = load i64, ptr %local.a0
  %t100 = load i64, ptr %local.al_a.44
  %t101 = load i64, ptr %local.be_a.45
  %t102 = call i64 @"beta_mean"(i64 %t100, i64 %t101)
  %t103 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.20)
  %t104 = call i64 @"sx_f64_sub"(i64 %t102, i64 %t103)
  %t105 = call i64 @"sx_f64_mul"(i64 %t99, i64 %t104)
  %t106 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.21)
  %t107 = call i64 @"sx_f64_mul"(i64 %t105, i64 %t106)
  store i64 %t107, ptr %local.boost.56
  %t108 = load i64, ptr %local.boost.56
  %t109 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.22)
  %t110 = call i64 @"sx_f64_gt"(i64 %t108, i64 %t109)
  %t111 = icmp ne i64 %t110, 0
  br i1 %t111, label %then6, label %else6
then6:
  %t112 = load i64, ptr %local.al_b.46
  %t113 = load i64, ptr %local.boost.56
  %t114 = call i64 @"sx_f64_add"(i64 %t112, i64 %t113)
  store i64 %t114, ptr %local.al_b.46
  br label %then6_end
then6_end:
  br label %endif6
else6:
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t115 = phi i64 [ 0, %then6_end ], [ 0, %else6_end ]
  br label %then5_end
then5_end:
  br label %endif5
else5:
  %t116 = load i64, ptr %local.be_a.45
  %t117 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.23)
  %t118 = call i64 @"sx_f64_add"(i64 %t116, i64 %t117)
  store i64 %t118, ptr %local.be_a.45
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t119 = phi i64 [ %t115, %then5_end ], [ 0, %else5_end ]
  %t120 = load i64, ptr %local.rng.54
  %t121 = call i64 @"lcg_next"(i64 %t120)
  store i64 %t121, ptr %local.rng.54
  %t122 = load i64, ptr %local.rng.54
  %t123 = call i64 @"lcg_f64"(i64 %t122)
  %t124 = load i64, ptr %local.t_b.58
  %t125 = call i64 @"sx_f64_lt"(i64 %t123, i64 %t124)
  %t126 = icmp ne i64 %t125, 0
  br i1 %t126, label %then7, label %else7
then7:
  %t127 = load i64, ptr %local.al_b.46
  %t128 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.24)
  %t129 = call i64 @"sx_f64_add"(i64 %t127, i64 %t128)
  store i64 %t129, ptr %local.al_b.46
  %t130 = load i64, ptr %local.a1
  %t131 = load i64, ptr %local.al_b.46
  %t132 = load i64, ptr %local.be_b.47
  %t133 = call i64 @"beta_mean"(i64 %t131, i64 %t132)
  %t134 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.25)
  %t135 = call i64 @"sx_f64_sub"(i64 %t133, i64 %t134)
  %t136 = call i64 @"sx_f64_mul"(i64 %t130, i64 %t135)
  %t137 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.26)
  %t138 = call i64 @"sx_f64_mul"(i64 %t136, i64 %t137)
  store i64 %t138, ptr %local.boost.56
  %t139 = load i64, ptr %local.boost.56
  %t140 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.27)
  %t141 = call i64 @"sx_f64_gt"(i64 %t139, i64 %t140)
  %t142 = icmp ne i64 %t141, 0
  br i1 %t142, label %then8, label %else8
then8:
  %t143 = load i64, ptr %local.al_c.48
  %t144 = load i64, ptr %local.boost.56
  %t145 = call i64 @"sx_f64_add"(i64 %t143, i64 %t144)
  store i64 %t145, ptr %local.al_c.48
  br label %then8_end
then8_end:
  br label %endif8
else8:
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t146 = phi i64 [ 0, %then8_end ], [ 0, %else8_end ]
  br label %then7_end
then7_end:
  br label %endif7
else7:
  %t147 = load i64, ptr %local.be_b.47
  %t148 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.28)
  %t149 = call i64 @"sx_f64_add"(i64 %t147, i64 %t148)
  store i64 %t149, ptr %local.be_b.47
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t150 = phi i64 [ %t146, %then7_end ], [ 0, %else7_end ]
  %t151 = load i64, ptr %local.rng.54
  %t152 = call i64 @"lcg_next"(i64 %t151)
  store i64 %t152, ptr %local.rng.54
  %t153 = load i64, ptr %local.rng.54
  %t154 = call i64 @"lcg_f64"(i64 %t153)
  %t155 = load i64, ptr %local.t_c.59
  %t156 = call i64 @"sx_f64_lt"(i64 %t154, i64 %t155)
  %t157 = icmp ne i64 %t156, 0
  br i1 %t157, label %then9, label %else9
then9:
  %t158 = load i64, ptr %local.al_c.48
  %t159 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.29)
  %t160 = call i64 @"sx_f64_add"(i64 %t158, i64 %t159)
  store i64 %t160, ptr %local.al_c.48
  %t161 = load i64, ptr %local.a2
  %t162 = load i64, ptr %local.al_c.48
  %t163 = load i64, ptr %local.be_c.49
  %t164 = call i64 @"beta_mean"(i64 %t162, i64 %t163)
  %t165 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.30)
  %t166 = call i64 @"sx_f64_sub"(i64 %t164, i64 %t165)
  %t167 = call i64 @"sx_f64_mul"(i64 %t161, i64 %t166)
  %t168 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.31)
  %t169 = call i64 @"sx_f64_mul"(i64 %t167, i64 %t168)
  store i64 %t169, ptr %local.boost.56
  %t170 = load i64, ptr %local.boost.56
  %t171 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.32)
  %t172 = call i64 @"sx_f64_gt"(i64 %t170, i64 %t171)
  %t173 = icmp ne i64 %t172, 0
  br i1 %t173, label %then10, label %else10
then10:
  %t174 = load i64, ptr %local.al_d.50
  %t175 = load i64, ptr %local.boost.56
  %t176 = call i64 @"sx_f64_add"(i64 %t174, i64 %t175)
  store i64 %t176, ptr %local.al_d.50
  br label %then10_end
then10_end:
  br label %endif10
else10:
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t177 = phi i64 [ 0, %then10_end ], [ 0, %else10_end ]
  br label %then9_end
then9_end:
  br label %endif9
else9:
  %t178 = load i64, ptr %local.be_c.49
  %t179 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.33)
  %t180 = call i64 @"sx_f64_add"(i64 %t178, i64 %t179)
  store i64 %t180, ptr %local.be_c.49
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t181 = phi i64 [ %t177, %then9_end ], [ 0, %else9_end ]
  %t182 = load i64, ptr %local.rng.54
  %t183 = call i64 @"lcg_next"(i64 %t182)
  store i64 %t183, ptr %local.rng.54
  %t184 = load i64, ptr %local.rng.54
  %t185 = call i64 @"lcg_f64"(i64 %t184)
  %t186 = load i64, ptr %local.t_d.60
  %t187 = call i64 @"sx_f64_lt"(i64 %t185, i64 %t186)
  %t188 = icmp ne i64 %t187, 0
  br i1 %t188, label %then11, label %else11
then11:
  %t189 = load i64, ptr %local.al_d.50
  %t190 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.34)
  %t191 = call i64 @"sx_f64_add"(i64 %t189, i64 %t190)
  store i64 %t191, ptr %local.al_d.50
  %t192 = load i64, ptr %local.a3
  %t193 = load i64, ptr %local.al_d.50
  %t194 = load i64, ptr %local.be_d.51
  %t195 = call i64 @"beta_mean"(i64 %t193, i64 %t194)
  %t196 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.35)
  %t197 = call i64 @"sx_f64_sub"(i64 %t195, i64 %t196)
  %t198 = call i64 @"sx_f64_mul"(i64 %t192, i64 %t197)
  %t199 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.36)
  %t200 = call i64 @"sx_f64_mul"(i64 %t198, i64 %t199)
  store i64 %t200, ptr %local.boost.56
  %t201 = load i64, ptr %local.boost.56
  %t202 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.37)
  %t203 = call i64 @"sx_f64_gt"(i64 %t201, i64 %t202)
  %t204 = icmp ne i64 %t203, 0
  br i1 %t204, label %then12, label %else12
then12:
  %t205 = load i64, ptr %local.al_e.52
  %t206 = load i64, ptr %local.boost.56
  %t207 = call i64 @"sx_f64_add"(i64 %t205, i64 %t206)
  store i64 %t207, ptr %local.al_e.52
  br label %then12_end
then12_end:
  br label %endif12
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t208 = phi i64 [ 0, %then12_end ], [ 0, %else12_end ]
  br label %then11_end
then11_end:
  br label %endif11
else11:
  %t209 = load i64, ptr %local.be_d.51
  %t210 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.38)
  %t211 = call i64 @"sx_f64_add"(i64 %t209, i64 %t210)
  store i64 %t211, ptr %local.be_d.51
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t212 = phi i64 [ %t208, %then11_end ], [ 0, %else11_end ]
  %t213 = load i64, ptr %local.rng.54
  %t214 = call i64 @"lcg_next"(i64 %t213)
  store i64 %t214, ptr %local.rng.54
  %t215 = load i64, ptr %local.rng.54
  %t216 = call i64 @"lcg_f64"(i64 %t215)
  %t217 = load i64, ptr %local.t_e.61
  %t218 = call i64 @"sx_f64_lt"(i64 %t216, i64 %t217)
  %t219 = icmp ne i64 %t218, 0
  br i1 %t219, label %then13, label %else13
then13:
  %t220 = load i64, ptr %local.al_e.52
  %t221 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.39)
  %t222 = call i64 @"sx_f64_add"(i64 %t220, i64 %t221)
  store i64 %t222, ptr %local.al_e.52
  br label %then13_end
then13_end:
  br label %endif13
else13:
  %t223 = load i64, ptr %local.be_e.53
  %t224 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.40)
  %t225 = call i64 @"sx_f64_add"(i64 %t223, i64 %t224)
  store i64 %t225, ptr %local.be_e.53
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t226 = phi i64 [ 0, %then13_end ], [ 0, %else13_end ]
  %t227 = load i64, ptr %local.step.55
  %t228 = add i64 %t227, 1
  store i64 %t228, ptr %local.step.55
  br label %loop4
endloop4:
  %t229 = load i64, ptr %local.al_a.44
  %t230 = load i64, ptr %local.be_a.45
  %t231 = call i64 @"beta_mean"(i64 %t229, i64 %t230)
  %t232 = load i64, ptr %local.t_a.57
  %t233 = call i64 @"sx_f64_sub"(i64 %t231, i64 %t232)
  store i64 %t233, ptr %local.ea.62
  %t234 = load i64, ptr %local.al_b.46
  %t235 = load i64, ptr %local.be_b.47
  %t236 = call i64 @"beta_mean"(i64 %t234, i64 %t235)
  %t237 = load i64, ptr %local.t_b.58
  %t238 = call i64 @"sx_f64_sub"(i64 %t236, i64 %t237)
  store i64 %t238, ptr %local.eb.63
  %t239 = load i64, ptr %local.al_c.48
  %t240 = load i64, ptr %local.be_c.49
  %t241 = call i64 @"beta_mean"(i64 %t239, i64 %t240)
  %t242 = load i64, ptr %local.t_c.59
  %t243 = call i64 @"sx_f64_sub"(i64 %t241, i64 %t242)
  store i64 %t243, ptr %local.ec.64
  %t244 = load i64, ptr %local.al_d.50
  %t245 = load i64, ptr %local.be_d.51
  %t246 = call i64 @"beta_mean"(i64 %t244, i64 %t245)
  %t247 = load i64, ptr %local.t_d.60
  %t248 = call i64 @"sx_f64_sub"(i64 %t246, i64 %t247)
  store i64 %t248, ptr %local.ed.65
  %t249 = load i64, ptr %local.al_e.52
  %t250 = load i64, ptr %local.be_e.53
  %t251 = call i64 @"beta_mean"(i64 %t249, i64 %t250)
  %t252 = load i64, ptr %local.t_e.61
  %t253 = call i64 @"sx_f64_sub"(i64 %t251, i64 %t252)
  store i64 %t253, ptr %local.ee.66
  %t254 = load i64, ptr %local.ea.62
  %t255 = load i64, ptr %local.ea.62
  %t256 = call i64 @"sx_f64_mul"(i64 %t254, i64 %t255)
  %t257 = load i64, ptr %local.eb.63
  %t258 = load i64, ptr %local.eb.63
  %t259 = call i64 @"sx_f64_mul"(i64 %t257, i64 %t258)
  %t260 = call i64 @"sx_f64_add"(i64 %t256, i64 %t259)
  %t261 = load i64, ptr %local.ec.64
  %t262 = load i64, ptr %local.ec.64
  %t263 = call i64 @"sx_f64_mul"(i64 %t261, i64 %t262)
  %t264 = call i64 @"sx_f64_add"(i64 %t260, i64 %t263)
  %t265 = load i64, ptr %local.ed.65
  %t266 = load i64, ptr %local.ed.65
  %t267 = call i64 @"sx_f64_mul"(i64 %t265, i64 %t266)
  %t268 = call i64 @"sx_f64_add"(i64 %t264, i64 %t267)
  %t269 = load i64, ptr %local.ee.66
  %t270 = load i64, ptr %local.ee.66
  %t271 = call i64 @"sx_f64_mul"(i64 %t269, i64 %t270)
  %t272 = call i64 @"sx_f64_add"(i64 %t268, i64 %t271)
  ret i64 %t272
}

define i64 @"chain_loss_avg"(i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %obs) nounwind {
entry:
  %local.l1.273 = alloca i64
  %local.l2.274 = alloca i64
  %local.l3.275 = alloca i64
  %local.a0 = alloca i64
  store i64 %a0, ptr %local.a0
  %local.a1 = alloca i64
  store i64 %a1, ptr %local.a1
  %local.a2 = alloca i64
  store i64 %a2, ptr %local.a2
  %local.a3 = alloca i64
  store i64 %a3, ptr %local.a3
  %local.obs = alloca i64
  store i64 %obs, ptr %local.obs
  %t276 = load i64, ptr %local.a0
  %t277 = load i64, ptr %local.a1
  %t278 = load i64, ptr %local.a2
  %t279 = load i64, ptr %local.a3
  %t280 = load i64, ptr %local.obs
  %t281 = call i64 @"train_chain"(i64 %t276, i64 %t277, i64 %t278, i64 %t279, i64 %t280, i64 42)
  store i64 %t281, ptr %local.l1.273
  %t282 = load i64, ptr %local.a0
  %t283 = load i64, ptr %local.a1
  %t284 = load i64, ptr %local.a2
  %t285 = load i64, ptr %local.a3
  %t286 = load i64, ptr %local.obs
  %t287 = call i64 @"train_chain"(i64 %t282, i64 %t283, i64 %t284, i64 %t285, i64 %t286, i64 137)
  store i64 %t287, ptr %local.l2.274
  %t288 = load i64, ptr %local.a0
  %t289 = load i64, ptr %local.a1
  %t290 = load i64, ptr %local.a2
  %t291 = load i64, ptr %local.a3
  %t292 = load i64, ptr %local.obs
  %t293 = call i64 @"train_chain"(i64 %t288, i64 %t289, i64 %t290, i64 %t291, i64 %t292, i64 999)
  store i64 %t293, ptr %local.l3.275
  %t294 = load i64, ptr %local.l1.273
  %t295 = load i64, ptr %local.l2.274
  %t296 = call i64 @"sx_f64_add"(i64 %t294, i64 %t295)
  %t297 = load i64, ptr %local.l3.275
  %t298 = call i64 @"sx_f64_add"(i64 %t296, i64 %t297)
  %t299 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.41)
  %t300 = call i64 @"sx_f64_div"(i64 %t298, i64 %t299)
  ret i64 %t300
}

define i64 @"mg_chain"(i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %which, i64 %obs) nounwind {
entry:
  %local.h.301 = alloca i64
  %local.p0.302 = alloca i64
  %local.p1.303 = alloca i64
  %local.p2.304 = alloca i64
  %local.p3.305 = alloca i64
  %local.m0.306 = alloca i64
  %local.m1.307 = alloca i64
  %local.m2.308 = alloca i64
  %local.m3.309 = alloca i64
  %local.lp.310 = alloca i64
  %local.lm.311 = alloca i64
  %local.a0 = alloca i64
  store i64 %a0, ptr %local.a0
  %local.a1 = alloca i64
  store i64 %a1, ptr %local.a1
  %local.a2 = alloca i64
  store i64 %a2, ptr %local.a2
  %local.a3 = alloca i64
  store i64 %a3, ptr %local.a3
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %local.obs = alloca i64
  store i64 %obs, ptr %local.obs
  %t312 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.42)
  store i64 %t312, ptr %local.h.301
  %t313 = load i64, ptr %local.a0
  store i64 %t313, ptr %local.p0.302
  %t314 = load i64, ptr %local.a1
  store i64 %t314, ptr %local.p1.303
  %t315 = load i64, ptr %local.a2
  store i64 %t315, ptr %local.p2.304
  %t316 = load i64, ptr %local.a3
  store i64 %t316, ptr %local.p3.305
  %t317 = load i64, ptr %local.a0
  store i64 %t317, ptr %local.m0.306
  %t318 = load i64, ptr %local.a1
  store i64 %t318, ptr %local.m1.307
  %t319 = load i64, ptr %local.a2
  store i64 %t319, ptr %local.m2.308
  %t320 = load i64, ptr %local.a3
  store i64 %t320, ptr %local.m3.309
  %t321 = load i64, ptr %local.which
  %t322 = icmp eq i64 %t321, 0
  %t323 = zext i1 %t322 to i64
  %t324 = icmp ne i64 %t323, 0
  br i1 %t324, label %then14, label %else14
then14:
  %t325 = load i64, ptr %local.a0
  %t326 = load i64, ptr %local.h.301
  %t327 = call i64 @"sx_f64_add"(i64 %t325, i64 %t326)
  store i64 %t327, ptr %local.p0.302
  %t328 = load i64, ptr %local.a0
  %t329 = load i64, ptr %local.h.301
  %t330 = call i64 @"sx_f64_sub"(i64 %t328, i64 %t329)
  store i64 %t330, ptr %local.m0.306
  br label %then14_end
then14_end:
  br label %endif14
else14:
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t331 = phi i64 [ 0, %then14_end ], [ 0, %else14_end ]
  %t332 = load i64, ptr %local.which
  %t333 = icmp eq i64 %t332, 1
  %t334 = zext i1 %t333 to i64
  %t335 = icmp ne i64 %t334, 0
  br i1 %t335, label %then15, label %else15
then15:
  %t336 = load i64, ptr %local.a1
  %t337 = load i64, ptr %local.h.301
  %t338 = call i64 @"sx_f64_add"(i64 %t336, i64 %t337)
  store i64 %t338, ptr %local.p1.303
  %t339 = load i64, ptr %local.a1
  %t340 = load i64, ptr %local.h.301
  %t341 = call i64 @"sx_f64_sub"(i64 %t339, i64 %t340)
  store i64 %t341, ptr %local.m1.307
  br label %then15_end
then15_end:
  br label %endif15
else15:
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t342 = phi i64 [ 0, %then15_end ], [ 0, %else15_end ]
  %t343 = load i64, ptr %local.which
  %t344 = icmp eq i64 %t343, 2
  %t345 = zext i1 %t344 to i64
  %t346 = icmp ne i64 %t345, 0
  br i1 %t346, label %then16, label %else16
then16:
  %t347 = load i64, ptr %local.a2
  %t348 = load i64, ptr %local.h.301
  %t349 = call i64 @"sx_f64_add"(i64 %t347, i64 %t348)
  store i64 %t349, ptr %local.p2.304
  %t350 = load i64, ptr %local.a2
  %t351 = load i64, ptr %local.h.301
  %t352 = call i64 @"sx_f64_sub"(i64 %t350, i64 %t351)
  store i64 %t352, ptr %local.m2.308
  br label %then16_end
then16_end:
  br label %endif16
else16:
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t353 = phi i64 [ 0, %then16_end ], [ 0, %else16_end ]
  %t354 = load i64, ptr %local.which
  %t355 = icmp eq i64 %t354, 3
  %t356 = zext i1 %t355 to i64
  %t357 = icmp ne i64 %t356, 0
  br i1 %t357, label %then17, label %else17
then17:
  %t358 = load i64, ptr %local.a3
  %t359 = load i64, ptr %local.h.301
  %t360 = call i64 @"sx_f64_add"(i64 %t358, i64 %t359)
  store i64 %t360, ptr %local.p3.305
  %t361 = load i64, ptr %local.a3
  %t362 = load i64, ptr %local.h.301
  %t363 = call i64 @"sx_f64_sub"(i64 %t361, i64 %t362)
  store i64 %t363, ptr %local.m3.309
  br label %then17_end
then17_end:
  br label %endif17
else17:
  br label %else17_end
else17_end:
  br label %endif17
endif17:
  %t364 = phi i64 [ 0, %then17_end ], [ 0, %else17_end ]
  %t365 = load i64, ptr %local.p0.302
  %t366 = load i64, ptr %local.p1.303
  %t367 = load i64, ptr %local.p2.304
  %t368 = load i64, ptr %local.p3.305
  %t369 = load i64, ptr %local.obs
  %t370 = call i64 @"chain_loss_avg"(i64 %t365, i64 %t366, i64 %t367, i64 %t368, i64 %t369)
  store i64 %t370, ptr %local.lp.310
  %t371 = load i64, ptr %local.m0.306
  %t372 = load i64, ptr %local.m1.307
  %t373 = load i64, ptr %local.m2.308
  %t374 = load i64, ptr %local.m3.309
  %t375 = load i64, ptr %local.obs
  %t376 = call i64 @"chain_loss_avg"(i64 %t371, i64 %t372, i64 %t373, i64 %t374, i64 %t375)
  store i64 %t376, ptr %local.lm.311
  %t377 = load i64, ptr %local.lp.310
  %t378 = load i64, ptr %local.lm.311
  %t379 = call i64 @"sx_f64_sub"(i64 %t377, i64 %t378)
  %t380 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.43)
  %t381 = load i64, ptr %local.h.301
  %t382 = call i64 @"sx_f64_mul"(i64 %t380, i64 %t381)
  %t383 = call i64 @"sx_f64_div"(i64 %t379, i64 %t382)
  ret i64 %t383
}

define i64 @"run_exp1"() nounwind {
entry:
  %local.obs.384 = alloca i64
  %local.meta_cycles.385 = alloca i64
  %local.meta_lr.386 = alloca i64
  %local.loss_none.387 = alloca i64
  %local.loss_unif.388 = alloca i64
  %local.a0.389 = alloca i64
  %local.a1.390 = alloca i64
  %local.a2.391 = alloca i64
  %local.a3.392 = alloca i64
  %local.mg.393 = alloca i64
  %local.cycle.394 = alloca i64
  %local.loss.395 = alloca i64
  %local.loss_learned.396 = alloca i64
  %t397 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.44)
  %t398 = ptrtoint ptr %t397 to i64
  %t399 = inttoptr i64 %t398 to ptr
  call void @intrinsic_println(ptr %t399)
  %t400 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.45)
  %t401 = ptrtoint ptr %t400 to i64
  %t402 = inttoptr i64 %t401 to ptr
  call void @intrinsic_println(ptr %t402)
  %t403 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.46)
  %t404 = ptrtoint ptr %t403 to i64
  %t405 = inttoptr i64 %t404 to ptr
  call void @intrinsic_println(ptr %t405)
  %t406 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.47)
  %t407 = ptrtoint ptr %t406 to i64
  %t408 = inttoptr i64 %t407 to ptr
  call void @intrinsic_println(ptr %t408)
  %t409 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.48)
  %t410 = ptrtoint ptr %t409 to i64
  %t411 = inttoptr i64 %t410 to ptr
  call void @intrinsic_println(ptr %t411)
  store i64 150, ptr %local.obs.384
  store i64 40, ptr %local.meta_cycles.385
  %t412 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.49)
  store i64 %t412, ptr %local.meta_lr.386
  %t413 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.50)
  %t414 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.51)
  %t415 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.52)
  %t416 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.53)
  %t417 = load i64, ptr %local.obs.384
  %t418 = call i64 @"chain_loss_avg"(i64 %t413, i64 %t414, i64 %t415, i64 %t416, i64 %t417)
  store i64 %t418, ptr %local.loss_none.387
  %t419 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.54)
  %t420 = ptrtoint ptr %t419 to i64
  %t421 = inttoptr i64 %t420 to ptr
  call void @intrinsic_print(ptr %t421)
  %t422 = load i64, ptr %local.loss_none.387
  %t423 = call i64 @"print_f64"(i64 %t422)
  %t424 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.55)
  %t425 = ptrtoint ptr %t424 to i64
  %t426 = inttoptr i64 %t425 to ptr
  call void @intrinsic_println(ptr %t426)
  %t427 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.56)
  %t428 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.57)
  %t429 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.58)
  %t430 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.59)
  %t431 = load i64, ptr %local.obs.384
  %t432 = call i64 @"chain_loss_avg"(i64 %t427, i64 %t428, i64 %t429, i64 %t430, i64 %t431)
  store i64 %t432, ptr %local.loss_unif.388
  %t433 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.60)
  %t434 = ptrtoint ptr %t433 to i64
  %t435 = inttoptr i64 %t434 to ptr
  call void @intrinsic_print(ptr %t435)
  %t436 = load i64, ptr %local.loss_unif.388
  %t437 = call i64 @"print_f64"(i64 %t436)
  %t438 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.61)
  %t439 = ptrtoint ptr %t438 to i64
  %t440 = inttoptr i64 %t439 to ptr
  call void @intrinsic_println(ptr %t440)
  %t441 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.62)
  store i64 %t441, ptr %local.a0.389
  %t442 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.63)
  store i64 %t442, ptr %local.a1.390
  %t443 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.64)
  store i64 %t443, ptr %local.a2.391
  %t444 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.65)
  store i64 %t444, ptr %local.a3.392
  %t445 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.66)
  store i64 %t445, ptr %local.mg.393
  store i64 0, ptr %local.cycle.394
  %t446 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.67)
  store i64 %t446, ptr %local.loss.395
  %t447 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.68)
  %t448 = ptrtoint ptr %t447 to i64
  %t449 = inttoptr i64 %t448 to ptr
  call void @intrinsic_println(ptr %t449)
  %t450 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.69)
  %t451 = ptrtoint ptr %t450 to i64
  %t452 = inttoptr i64 %t451 to ptr
  call void @intrinsic_println(ptr %t452)
  %t453 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.70)
  %t454 = ptrtoint ptr %t453 to i64
  %t455 = inttoptr i64 %t454 to ptr
  call void @intrinsic_println(ptr %t455)
  br label %loop18
loop18:
  %t456 = load i64, ptr %local.cycle.394
  %t457 = load i64, ptr %local.meta_cycles.385
  %t458 = icmp slt i64 %t456, %t457
  %t459 = zext i1 %t458 to i64
  %t460 = icmp ne i64 %t459, 0
  br i1 %t460, label %body18, label %endloop18
body18:
  %t461 = load i64, ptr %local.a0.389
  %t462 = load i64, ptr %local.a1.390
  %t463 = load i64, ptr %local.a2.391
  %t464 = load i64, ptr %local.a3.392
  %t465 = load i64, ptr %local.obs.384
  %t466 = call i64 @"mg_chain"(i64 %t461, i64 %t462, i64 %t463, i64 %t464, i64 0, i64 %t465)
  store i64 %t466, ptr %local.mg.393
  %t467 = load i64, ptr %local.a0.389
  %t468 = load i64, ptr %local.meta_lr.386
  %t469 = load i64, ptr %local.mg.393
  %t470 = call i64 @"sx_f64_mul"(i64 %t468, i64 %t469)
  %t471 = call i64 @"sx_f64_sub"(i64 %t467, i64 %t470)
  %t472 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.71)
  %t473 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.72)
  %t474 = call i64 @"clamp"(i64 %t471, i64 %t472, i64 %t473)
  store i64 %t474, ptr %local.a0.389
  %t475 = load i64, ptr %local.a0.389
  %t476 = load i64, ptr %local.a1.390
  %t477 = load i64, ptr %local.a2.391
  %t478 = load i64, ptr %local.a3.392
  %t479 = load i64, ptr %local.obs.384
  %t480 = call i64 @"mg_chain"(i64 %t475, i64 %t476, i64 %t477, i64 %t478, i64 1, i64 %t479)
  store i64 %t480, ptr %local.mg.393
  %t481 = load i64, ptr %local.a1.390
  %t482 = load i64, ptr %local.meta_lr.386
  %t483 = load i64, ptr %local.mg.393
  %t484 = call i64 @"sx_f64_mul"(i64 %t482, i64 %t483)
  %t485 = call i64 @"sx_f64_sub"(i64 %t481, i64 %t484)
  %t486 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.73)
  %t487 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.74)
  %t488 = call i64 @"clamp"(i64 %t485, i64 %t486, i64 %t487)
  store i64 %t488, ptr %local.a1.390
  %t489 = load i64, ptr %local.a0.389
  %t490 = load i64, ptr %local.a1.390
  %t491 = load i64, ptr %local.a2.391
  %t492 = load i64, ptr %local.a3.392
  %t493 = load i64, ptr %local.obs.384
  %t494 = call i64 @"mg_chain"(i64 %t489, i64 %t490, i64 %t491, i64 %t492, i64 2, i64 %t493)
  store i64 %t494, ptr %local.mg.393
  %t495 = load i64, ptr %local.a2.391
  %t496 = load i64, ptr %local.meta_lr.386
  %t497 = load i64, ptr %local.mg.393
  %t498 = call i64 @"sx_f64_mul"(i64 %t496, i64 %t497)
  %t499 = call i64 @"sx_f64_sub"(i64 %t495, i64 %t498)
  %t500 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.75)
  %t501 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.76)
  %t502 = call i64 @"clamp"(i64 %t499, i64 %t500, i64 %t501)
  store i64 %t502, ptr %local.a2.391
  %t503 = load i64, ptr %local.a0.389
  %t504 = load i64, ptr %local.a1.390
  %t505 = load i64, ptr %local.a2.391
  %t506 = load i64, ptr %local.a3.392
  %t507 = load i64, ptr %local.obs.384
  %t508 = call i64 @"mg_chain"(i64 %t503, i64 %t504, i64 %t505, i64 %t506, i64 3, i64 %t507)
  store i64 %t508, ptr %local.mg.393
  %t509 = load i64, ptr %local.a3.392
  %t510 = load i64, ptr %local.meta_lr.386
  %t511 = load i64, ptr %local.mg.393
  %t512 = call i64 @"sx_f64_mul"(i64 %t510, i64 %t511)
  %t513 = call i64 @"sx_f64_sub"(i64 %t509, i64 %t512)
  %t514 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.77)
  %t515 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.78)
  %t516 = call i64 @"clamp"(i64 %t513, i64 %t514, i64 %t515)
  store i64 %t516, ptr %local.a3.392
  %t517 = load i64, ptr %local.a0.389
  %t518 = load i64, ptr %local.a1.390
  %t519 = load i64, ptr %local.a2.391
  %t520 = load i64, ptr %local.a3.392
  %t521 = load i64, ptr %local.obs.384
  %t522 = call i64 @"chain_loss_avg"(i64 %t517, i64 %t518, i64 %t519, i64 %t520, i64 %t521)
  store i64 %t522, ptr %local.loss.395
  %t523 = load i64, ptr %local.cycle.394
  %t524 = icmp slt i64 %t523, 5
  %t525 = zext i1 %t524 to i64
  %t526 = icmp ne i64 %t525, 0
  br i1 %t526, label %then19, label %else19
then19:
  %t527 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.79)
  %t528 = ptrtoint ptr %t527 to i64
  %t529 = inttoptr i64 %t528 to ptr
  call void @intrinsic_print(ptr %t529)
  %t530 = load i64, ptr %local.cycle.394
  call void @print_i64(i64 %t530)
  %t531 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.80)
  %t532 = ptrtoint ptr %t531 to i64
  %t533 = inttoptr i64 %t532 to ptr
  call void @intrinsic_print(ptr %t533)
  %t534 = load i64, ptr %local.loss.395
  %t535 = call i64 @"print_f64"(i64 %t534)
  %t536 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.81)
  %t537 = ptrtoint ptr %t536 to i64
  %t538 = inttoptr i64 %t537 to ptr
  call void @intrinsic_print(ptr %t538)
  %t539 = load i64, ptr %local.a0.389
  %t540 = call i64 @"print_f64"(i64 %t539)
  %t541 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.82)
  %t542 = ptrtoint ptr %t541 to i64
  %t543 = inttoptr i64 %t542 to ptr
  call void @intrinsic_print(ptr %t543)
  %t544 = load i64, ptr %local.a1.390
  %t545 = call i64 @"print_f64"(i64 %t544)
  %t546 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.83)
  %t547 = ptrtoint ptr %t546 to i64
  %t548 = inttoptr i64 %t547 to ptr
  call void @intrinsic_print(ptr %t548)
  %t549 = load i64, ptr %local.a2.391
  %t550 = call i64 @"print_f64"(i64 %t549)
  %t551 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.84)
  %t552 = ptrtoint ptr %t551 to i64
  %t553 = inttoptr i64 %t552 to ptr
  call void @intrinsic_print(ptr %t553)
  %t554 = load i64, ptr %local.a3.392
  %t555 = call i64 @"print_f64"(i64 %t554)
  %t556 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.85)
  %t557 = ptrtoint ptr %t556 to i64
  %t558 = inttoptr i64 %t557 to ptr
  call void @intrinsic_println(ptr %t558)
  br label %then19_end
then19_end:
  br label %endif19
else19:
  br label %else19_end
else19_end:
  br label %endif19
endif19:
  %t559 = phi i64 [ 0, %then19_end ], [ 0, %else19_end ]
  %t560 = load i64, ptr %local.cycle.394
  %t561 = icmp eq i64 %t560, 19
  %t562 = zext i1 %t561 to i64
  %t563 = icmp ne i64 %t562, 0
  br i1 %t563, label %then20, label %else20
then20:
  %t564 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.86)
  %t565 = ptrtoint ptr %t564 to i64
  %t566 = inttoptr i64 %t565 to ptr
  call void @intrinsic_print(ptr %t566)
  %t567 = load i64, ptr %local.loss.395
  %t568 = call i64 @"print_f64"(i64 %t567)
  %t569 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.87)
  %t570 = ptrtoint ptr %t569 to i64
  %t571 = inttoptr i64 %t570 to ptr
  call void @intrinsic_print(ptr %t571)
  %t572 = load i64, ptr %local.a0.389
  %t573 = call i64 @"print_f64"(i64 %t572)
  %t574 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.88)
  %t575 = ptrtoint ptr %t574 to i64
  %t576 = inttoptr i64 %t575 to ptr
  call void @intrinsic_print(ptr %t576)
  %t577 = load i64, ptr %local.a1.390
  %t578 = call i64 @"print_f64"(i64 %t577)
  %t579 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.89)
  %t580 = ptrtoint ptr %t579 to i64
  %t581 = inttoptr i64 %t580 to ptr
  call void @intrinsic_print(ptr %t581)
  %t582 = load i64, ptr %local.a2.391
  %t583 = call i64 @"print_f64"(i64 %t582)
  %t584 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.90)
  %t585 = ptrtoint ptr %t584 to i64
  %t586 = inttoptr i64 %t585 to ptr
  call void @intrinsic_print(ptr %t586)
  %t587 = load i64, ptr %local.a3.392
  %t588 = call i64 @"print_f64"(i64 %t587)
  %t589 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.91)
  %t590 = ptrtoint ptr %t589 to i64
  %t591 = inttoptr i64 %t590 to ptr
  call void @intrinsic_println(ptr %t591)
  br label %then20_end
then20_end:
  br label %endif20
else20:
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t592 = phi i64 [ 0, %then20_end ], [ 0, %else20_end ]
  %t593 = load i64, ptr %local.cycle.394
  %t594 = icmp eq i64 %t593, 39
  %t595 = zext i1 %t594 to i64
  %t596 = icmp ne i64 %t595, 0
  br i1 %t596, label %then21, label %else21
then21:
  %t597 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.92)
  %t598 = ptrtoint ptr %t597 to i64
  %t599 = inttoptr i64 %t598 to ptr
  call void @intrinsic_print(ptr %t599)
  %t600 = load i64, ptr %local.loss.395
  %t601 = call i64 @"print_f64"(i64 %t600)
  %t602 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.93)
  %t603 = ptrtoint ptr %t602 to i64
  %t604 = inttoptr i64 %t603 to ptr
  call void @intrinsic_print(ptr %t604)
  %t605 = load i64, ptr %local.a0.389
  %t606 = call i64 @"print_f64"(i64 %t605)
  %t607 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.94)
  %t608 = ptrtoint ptr %t607 to i64
  %t609 = inttoptr i64 %t608 to ptr
  call void @intrinsic_print(ptr %t609)
  %t610 = load i64, ptr %local.a1.390
  %t611 = call i64 @"print_f64"(i64 %t610)
  %t612 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.95)
  %t613 = ptrtoint ptr %t612 to i64
  %t614 = inttoptr i64 %t613 to ptr
  call void @intrinsic_print(ptr %t614)
  %t615 = load i64, ptr %local.a2.391
  %t616 = call i64 @"print_f64"(i64 %t615)
  %t617 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.96)
  %t618 = ptrtoint ptr %t617 to i64
  %t619 = inttoptr i64 %t618 to ptr
  call void @intrinsic_print(ptr %t619)
  %t620 = load i64, ptr %local.a3.392
  %t621 = call i64 @"print_f64"(i64 %t620)
  %t622 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.97)
  %t623 = ptrtoint ptr %t622 to i64
  %t624 = inttoptr i64 %t623 to ptr
  call void @intrinsic_println(ptr %t624)
  br label %then21_end
then21_end:
  br label %endif21
else21:
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t625 = phi i64 [ 0, %then21_end ], [ 0, %else21_end ]
  %t626 = load i64, ptr %local.cycle.394
  %t627 = add i64 %t626, 1
  store i64 %t627, ptr %local.cycle.394
  br label %loop18
endloop18:
  %t628 = load i64, ptr %local.a0.389
  %t629 = load i64, ptr %local.a1.390
  %t630 = load i64, ptr %local.a2.391
  %t631 = load i64, ptr %local.a3.392
  %t632 = load i64, ptr %local.obs.384
  %t633 = call i64 @"chain_loss_avg"(i64 %t628, i64 %t629, i64 %t630, i64 %t631, i64 %t632)
  store i64 %t633, ptr %local.loss_learned.396
  %t634 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.98)
  %t635 = ptrtoint ptr %t634 to i64
  %t636 = inttoptr i64 %t635 to ptr
  call void @intrinsic_println(ptr %t636)
  %t637 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.99)
  %t638 = ptrtoint ptr %t637 to i64
  %t639 = inttoptr i64 %t638 to ptr
  call void @intrinsic_println(ptr %t639)
  %t640 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.100)
  %t641 = ptrtoint ptr %t640 to i64
  %t642 = inttoptr i64 %t641 to ptr
  call void @intrinsic_print(ptr %t642)
  %t643 = load i64, ptr %local.loss_learned.396
  %t644 = call i64 @"print_f64"(i64 %t643)
  %t645 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.101)
  %t646 = ptrtoint ptr %t645 to i64
  %t647 = inttoptr i64 %t646 to ptr
  call void @intrinsic_println(ptr %t647)
  %t648 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.102)
  %t649 = ptrtoint ptr %t648 to i64
  %t650 = inttoptr i64 %t649 to ptr
  call void @intrinsic_print(ptr %t650)
  %t651 = load i64, ptr %local.a0.389
  %t652 = call i64 @"print_f64"(i64 %t651)
  %t653 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.103)
  %t654 = ptrtoint ptr %t653 to i64
  %t655 = inttoptr i64 %t654 to ptr
  call void @intrinsic_println(ptr %t655)
  %t656 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.104)
  %t657 = ptrtoint ptr %t656 to i64
  %t658 = inttoptr i64 %t657 to ptr
  call void @intrinsic_print(ptr %t658)
  %t659 = load i64, ptr %local.a1.390
  %t660 = call i64 @"print_f64"(i64 %t659)
  %t661 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.105)
  %t662 = ptrtoint ptr %t661 to i64
  %t663 = inttoptr i64 %t662 to ptr
  call void @intrinsic_println(ptr %t663)
  %t664 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.106)
  %t665 = ptrtoint ptr %t664 to i64
  %t666 = inttoptr i64 %t665 to ptr
  call void @intrinsic_print(ptr %t666)
  %t667 = load i64, ptr %local.a2.391
  %t668 = call i64 @"print_f64"(i64 %t667)
  %t669 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.107)
  %t670 = ptrtoint ptr %t669 to i64
  %t671 = inttoptr i64 %t670 to ptr
  call void @intrinsic_println(ptr %t671)
  %t672 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.108)
  %t673 = ptrtoint ptr %t672 to i64
  %t674 = inttoptr i64 %t673 to ptr
  call void @intrinsic_print(ptr %t674)
  %t675 = load i64, ptr %local.a3.392
  %t676 = call i64 @"print_f64"(i64 %t675)
  %t677 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.109)
  %t678 = ptrtoint ptr %t677 to i64
  %t679 = inttoptr i64 %t678 to ptr
  call void @intrinsic_println(ptr %t679)
  %t680 = load i64, ptr %local.a0.389
  %t681 = load i64, ptr %local.a3.392
  %t682 = call i64 @"sx_f64_gt"(i64 %t680, i64 %t681)
  %t683 = icmp ne i64 %t682, 0
  br i1 %t683, label %then22, label %else22
then22:
  %t684 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.110)
  %t685 = ptrtoint ptr %t684 to i64
  %t686 = inttoptr i64 %t685 to ptr
  call void @intrinsic_println(ptr %t686)
  br label %then22_end
then22_end:
  br label %endif22
else22:
  br label %else22_end
else22_end:
  br label %endif22
endif22:
  %t687 = phi i64 [ 0, %then22_end ], [ 0, %else22_end ]
  %t688 = load i64, ptr %local.loss_learned.396
  %t689 = load i64, ptr %local.loss_none.387
  %t690 = call i64 @"sx_f64_lt"(i64 %t688, i64 %t689)
  %t691 = icmp ne i64 %t690, 0
  br i1 %t691, label %then23, label %else23
then23:
  %t692 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.111)
  %t693 = ptrtoint ptr %t692 to i64
  %t694 = inttoptr i64 %t693 to ptr
  call void @intrinsic_println(ptr %t694)
  br label %then23_end
then23_end:
  br label %endif23
else23:
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t695 = phi i64 [ 0, %then23_end ], [ 0, %else23_end ]
  %t696 = load i64, ptr %local.loss_learned.396
  %t697 = load i64, ptr %local.loss_unif.388
  %t698 = call i64 @"sx_f64_lt"(i64 %t696, i64 %t697)
  %t699 = icmp ne i64 %t698, 0
  br i1 %t699, label %then24, label %else24
then24:
  %t700 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.112)
  %t701 = ptrtoint ptr %t700 to i64
  %t702 = inttoptr i64 %t701 to ptr
  call void @intrinsic_println(ptr %t702)
  br label %then24_end
then24_end:
  br label %endif24
else24:
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t703 = phi i64 [ 0, %then24_end ], [ 0, %else24_end ]
  %t704 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.113)
  %t705 = ptrtoint ptr %t704 to i64
  %t706 = inttoptr i64 %t705 to ptr
  call void @intrinsic_println(ptr %t706)
  ret i64 0
}

define i64 @"train_circular"(i64 %a_ab, i64 %a_bc, i64 %a_ca, i64 %obs, i64 %seed) nounwind {
entry:
  %local.al_a.707 = alloca i64
  %local.be_a.708 = alloca i64
  %local.al_b.709 = alloca i64
  %local.be_b.710 = alloca i64
  %local.al_c.711 = alloca i64
  %local.be_c.712 = alloca i64
  %local.rng.713 = alloca i64
  %local.step.714 = alloca i64
  %local.boost.715 = alloca i64
  %local.t_a.716 = alloca i64
  %local.t_b.717 = alloca i64
  %local.t_c.718 = alloca i64
  %local.ea.719 = alloca i64
  %local.eb.720 = alloca i64
  %local.ec.721 = alloca i64
  %local.a_ab = alloca i64
  store i64 %a_ab, ptr %local.a_ab
  %local.a_bc = alloca i64
  store i64 %a_bc, ptr %local.a_bc
  %local.a_ca = alloca i64
  store i64 %a_ca, ptr %local.a_ca
  %local.obs = alloca i64
  store i64 %obs, ptr %local.obs
  %local.seed = alloca i64
  store i64 %seed, ptr %local.seed
  %t722 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.114)
  store i64 %t722, ptr %local.al_a.707
  %t723 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.115)
  store i64 %t723, ptr %local.be_a.708
  %t724 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.116)
  store i64 %t724, ptr %local.al_b.709
  %t725 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.117)
  store i64 %t725, ptr %local.be_b.710
  %t726 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.118)
  store i64 %t726, ptr %local.al_c.711
  %t727 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.119)
  store i64 %t727, ptr %local.be_c.712
  %t728 = load i64, ptr %local.seed
  store i64 %t728, ptr %local.rng.713
  store i64 0, ptr %local.step.714
  %t729 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.120)
  store i64 %t729, ptr %local.boost.715
  %t730 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.121)
  store i64 %t730, ptr %local.t_a.716
  %t731 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.122)
  store i64 %t731, ptr %local.t_b.717
  %t732 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.123)
  store i64 %t732, ptr %local.t_c.718
  br label %loop25
loop25:
  %t733 = load i64, ptr %local.step.714
  %t734 = load i64, ptr %local.obs
  %t735 = icmp slt i64 %t733, %t734
  %t736 = zext i1 %t735 to i64
  %t737 = icmp ne i64 %t736, 0
  br i1 %t737, label %body25, label %endloop25
body25:
  %t738 = load i64, ptr %local.rng.713
  %t739 = call i64 @"lcg_next"(i64 %t738)
  store i64 %t739, ptr %local.rng.713
  %t740 = load i64, ptr %local.rng.713
  %t741 = call i64 @"lcg_f64"(i64 %t740)
  %t742 = load i64, ptr %local.t_a.716
  %t743 = call i64 @"sx_f64_lt"(i64 %t741, i64 %t742)
  %t744 = icmp ne i64 %t743, 0
  br i1 %t744, label %then26, label %else26
then26:
  %t745 = load i64, ptr %local.al_a.707
  %t746 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.124)
  %t747 = call i64 @"sx_f64_add"(i64 %t745, i64 %t746)
  store i64 %t747, ptr %local.al_a.707
  %t748 = load i64, ptr %local.a_ab
  %t749 = load i64, ptr %local.al_a.707
  %t750 = load i64, ptr %local.be_a.708
  %t751 = call i64 @"beta_mean"(i64 %t749, i64 %t750)
  %t752 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.125)
  %t753 = call i64 @"sx_f64_sub"(i64 %t751, i64 %t752)
  %t754 = call i64 @"sx_f64_mul"(i64 %t748, i64 %t753)
  %t755 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.126)
  %t756 = call i64 @"sx_f64_mul"(i64 %t754, i64 %t755)
  store i64 %t756, ptr %local.boost.715
  %t757 = load i64, ptr %local.boost.715
  %t758 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.127)
  %t759 = call i64 @"sx_f64_gt"(i64 %t757, i64 %t758)
  %t760 = icmp ne i64 %t759, 0
  br i1 %t760, label %then27, label %else27
then27:
  %t761 = load i64, ptr %local.al_b.709
  %t762 = load i64, ptr %local.boost.715
  %t763 = call i64 @"sx_f64_add"(i64 %t761, i64 %t762)
  store i64 %t763, ptr %local.al_b.709
  br label %then27_end
then27_end:
  br label %endif27
else27:
  br label %else27_end
else27_end:
  br label %endif27
endif27:
  %t764 = phi i64 [ 0, %then27_end ], [ 0, %else27_end ]
  br label %then26_end
then26_end:
  br label %endif26
else26:
  %t765 = load i64, ptr %local.be_a.708
  %t766 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.128)
  %t767 = call i64 @"sx_f64_add"(i64 %t765, i64 %t766)
  store i64 %t767, ptr %local.be_a.708
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t768 = phi i64 [ %t764, %then26_end ], [ 0, %else26_end ]
  %t769 = load i64, ptr %local.rng.713
  %t770 = call i64 @"lcg_next"(i64 %t769)
  store i64 %t770, ptr %local.rng.713
  %t771 = load i64, ptr %local.rng.713
  %t772 = call i64 @"lcg_f64"(i64 %t771)
  %t773 = load i64, ptr %local.t_b.717
  %t774 = call i64 @"sx_f64_lt"(i64 %t772, i64 %t773)
  %t775 = icmp ne i64 %t774, 0
  br i1 %t775, label %then28, label %else28
then28:
  %t776 = load i64, ptr %local.al_b.709
  %t777 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.129)
  %t778 = call i64 @"sx_f64_add"(i64 %t776, i64 %t777)
  store i64 %t778, ptr %local.al_b.709
  %t779 = load i64, ptr %local.a_bc
  %t780 = load i64, ptr %local.al_b.709
  %t781 = load i64, ptr %local.be_b.710
  %t782 = call i64 @"beta_mean"(i64 %t780, i64 %t781)
  %t783 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.130)
  %t784 = call i64 @"sx_f64_sub"(i64 %t782, i64 %t783)
  %t785 = call i64 @"sx_f64_mul"(i64 %t779, i64 %t784)
  %t786 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.131)
  %t787 = call i64 @"sx_f64_mul"(i64 %t785, i64 %t786)
  store i64 %t787, ptr %local.boost.715
  %t788 = load i64, ptr %local.boost.715
  %t789 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.132)
  %t790 = call i64 @"sx_f64_gt"(i64 %t788, i64 %t789)
  %t791 = icmp ne i64 %t790, 0
  br i1 %t791, label %then29, label %else29
then29:
  %t792 = load i64, ptr %local.al_c.711
  %t793 = load i64, ptr %local.boost.715
  %t794 = call i64 @"sx_f64_add"(i64 %t792, i64 %t793)
  store i64 %t794, ptr %local.al_c.711
  br label %then29_end
then29_end:
  br label %endif29
else29:
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t795 = phi i64 [ 0, %then29_end ], [ 0, %else29_end ]
  br label %then28_end
then28_end:
  br label %endif28
else28:
  %t796 = load i64, ptr %local.be_b.710
  %t797 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.133)
  %t798 = call i64 @"sx_f64_add"(i64 %t796, i64 %t797)
  store i64 %t798, ptr %local.be_b.710
  br label %else28_end
else28_end:
  br label %endif28
endif28:
  %t799 = phi i64 [ %t795, %then28_end ], [ 0, %else28_end ]
  %t800 = load i64, ptr %local.rng.713
  %t801 = call i64 @"lcg_next"(i64 %t800)
  store i64 %t801, ptr %local.rng.713
  %t802 = load i64, ptr %local.rng.713
  %t803 = call i64 @"lcg_f64"(i64 %t802)
  %t804 = load i64, ptr %local.t_c.718
  %t805 = call i64 @"sx_f64_lt"(i64 %t803, i64 %t804)
  %t806 = icmp ne i64 %t805, 0
  br i1 %t806, label %then30, label %else30
then30:
  %t807 = load i64, ptr %local.al_c.711
  %t808 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.134)
  %t809 = call i64 @"sx_f64_add"(i64 %t807, i64 %t808)
  store i64 %t809, ptr %local.al_c.711
  %t810 = load i64, ptr %local.a_ca
  %t811 = load i64, ptr %local.al_c.711
  %t812 = load i64, ptr %local.be_c.712
  %t813 = call i64 @"beta_mean"(i64 %t811, i64 %t812)
  %t814 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.135)
  %t815 = call i64 @"sx_f64_sub"(i64 %t813, i64 %t814)
  %t816 = call i64 @"sx_f64_mul"(i64 %t810, i64 %t815)
  %t817 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.136)
  %t818 = call i64 @"sx_f64_mul"(i64 %t816, i64 %t817)
  store i64 %t818, ptr %local.boost.715
  %t819 = load i64, ptr %local.boost.715
  %t820 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.137)
  %t821 = call i64 @"sx_f64_gt"(i64 %t819, i64 %t820)
  %t822 = icmp ne i64 %t821, 0
  br i1 %t822, label %then31, label %else31
then31:
  %t823 = load i64, ptr %local.al_a.707
  %t824 = load i64, ptr %local.boost.715
  %t825 = call i64 @"sx_f64_add"(i64 %t823, i64 %t824)
  store i64 %t825, ptr %local.al_a.707
  br label %then31_end
then31_end:
  br label %endif31
else31:
  br label %else31_end
else31_end:
  br label %endif31
endif31:
  %t826 = phi i64 [ 0, %then31_end ], [ 0, %else31_end ]
  br label %then30_end
then30_end:
  br label %endif30
else30:
  %t827 = load i64, ptr %local.be_c.712
  %t828 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.138)
  %t829 = call i64 @"sx_f64_add"(i64 %t827, i64 %t828)
  store i64 %t829, ptr %local.be_c.712
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t830 = phi i64 [ %t826, %then30_end ], [ 0, %else30_end ]
  %t831 = load i64, ptr %local.step.714
  %t832 = add i64 %t831, 1
  store i64 %t832, ptr %local.step.714
  br label %loop25
endloop25:
  %t833 = load i64, ptr %local.al_a.707
  %t834 = load i64, ptr %local.be_a.708
  %t835 = call i64 @"beta_mean"(i64 %t833, i64 %t834)
  %t836 = load i64, ptr %local.t_a.716
  %t837 = call i64 @"sx_f64_sub"(i64 %t835, i64 %t836)
  store i64 %t837, ptr %local.ea.719
  %t838 = load i64, ptr %local.al_b.709
  %t839 = load i64, ptr %local.be_b.710
  %t840 = call i64 @"beta_mean"(i64 %t838, i64 %t839)
  %t841 = load i64, ptr %local.t_b.717
  %t842 = call i64 @"sx_f64_sub"(i64 %t840, i64 %t841)
  store i64 %t842, ptr %local.eb.720
  %t843 = load i64, ptr %local.al_c.711
  %t844 = load i64, ptr %local.be_c.712
  %t845 = call i64 @"beta_mean"(i64 %t843, i64 %t844)
  %t846 = load i64, ptr %local.t_c.718
  %t847 = call i64 @"sx_f64_sub"(i64 %t845, i64 %t846)
  store i64 %t847, ptr %local.ec.721
  %t848 = load i64, ptr %local.ea.719
  %t849 = load i64, ptr %local.ea.719
  %t850 = call i64 @"sx_f64_mul"(i64 %t848, i64 %t849)
  %t851 = load i64, ptr %local.eb.720
  %t852 = load i64, ptr %local.eb.720
  %t853 = call i64 @"sx_f64_mul"(i64 %t851, i64 %t852)
  %t854 = call i64 @"sx_f64_add"(i64 %t850, i64 %t853)
  %t855 = load i64, ptr %local.ec.721
  %t856 = load i64, ptr %local.ec.721
  %t857 = call i64 @"sx_f64_mul"(i64 %t855, i64 %t856)
  %t858 = call i64 @"sx_f64_add"(i64 %t854, i64 %t857)
  ret i64 %t858
}

define i64 @"circ_loss_avg"(i64 %a_ab, i64 %a_bc, i64 %a_ca, i64 %obs) nounwind {
entry:
  %local.l1.859 = alloca i64
  %local.l2.860 = alloca i64
  %local.l3.861 = alloca i64
  %local.a_ab = alloca i64
  store i64 %a_ab, ptr %local.a_ab
  %local.a_bc = alloca i64
  store i64 %a_bc, ptr %local.a_bc
  %local.a_ca = alloca i64
  store i64 %a_ca, ptr %local.a_ca
  %local.obs = alloca i64
  store i64 %obs, ptr %local.obs
  %t862 = load i64, ptr %local.a_ab
  %t863 = load i64, ptr %local.a_bc
  %t864 = load i64, ptr %local.a_ca
  %t865 = load i64, ptr %local.obs
  %t866 = call i64 @"train_circular"(i64 %t862, i64 %t863, i64 %t864, i64 %t865, i64 42)
  store i64 %t866, ptr %local.l1.859
  %t867 = load i64, ptr %local.a_ab
  %t868 = load i64, ptr %local.a_bc
  %t869 = load i64, ptr %local.a_ca
  %t870 = load i64, ptr %local.obs
  %t871 = call i64 @"train_circular"(i64 %t867, i64 %t868, i64 %t869, i64 %t870, i64 137)
  store i64 %t871, ptr %local.l2.860
  %t872 = load i64, ptr %local.a_ab
  %t873 = load i64, ptr %local.a_bc
  %t874 = load i64, ptr %local.a_ca
  %t875 = load i64, ptr %local.obs
  %t876 = call i64 @"train_circular"(i64 %t872, i64 %t873, i64 %t874, i64 %t875, i64 999)
  store i64 %t876, ptr %local.l3.861
  %t877 = load i64, ptr %local.l1.859
  %t878 = load i64, ptr %local.l2.860
  %t879 = call i64 @"sx_f64_add"(i64 %t877, i64 %t878)
  %t880 = load i64, ptr %local.l3.861
  %t881 = call i64 @"sx_f64_add"(i64 %t879, i64 %t880)
  %t882 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.139)
  %t883 = call i64 @"sx_f64_div"(i64 %t881, i64 %t882)
  ret i64 %t883
}

define i64 @"mg_circ"(i64 %ab, i64 %bc, i64 %ca, i64 %which, i64 %obs) nounwind {
entry:
  %local.h.884 = alloca i64
  %local.abp.885 = alloca i64
  %local.bcp.886 = alloca i64
  %local.cap.887 = alloca i64
  %local.abm.888 = alloca i64
  %local.bcm.889 = alloca i64
  %local.cam.890 = alloca i64
  %local.lp.891 = alloca i64
  %local.lm.892 = alloca i64
  %local.ab = alloca i64
  store i64 %ab, ptr %local.ab
  %local.bc = alloca i64
  store i64 %bc, ptr %local.bc
  %local.ca = alloca i64
  store i64 %ca, ptr %local.ca
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %local.obs = alloca i64
  store i64 %obs, ptr %local.obs
  %t893 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.140)
  store i64 %t893, ptr %local.h.884
  %t894 = load i64, ptr %local.ab
  store i64 %t894, ptr %local.abp.885
  %t895 = load i64, ptr %local.bc
  store i64 %t895, ptr %local.bcp.886
  %t896 = load i64, ptr %local.ca
  store i64 %t896, ptr %local.cap.887
  %t897 = load i64, ptr %local.ab
  store i64 %t897, ptr %local.abm.888
  %t898 = load i64, ptr %local.bc
  store i64 %t898, ptr %local.bcm.889
  %t899 = load i64, ptr %local.ca
  store i64 %t899, ptr %local.cam.890
  %t900 = load i64, ptr %local.which
  %t901 = icmp eq i64 %t900, 0
  %t902 = zext i1 %t901 to i64
  %t903 = icmp ne i64 %t902, 0
  br i1 %t903, label %then32, label %else32
then32:
  %t904 = load i64, ptr %local.ab
  %t905 = load i64, ptr %local.h.884
  %t906 = call i64 @"sx_f64_add"(i64 %t904, i64 %t905)
  store i64 %t906, ptr %local.abp.885
  %t907 = load i64, ptr %local.ab
  %t908 = load i64, ptr %local.h.884
  %t909 = call i64 @"sx_f64_sub"(i64 %t907, i64 %t908)
  store i64 %t909, ptr %local.abm.888
  br label %then32_end
then32_end:
  br label %endif32
else32:
  br label %else32_end
else32_end:
  br label %endif32
endif32:
  %t910 = phi i64 [ 0, %then32_end ], [ 0, %else32_end ]
  %t911 = load i64, ptr %local.which
  %t912 = icmp eq i64 %t911, 1
  %t913 = zext i1 %t912 to i64
  %t914 = icmp ne i64 %t913, 0
  br i1 %t914, label %then33, label %else33
then33:
  %t915 = load i64, ptr %local.bc
  %t916 = load i64, ptr %local.h.884
  %t917 = call i64 @"sx_f64_add"(i64 %t915, i64 %t916)
  store i64 %t917, ptr %local.bcp.886
  %t918 = load i64, ptr %local.bc
  %t919 = load i64, ptr %local.h.884
  %t920 = call i64 @"sx_f64_sub"(i64 %t918, i64 %t919)
  store i64 %t920, ptr %local.bcm.889
  br label %then33_end
then33_end:
  br label %endif33
else33:
  br label %else33_end
else33_end:
  br label %endif33
endif33:
  %t921 = phi i64 [ 0, %then33_end ], [ 0, %else33_end ]
  %t922 = load i64, ptr %local.which
  %t923 = icmp eq i64 %t922, 2
  %t924 = zext i1 %t923 to i64
  %t925 = icmp ne i64 %t924, 0
  br i1 %t925, label %then34, label %else34
then34:
  %t926 = load i64, ptr %local.ca
  %t927 = load i64, ptr %local.h.884
  %t928 = call i64 @"sx_f64_add"(i64 %t926, i64 %t927)
  store i64 %t928, ptr %local.cap.887
  %t929 = load i64, ptr %local.ca
  %t930 = load i64, ptr %local.h.884
  %t931 = call i64 @"sx_f64_sub"(i64 %t929, i64 %t930)
  store i64 %t931, ptr %local.cam.890
  br label %then34_end
then34_end:
  br label %endif34
else34:
  br label %else34_end
else34_end:
  br label %endif34
endif34:
  %t932 = phi i64 [ 0, %then34_end ], [ 0, %else34_end ]
  %t933 = load i64, ptr %local.abp.885
  %t934 = load i64, ptr %local.bcp.886
  %t935 = load i64, ptr %local.cap.887
  %t936 = load i64, ptr %local.obs
  %t937 = call i64 @"circ_loss_avg"(i64 %t933, i64 %t934, i64 %t935, i64 %t936)
  store i64 %t937, ptr %local.lp.891
  %t938 = load i64, ptr %local.abm.888
  %t939 = load i64, ptr %local.bcm.889
  %t940 = load i64, ptr %local.cam.890
  %t941 = load i64, ptr %local.obs
  %t942 = call i64 @"circ_loss_avg"(i64 %t938, i64 %t939, i64 %t940, i64 %t941)
  store i64 %t942, ptr %local.lm.892
  %t943 = load i64, ptr %local.lp.891
  %t944 = load i64, ptr %local.lm.892
  %t945 = call i64 @"sx_f64_sub"(i64 %t943, i64 %t944)
  %t946 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.141)
  %t947 = load i64, ptr %local.h.884
  %t948 = call i64 @"sx_f64_mul"(i64 %t946, i64 %t947)
  %t949 = call i64 @"sx_f64_div"(i64 %t945, i64 %t948)
  ret i64 %t949
}

define i64 @"run_exp2"() nounwind {
entry:
  %local.obs.950 = alloca i64
  %local.meta_cycles.951 = alloca i64
  %local.meta_lr.952 = alloca i64
  %local.loss_none.953 = alloca i64
  %local.loss_unif.954 = alloca i64
  %local.ab.955 = alloca i64
  %local.bc.956 = alloca i64
  %local.ca.957 = alloca i64
  %local.mg.958 = alloca i64
  %local.cycle.959 = alloca i64
  %local.loss.960 = alloca i64
  %local.prev_ab.961 = alloca i64
  %local.prev_bc.962 = alloca i64
  %local.prev_ca.963 = alloca i64
  %local.osc_count.964 = alloca i64
  %local.loss_learned.965 = alloca i64
  %local.min_alpha.966 = alloca i64
  %local.broke_cycle.967 = alloca i64
  %t968 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.142)
  %t969 = ptrtoint ptr %t968 to i64
  %t970 = inttoptr i64 %t969 to ptr
  call void @intrinsic_println(ptr %t970)
  %t971 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.143)
  %t972 = ptrtoint ptr %t971 to i64
  %t973 = inttoptr i64 %t972 to ptr
  call void @intrinsic_println(ptr %t973)
  %t974 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.144)
  %t975 = ptrtoint ptr %t974 to i64
  %t976 = inttoptr i64 %t975 to ptr
  call void @intrinsic_println(ptr %t976)
  %t977 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.145)
  %t978 = ptrtoint ptr %t977 to i64
  %t979 = inttoptr i64 %t978 to ptr
  call void @intrinsic_println(ptr %t979)
  %t980 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.146)
  %t981 = ptrtoint ptr %t980 to i64
  %t982 = inttoptr i64 %t981 to ptr
  call void @intrinsic_println(ptr %t982)
  store i64 150, ptr %local.obs.950
  store i64 40, ptr %local.meta_cycles.951
  %t983 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.147)
  store i64 %t983, ptr %local.meta_lr.952
  %t984 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.148)
  %t985 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.149)
  %t986 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.150)
  %t987 = load i64, ptr %local.obs.950
  %t988 = call i64 @"circ_loss_avg"(i64 %t984, i64 %t985, i64 %t986, i64 %t987)
  store i64 %t988, ptr %local.loss_none.953
  %t989 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.151)
  %t990 = ptrtoint ptr %t989 to i64
  %t991 = inttoptr i64 %t990 to ptr
  call void @intrinsic_print(ptr %t991)
  %t992 = load i64, ptr %local.loss_none.953
  %t993 = call i64 @"print_f64"(i64 %t992)
  %t994 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.152)
  %t995 = ptrtoint ptr %t994 to i64
  %t996 = inttoptr i64 %t995 to ptr
  call void @intrinsic_println(ptr %t996)
  %t997 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.153)
  %t998 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.154)
  %t999 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.155)
  %t1000 = load i64, ptr %local.obs.950
  %t1001 = call i64 @"circ_loss_avg"(i64 %t997, i64 %t998, i64 %t999, i64 %t1000)
  store i64 %t1001, ptr %local.loss_unif.954
  %t1002 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.156)
  %t1003 = ptrtoint ptr %t1002 to i64
  %t1004 = inttoptr i64 %t1003 to ptr
  call void @intrinsic_print(ptr %t1004)
  %t1005 = load i64, ptr %local.loss_unif.954
  %t1006 = call i64 @"print_f64"(i64 %t1005)
  %t1007 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.157)
  %t1008 = ptrtoint ptr %t1007 to i64
  %t1009 = inttoptr i64 %t1008 to ptr
  call void @intrinsic_println(ptr %t1009)
  %t1010 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.158)
  store i64 %t1010, ptr %local.ab.955
  %t1011 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.159)
  store i64 %t1011, ptr %local.bc.956
  %t1012 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.160)
  store i64 %t1012, ptr %local.ca.957
  %t1013 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.161)
  store i64 %t1013, ptr %local.mg.958
  store i64 0, ptr %local.cycle.959
  %t1014 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.162)
  store i64 %t1014, ptr %local.loss.960
  %t1015 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.163)
  store i64 %t1015, ptr %local.prev_ab.961
  %t1016 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.164)
  store i64 %t1016, ptr %local.prev_bc.962
  %t1017 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.165)
  store i64 %t1017, ptr %local.prev_ca.963
  store i64 0, ptr %local.osc_count.964
  %t1018 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.166)
  %t1019 = ptrtoint ptr %t1018 to i64
  %t1020 = inttoptr i64 %t1019 to ptr
  call void @intrinsic_println(ptr %t1020)
  %t1021 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.167)
  %t1022 = ptrtoint ptr %t1021 to i64
  %t1023 = inttoptr i64 %t1022 to ptr
  call void @intrinsic_println(ptr %t1023)
  %t1024 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.168)
  %t1025 = ptrtoint ptr %t1024 to i64
  %t1026 = inttoptr i64 %t1025 to ptr
  call void @intrinsic_println(ptr %t1026)
  br label %loop35
loop35:
  %t1027 = load i64, ptr %local.cycle.959
  %t1028 = load i64, ptr %local.meta_cycles.951
  %t1029 = icmp slt i64 %t1027, %t1028
  %t1030 = zext i1 %t1029 to i64
  %t1031 = icmp ne i64 %t1030, 0
  br i1 %t1031, label %body35, label %endloop35
body35:
  %t1032 = load i64, ptr %local.ab.955
  store i64 %t1032, ptr %local.prev_ab.961
  %t1033 = load i64, ptr %local.bc.956
  store i64 %t1033, ptr %local.prev_bc.962
  %t1034 = load i64, ptr %local.ca.957
  store i64 %t1034, ptr %local.prev_ca.963
  %t1035 = load i64, ptr %local.ab.955
  %t1036 = load i64, ptr %local.bc.956
  %t1037 = load i64, ptr %local.ca.957
  %t1038 = load i64, ptr %local.obs.950
  %t1039 = call i64 @"mg_circ"(i64 %t1035, i64 %t1036, i64 %t1037, i64 0, i64 %t1038)
  store i64 %t1039, ptr %local.mg.958
  %t1040 = load i64, ptr %local.ab.955
  %t1041 = load i64, ptr %local.meta_lr.952
  %t1042 = load i64, ptr %local.mg.958
  %t1043 = call i64 @"sx_f64_mul"(i64 %t1041, i64 %t1042)
  %t1044 = call i64 @"sx_f64_sub"(i64 %t1040, i64 %t1043)
  %t1045 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.169)
  %t1046 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.170)
  %t1047 = call i64 @"clamp"(i64 %t1044, i64 %t1045, i64 %t1046)
  store i64 %t1047, ptr %local.ab.955
  %t1048 = load i64, ptr %local.ab.955
  %t1049 = load i64, ptr %local.bc.956
  %t1050 = load i64, ptr %local.ca.957
  %t1051 = load i64, ptr %local.obs.950
  %t1052 = call i64 @"mg_circ"(i64 %t1048, i64 %t1049, i64 %t1050, i64 1, i64 %t1051)
  store i64 %t1052, ptr %local.mg.958
  %t1053 = load i64, ptr %local.bc.956
  %t1054 = load i64, ptr %local.meta_lr.952
  %t1055 = load i64, ptr %local.mg.958
  %t1056 = call i64 @"sx_f64_mul"(i64 %t1054, i64 %t1055)
  %t1057 = call i64 @"sx_f64_sub"(i64 %t1053, i64 %t1056)
  %t1058 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.171)
  %t1059 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.172)
  %t1060 = call i64 @"clamp"(i64 %t1057, i64 %t1058, i64 %t1059)
  store i64 %t1060, ptr %local.bc.956
  %t1061 = load i64, ptr %local.ab.955
  %t1062 = load i64, ptr %local.bc.956
  %t1063 = load i64, ptr %local.ca.957
  %t1064 = load i64, ptr %local.obs.950
  %t1065 = call i64 @"mg_circ"(i64 %t1061, i64 %t1062, i64 %t1063, i64 2, i64 %t1064)
  store i64 %t1065, ptr %local.mg.958
  %t1066 = load i64, ptr %local.ca.957
  %t1067 = load i64, ptr %local.meta_lr.952
  %t1068 = load i64, ptr %local.mg.958
  %t1069 = call i64 @"sx_f64_mul"(i64 %t1067, i64 %t1068)
  %t1070 = call i64 @"sx_f64_sub"(i64 %t1066, i64 %t1069)
  %t1071 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.173)
  %t1072 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.174)
  %t1073 = call i64 @"clamp"(i64 %t1070, i64 %t1071, i64 %t1072)
  store i64 %t1073, ptr %local.ca.957
  %t1074 = load i64, ptr %local.ab.955
  %t1075 = load i64, ptr %local.bc.956
  %t1076 = load i64, ptr %local.ca.957
  %t1077 = load i64, ptr %local.obs.950
  %t1078 = call i64 @"circ_loss_avg"(i64 %t1074, i64 %t1075, i64 %t1076, i64 %t1077)
  store i64 %t1078, ptr %local.loss.960
  %t1079 = load i64, ptr %local.cycle.959
  %t1080 = icmp sgt i64 %t1079, 1
  %t1081 = zext i1 %t1080 to i64
  %t1082 = icmp ne i64 %t1081, 0
  br i1 %t1082, label %then36, label %else36
then36:
  %t1083 = load i64, ptr %local.ab.955
  %t1084 = load i64, ptr %local.prev_ab.961
  %t1085 = call i64 @"sx_f64_sub"(i64 %t1083, i64 %t1084)
  %t1086 = load i64, ptr %local.prev_ab.961
  %t1087 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.175)
  %t1088 = call i64 @"sx_f64_sub"(i64 %t1086, i64 %t1087)
  %t1089 = call i64 @"sx_f64_mul"(i64 %t1085, i64 %t1088)
  %t1090 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.176)
  %t1091 = call i64 @"sx_f64_lt"(i64 %t1089, i64 %t1090)
  %t1092 = icmp ne i64 %t1091, 0
  br i1 %t1092, label %then37, label %else37
then37:
  %t1093 = load i64, ptr %local.osc_count.964
  %t1094 = add i64 %t1093, 1
  store i64 %t1094, ptr %local.osc_count.964
  br label %then37_end
then37_end:
  br label %endif37
else37:
  br label %else37_end
else37_end:
  br label %endif37
endif37:
  %t1095 = phi i64 [ 0, %then37_end ], [ 0, %else37_end ]
  br label %then36_end
then36_end:
  br label %endif36
else36:
  br label %else36_end
else36_end:
  br label %endif36
endif36:
  %t1096 = phi i64 [ %t1095, %then36_end ], [ 0, %else36_end ]
  %t1097 = load i64, ptr %local.cycle.959
  %t1098 = icmp slt i64 %t1097, 5
  %t1099 = zext i1 %t1098 to i64
  %t1100 = icmp ne i64 %t1099, 0
  br i1 %t1100, label %then38, label %else38
then38:
  %t1101 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.177)
  %t1102 = ptrtoint ptr %t1101 to i64
  %t1103 = inttoptr i64 %t1102 to ptr
  call void @intrinsic_print(ptr %t1103)
  %t1104 = load i64, ptr %local.cycle.959
  call void @print_i64(i64 %t1104)
  %t1105 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.178)
  %t1106 = ptrtoint ptr %t1105 to i64
  %t1107 = inttoptr i64 %t1106 to ptr
  call void @intrinsic_print(ptr %t1107)
  %t1108 = load i64, ptr %local.loss.960
  %t1109 = call i64 @"print_f64"(i64 %t1108)
  %t1110 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.179)
  %t1111 = ptrtoint ptr %t1110 to i64
  %t1112 = inttoptr i64 %t1111 to ptr
  call void @intrinsic_print(ptr %t1112)
  %t1113 = load i64, ptr %local.ab.955
  %t1114 = call i64 @"print_f64"(i64 %t1113)
  %t1115 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.180)
  %t1116 = ptrtoint ptr %t1115 to i64
  %t1117 = inttoptr i64 %t1116 to ptr
  call void @intrinsic_print(ptr %t1117)
  %t1118 = load i64, ptr %local.bc.956
  %t1119 = call i64 @"print_f64"(i64 %t1118)
  %t1120 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.181)
  %t1121 = ptrtoint ptr %t1120 to i64
  %t1122 = inttoptr i64 %t1121 to ptr
  call void @intrinsic_print(ptr %t1122)
  %t1123 = load i64, ptr %local.ca.957
  %t1124 = call i64 @"print_f64"(i64 %t1123)
  %t1125 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.182)
  %t1126 = ptrtoint ptr %t1125 to i64
  %t1127 = inttoptr i64 %t1126 to ptr
  call void @intrinsic_println(ptr %t1127)
  br label %then38_end
then38_end:
  br label %endif38
else38:
  br label %else38_end
else38_end:
  br label %endif38
endif38:
  %t1128 = phi i64 [ 0, %then38_end ], [ 0, %else38_end ]
  %t1129 = load i64, ptr %local.cycle.959
  %t1130 = icmp eq i64 %t1129, 19
  %t1131 = zext i1 %t1130 to i64
  %t1132 = icmp ne i64 %t1131, 0
  br i1 %t1132, label %then39, label %else39
then39:
  %t1133 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.183)
  %t1134 = ptrtoint ptr %t1133 to i64
  %t1135 = inttoptr i64 %t1134 to ptr
  call void @intrinsic_print(ptr %t1135)
  %t1136 = load i64, ptr %local.loss.960
  %t1137 = call i64 @"print_f64"(i64 %t1136)
  %t1138 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.184)
  %t1139 = ptrtoint ptr %t1138 to i64
  %t1140 = inttoptr i64 %t1139 to ptr
  call void @intrinsic_print(ptr %t1140)
  %t1141 = load i64, ptr %local.ab.955
  %t1142 = call i64 @"print_f64"(i64 %t1141)
  %t1143 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.185)
  %t1144 = ptrtoint ptr %t1143 to i64
  %t1145 = inttoptr i64 %t1144 to ptr
  call void @intrinsic_print(ptr %t1145)
  %t1146 = load i64, ptr %local.bc.956
  %t1147 = call i64 @"print_f64"(i64 %t1146)
  %t1148 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.186)
  %t1149 = ptrtoint ptr %t1148 to i64
  %t1150 = inttoptr i64 %t1149 to ptr
  call void @intrinsic_print(ptr %t1150)
  %t1151 = load i64, ptr %local.ca.957
  %t1152 = call i64 @"print_f64"(i64 %t1151)
  %t1153 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.187)
  %t1154 = ptrtoint ptr %t1153 to i64
  %t1155 = inttoptr i64 %t1154 to ptr
  call void @intrinsic_println(ptr %t1155)
  br label %then39_end
then39_end:
  br label %endif39
else39:
  br label %else39_end
else39_end:
  br label %endif39
endif39:
  %t1156 = phi i64 [ 0, %then39_end ], [ 0, %else39_end ]
  %t1157 = load i64, ptr %local.cycle.959
  %t1158 = icmp eq i64 %t1157, 39
  %t1159 = zext i1 %t1158 to i64
  %t1160 = icmp ne i64 %t1159, 0
  br i1 %t1160, label %then40, label %else40
then40:
  %t1161 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.188)
  %t1162 = ptrtoint ptr %t1161 to i64
  %t1163 = inttoptr i64 %t1162 to ptr
  call void @intrinsic_print(ptr %t1163)
  %t1164 = load i64, ptr %local.loss.960
  %t1165 = call i64 @"print_f64"(i64 %t1164)
  %t1166 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.189)
  %t1167 = ptrtoint ptr %t1166 to i64
  %t1168 = inttoptr i64 %t1167 to ptr
  call void @intrinsic_print(ptr %t1168)
  %t1169 = load i64, ptr %local.ab.955
  %t1170 = call i64 @"print_f64"(i64 %t1169)
  %t1171 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.190)
  %t1172 = ptrtoint ptr %t1171 to i64
  %t1173 = inttoptr i64 %t1172 to ptr
  call void @intrinsic_print(ptr %t1173)
  %t1174 = load i64, ptr %local.bc.956
  %t1175 = call i64 @"print_f64"(i64 %t1174)
  %t1176 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.191)
  %t1177 = ptrtoint ptr %t1176 to i64
  %t1178 = inttoptr i64 %t1177 to ptr
  call void @intrinsic_print(ptr %t1178)
  %t1179 = load i64, ptr %local.ca.957
  %t1180 = call i64 @"print_f64"(i64 %t1179)
  %t1181 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.192)
  %t1182 = ptrtoint ptr %t1181 to i64
  %t1183 = inttoptr i64 %t1182 to ptr
  call void @intrinsic_println(ptr %t1183)
  br label %then40_end
then40_end:
  br label %endif40
else40:
  br label %else40_end
else40_end:
  br label %endif40
endif40:
  %t1184 = phi i64 [ 0, %then40_end ], [ 0, %else40_end ]
  %t1185 = load i64, ptr %local.cycle.959
  %t1186 = add i64 %t1185, 1
  store i64 %t1186, ptr %local.cycle.959
  br label %loop35
endloop35:
  %t1187 = load i64, ptr %local.ab.955
  %t1188 = load i64, ptr %local.bc.956
  %t1189 = load i64, ptr %local.ca.957
  %t1190 = load i64, ptr %local.obs.950
  %t1191 = call i64 @"circ_loss_avg"(i64 %t1187, i64 %t1188, i64 %t1189, i64 %t1190)
  store i64 %t1191, ptr %local.loss_learned.965
  %t1192 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.193)
  %t1193 = ptrtoint ptr %t1192 to i64
  %t1194 = inttoptr i64 %t1193 to ptr
  call void @intrinsic_println(ptr %t1194)
  %t1195 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.194)
  %t1196 = ptrtoint ptr %t1195 to i64
  %t1197 = inttoptr i64 %t1196 to ptr
  call void @intrinsic_println(ptr %t1197)
  %t1198 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.195)
  %t1199 = ptrtoint ptr %t1198 to i64
  %t1200 = inttoptr i64 %t1199 to ptr
  call void @intrinsic_print(ptr %t1200)
  %t1201 = load i64, ptr %local.loss_learned.965
  %t1202 = call i64 @"print_f64"(i64 %t1201)
  %t1203 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.196)
  %t1204 = ptrtoint ptr %t1203 to i64
  %t1205 = inttoptr i64 %t1204 to ptr
  call void @intrinsic_println(ptr %t1205)
  %t1206 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.197)
  %t1207 = ptrtoint ptr %t1206 to i64
  %t1208 = inttoptr i64 %t1207 to ptr
  call void @intrinsic_print(ptr %t1208)
  %t1209 = load i64, ptr %local.ab.955
  %t1210 = call i64 @"print_f64"(i64 %t1209)
  %t1211 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.198)
  %t1212 = ptrtoint ptr %t1211 to i64
  %t1213 = inttoptr i64 %t1212 to ptr
  call void @intrinsic_println(ptr %t1213)
  %t1214 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.199)
  %t1215 = ptrtoint ptr %t1214 to i64
  %t1216 = inttoptr i64 %t1215 to ptr
  call void @intrinsic_print(ptr %t1216)
  %t1217 = load i64, ptr %local.bc.956
  %t1218 = call i64 @"print_f64"(i64 %t1217)
  %t1219 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.200)
  %t1220 = ptrtoint ptr %t1219 to i64
  %t1221 = inttoptr i64 %t1220 to ptr
  call void @intrinsic_println(ptr %t1221)
  %t1222 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.201)
  %t1223 = ptrtoint ptr %t1222 to i64
  %t1224 = inttoptr i64 %t1223 to ptr
  call void @intrinsic_print(ptr %t1224)
  %t1225 = load i64, ptr %local.ca.957
  %t1226 = call i64 @"print_f64"(i64 %t1225)
  %t1227 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.202)
  %t1228 = ptrtoint ptr %t1227 to i64
  %t1229 = inttoptr i64 %t1228 to ptr
  call void @intrinsic_println(ptr %t1229)
  %t1230 = load i64, ptr %local.ab.955
  store i64 %t1230, ptr %local.min_alpha.966
  store i64 0, ptr %local.broke_cycle.967
  %t1231 = load i64, ptr %local.bc.956
  %t1232 = load i64, ptr %local.min_alpha.966
  %t1233 = call i64 @"sx_f64_lt"(i64 %t1231, i64 %t1232)
  %t1234 = icmp ne i64 %t1233, 0
  br i1 %t1234, label %then41, label %else41
then41:
  %t1235 = load i64, ptr %local.bc.956
  %t1236 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.203)
  %t1237 = call i64 @"sx_f64_lt"(i64 %t1235, i64 %t1236)
  %t1238 = icmp ne i64 %t1237, 0
  br i1 %t1238, label %then42, label %else42
then42:
  store i64 1, ptr %local.broke_cycle.967
  br label %then42_end
then42_end:
  br label %endif42
else42:
  br label %else42_end
else42_end:
  br label %endif42
endif42:
  %t1239 = phi i64 [ 0, %then42_end ], [ 0, %else42_end ]
  br label %then41_end
then41_end:
  br label %endif41
else41:
  br label %else41_end
else41_end:
  br label %endif41
endif41:
  %t1240 = phi i64 [ %t1239, %then41_end ], [ 0, %else41_end ]
  %t1241 = load i64, ptr %local.ca.957
  %t1242 = load i64, ptr %local.min_alpha.966
  %t1243 = call i64 @"sx_f64_lt"(i64 %t1241, i64 %t1242)
  %t1244 = icmp ne i64 %t1243, 0
  br i1 %t1244, label %then43, label %else43
then43:
  %t1245 = load i64, ptr %local.ca.957
  %t1246 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.204)
  %t1247 = call i64 @"sx_f64_lt"(i64 %t1245, i64 %t1246)
  %t1248 = icmp ne i64 %t1247, 0
  br i1 %t1248, label %then44, label %else44
then44:
  store i64 1, ptr %local.broke_cycle.967
  br label %then44_end
then44_end:
  br label %endif44
else44:
  br label %else44_end
else44_end:
  br label %endif44
endif44:
  %t1249 = phi i64 [ 0, %then44_end ], [ 0, %else44_end ]
  br label %then43_end
then43_end:
  br label %endif43
else43:
  br label %else43_end
else43_end:
  br label %endif43
endif43:
  %t1250 = phi i64 [ %t1249, %then43_end ], [ 0, %else43_end ]
  %t1251 = load i64, ptr %local.ab.955
  %t1252 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.205)
  %t1253 = call i64 @"sx_f64_lt"(i64 %t1251, i64 %t1252)
  %t1254 = icmp ne i64 %t1253, 0
  br i1 %t1254, label %then45, label %else45
then45:
  store i64 1, ptr %local.broke_cycle.967
  br label %then45_end
then45_end:
  br label %endif45
else45:
  br label %else45_end
else45_end:
  br label %endif45
endif45:
  %t1255 = phi i64 [ 0, %then45_end ], [ 0, %else45_end ]
  %t1256 = load i64, ptr %local.broke_cycle.967
  %t1257 = icmp eq i64 %t1256, 1
  %t1258 = zext i1 %t1257 to i64
  %t1259 = icmp ne i64 %t1258, 0
  br i1 %t1259, label %then46, label %else46
then46:
  %t1260 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.206)
  %t1261 = ptrtoint ptr %t1260 to i64
  %t1262 = inttoptr i64 %t1261 to ptr
  call void @intrinsic_println(ptr %t1262)
  br label %then46_end
then46_end:
  br label %endif46
else46:
  %t1263 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.207)
  %t1264 = ptrtoint ptr %t1263 to i64
  %t1265 = inttoptr i64 %t1264 to ptr
  call void @intrinsic_println(ptr %t1265)
  br label %else46_end
else46_end:
  br label %endif46
endif46:
  %t1266 = phi i64 [ 0, %then46_end ], [ 0, %else46_end ]
  %t1267 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.208)
  %t1268 = ptrtoint ptr %t1267 to i64
  %t1269 = inttoptr i64 %t1268 to ptr
  call void @intrinsic_print(ptr %t1269)
  %t1270 = load i64, ptr %local.osc_count.964
  call void @print_i64(i64 %t1270)
  %t1271 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.209)
  %t1272 = ptrtoint ptr %t1271 to i64
  %t1273 = inttoptr i64 %t1272 to ptr
  call void @intrinsic_println(ptr %t1273)
  %t1274 = load i64, ptr %local.loss_learned.965
  %t1275 = load i64, ptr %local.loss_none.953
  %t1276 = call i64 @"sx_f64_lt"(i64 %t1274, i64 %t1275)
  %t1277 = icmp ne i64 %t1276, 0
  br i1 %t1277, label %then47, label %else47
then47:
  %t1278 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.210)
  %t1279 = ptrtoint ptr %t1278 to i64
  %t1280 = inttoptr i64 %t1279 to ptr
  call void @intrinsic_println(ptr %t1280)
  br label %then47_end
then47_end:
  br label %endif47
else47:
  br label %else47_end
else47_end:
  br label %endif47
endif47:
  %t1281 = phi i64 [ 0, %then47_end ], [ 0, %else47_end ]
  %t1282 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.211)
  %t1283 = ptrtoint ptr %t1282 to i64
  %t1284 = inttoptr i64 %t1283 to ptr
  call void @intrinsic_println(ptr %t1284)
  ret i64 0
}

define i64 @"train_delayed"(i64 %a0, i64 %a1, i64 %a2, i64 %obs, i64 %delay, i64 %seed) nounwind {
entry:
  %local.al_a.1285 = alloca i64
  %local.be_a.1286 = alloca i64
  %local.al_b.1287 = alloca i64
  %local.be_b.1288 = alloca i64
  %local.al_c.1289 = alloca i64
  %local.be_c.1290 = alloca i64
  %local.al_d.1291 = alloca i64
  %local.be_d.1292 = alloca i64
  %local.rng.1293 = alloca i64
  %local.step.1294 = alloca i64
  %local.boost.1295 = alloca i64
  %local.t_a.1296 = alloca i64
  %local.t_b.1297 = alloca i64
  %local.t_c.1298 = alloca i64
  %local.t_d.1299 = alloca i64
  %local.delay_b.1300 = alloca i64
  %local.delay_c.1301 = alloca i64
  %local.delay_d.1302 = alloca i64
  %local.ea.1303 = alloca i64
  %local.eb.1304 = alloca i64
  %local.ec.1305 = alloca i64
  %local.ed.1306 = alloca i64
  %local.a0 = alloca i64
  store i64 %a0, ptr %local.a0
  %local.a1 = alloca i64
  store i64 %a1, ptr %local.a1
  %local.a2 = alloca i64
  store i64 %a2, ptr %local.a2
  %local.obs = alloca i64
  store i64 %obs, ptr %local.obs
  %local.delay = alloca i64
  store i64 %delay, ptr %local.delay
  %local.seed = alloca i64
  store i64 %seed, ptr %local.seed
  %t1307 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.212)
  store i64 %t1307, ptr %local.al_a.1285
  %t1308 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.213)
  store i64 %t1308, ptr %local.be_a.1286
  %t1309 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.214)
  store i64 %t1309, ptr %local.al_b.1287
  %t1310 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.215)
  store i64 %t1310, ptr %local.be_b.1288
  %t1311 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.216)
  store i64 %t1311, ptr %local.al_c.1289
  %t1312 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.217)
  store i64 %t1312, ptr %local.be_c.1290
  %t1313 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.218)
  store i64 %t1313, ptr %local.al_d.1291
  %t1314 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.219)
  store i64 %t1314, ptr %local.be_d.1292
  %t1315 = load i64, ptr %local.seed
  store i64 %t1315, ptr %local.rng.1293
  store i64 0, ptr %local.step.1294
  %t1316 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.220)
  store i64 %t1316, ptr %local.boost.1295
  %t1317 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.221)
  store i64 %t1317, ptr %local.t_a.1296
  %t1318 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.222)
  store i64 %t1318, ptr %local.t_b.1297
  %t1319 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.223)
  store i64 %t1319, ptr %local.t_c.1298
  %t1320 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.224)
  store i64 %t1320, ptr %local.t_d.1299
  %t1321 = load i64, ptr %local.delay
  store i64 %t1321, ptr %local.delay_b.1300
  %t1322 = load i64, ptr %local.delay
  %t1323 = mul i64 %t1322, 2
  store i64 %t1323, ptr %local.delay_c.1301
  %t1324 = load i64, ptr %local.delay
  %t1325 = mul i64 %t1324, 3
  store i64 %t1325, ptr %local.delay_d.1302
  br label %loop48
loop48:
  %t1326 = load i64, ptr %local.step.1294
  %t1327 = load i64, ptr %local.obs
  %t1328 = icmp slt i64 %t1326, %t1327
  %t1329 = zext i1 %t1328 to i64
  %t1330 = icmp ne i64 %t1329, 0
  br i1 %t1330, label %body48, label %endloop48
body48:
  %t1331 = load i64, ptr %local.rng.1293
  %t1332 = call i64 @"lcg_next"(i64 %t1331)
  store i64 %t1332, ptr %local.rng.1293
  %t1333 = load i64, ptr %local.rng.1293
  %t1334 = call i64 @"lcg_f64"(i64 %t1333)
  %t1335 = load i64, ptr %local.t_a.1296
  %t1336 = call i64 @"sx_f64_lt"(i64 %t1334, i64 %t1335)
  %t1337 = icmp ne i64 %t1336, 0
  br i1 %t1337, label %then49, label %else49
then49:
  %t1338 = load i64, ptr %local.al_a.1285
  %t1339 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.225)
  %t1340 = call i64 @"sx_f64_add"(i64 %t1338, i64 %t1339)
  store i64 %t1340, ptr %local.al_a.1285
  %t1341 = load i64, ptr %local.a0
  %t1342 = load i64, ptr %local.al_a.1285
  %t1343 = load i64, ptr %local.be_a.1286
  %t1344 = call i64 @"beta_mean"(i64 %t1342, i64 %t1343)
  %t1345 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.226)
  %t1346 = call i64 @"sx_f64_sub"(i64 %t1344, i64 %t1345)
  %t1347 = call i64 @"sx_f64_mul"(i64 %t1341, i64 %t1346)
  %t1348 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.227)
  %t1349 = call i64 @"sx_f64_mul"(i64 %t1347, i64 %t1348)
  store i64 %t1349, ptr %local.boost.1295
  %t1350 = load i64, ptr %local.boost.1295
  %t1351 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.228)
  %t1352 = call i64 @"sx_f64_gt"(i64 %t1350, i64 %t1351)
  %t1353 = icmp ne i64 %t1352, 0
  br i1 %t1353, label %then50, label %else50
then50:
  %t1354 = load i64, ptr %local.al_b.1287
  %t1355 = load i64, ptr %local.boost.1295
  %t1356 = call i64 @"sx_f64_add"(i64 %t1354, i64 %t1355)
  store i64 %t1356, ptr %local.al_b.1287
  br label %then50_end
then50_end:
  br label %endif50
else50:
  br label %else50_end
else50_end:
  br label %endif50
endif50:
  %t1357 = phi i64 [ 0, %then50_end ], [ 0, %else50_end ]
  br label %then49_end
then49_end:
  br label %endif49
else49:
  %t1358 = load i64, ptr %local.be_a.1286
  %t1359 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.229)
  %t1360 = call i64 @"sx_f64_add"(i64 %t1358, i64 %t1359)
  store i64 %t1360, ptr %local.be_a.1286
  br label %else49_end
else49_end:
  br label %endif49
endif49:
  %t1361 = phi i64 [ %t1357, %then49_end ], [ 0, %else49_end ]
  %t1362 = load i64, ptr %local.step.1294
  %t1363 = load i64, ptr %local.delay_b.1300
  %t1364 = icmp sge i64 %t1362, %t1363
  %t1365 = zext i1 %t1364 to i64
  %t1366 = icmp ne i64 %t1365, 0
  br i1 %t1366, label %then51, label %else51
then51:
  %t1367 = load i64, ptr %local.rng.1293
  %t1368 = call i64 @"lcg_next"(i64 %t1367)
  store i64 %t1368, ptr %local.rng.1293
  %t1369 = load i64, ptr %local.rng.1293
  %t1370 = call i64 @"lcg_f64"(i64 %t1369)
  %t1371 = load i64, ptr %local.t_b.1297
  %t1372 = call i64 @"sx_f64_lt"(i64 %t1370, i64 %t1371)
  %t1373 = icmp ne i64 %t1372, 0
  br i1 %t1373, label %then52, label %else52
then52:
  %t1374 = load i64, ptr %local.al_b.1287
  %t1375 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.230)
  %t1376 = call i64 @"sx_f64_add"(i64 %t1374, i64 %t1375)
  store i64 %t1376, ptr %local.al_b.1287
  %t1377 = load i64, ptr %local.a1
  %t1378 = load i64, ptr %local.al_b.1287
  %t1379 = load i64, ptr %local.be_b.1288
  %t1380 = call i64 @"beta_mean"(i64 %t1378, i64 %t1379)
  %t1381 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.231)
  %t1382 = call i64 @"sx_f64_sub"(i64 %t1380, i64 %t1381)
  %t1383 = call i64 @"sx_f64_mul"(i64 %t1377, i64 %t1382)
  %t1384 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.232)
  %t1385 = call i64 @"sx_f64_mul"(i64 %t1383, i64 %t1384)
  store i64 %t1385, ptr %local.boost.1295
  %t1386 = load i64, ptr %local.boost.1295
  %t1387 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.233)
  %t1388 = call i64 @"sx_f64_gt"(i64 %t1386, i64 %t1387)
  %t1389 = icmp ne i64 %t1388, 0
  br i1 %t1389, label %then53, label %else53
then53:
  %t1390 = load i64, ptr %local.al_c.1289
  %t1391 = load i64, ptr %local.boost.1295
  %t1392 = call i64 @"sx_f64_add"(i64 %t1390, i64 %t1391)
  store i64 %t1392, ptr %local.al_c.1289
  br label %then53_end
then53_end:
  br label %endif53
else53:
  br label %else53_end
else53_end:
  br label %endif53
endif53:
  %t1393 = phi i64 [ 0, %then53_end ], [ 0, %else53_end ]
  br label %then52_end
then52_end:
  br label %endif52
else52:
  %t1394 = load i64, ptr %local.be_b.1288
  %t1395 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.234)
  %t1396 = call i64 @"sx_f64_add"(i64 %t1394, i64 %t1395)
  store i64 %t1396, ptr %local.be_b.1288
  br label %else52_end
else52_end:
  br label %endif52
endif52:
  %t1397 = phi i64 [ %t1393, %then52_end ], [ 0, %else52_end ]
  br label %then51_end
then51_end:
  br label %endif51
else51:
  br label %else51_end
else51_end:
  br label %endif51
endif51:
  %t1398 = phi i64 [ %t1397, %then51_end ], [ 0, %else51_end ]
  %t1399 = load i64, ptr %local.step.1294
  %t1400 = load i64, ptr %local.delay_c.1301
  %t1401 = icmp sge i64 %t1399, %t1400
  %t1402 = zext i1 %t1401 to i64
  %t1403 = icmp ne i64 %t1402, 0
  br i1 %t1403, label %then54, label %else54
then54:
  %t1404 = load i64, ptr %local.rng.1293
  %t1405 = call i64 @"lcg_next"(i64 %t1404)
  store i64 %t1405, ptr %local.rng.1293
  %t1406 = load i64, ptr %local.rng.1293
  %t1407 = call i64 @"lcg_f64"(i64 %t1406)
  %t1408 = load i64, ptr %local.t_c.1298
  %t1409 = call i64 @"sx_f64_lt"(i64 %t1407, i64 %t1408)
  %t1410 = icmp ne i64 %t1409, 0
  br i1 %t1410, label %then55, label %else55
then55:
  %t1411 = load i64, ptr %local.al_c.1289
  %t1412 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.235)
  %t1413 = call i64 @"sx_f64_add"(i64 %t1411, i64 %t1412)
  store i64 %t1413, ptr %local.al_c.1289
  %t1414 = load i64, ptr %local.a2
  %t1415 = load i64, ptr %local.al_c.1289
  %t1416 = load i64, ptr %local.be_c.1290
  %t1417 = call i64 @"beta_mean"(i64 %t1415, i64 %t1416)
  %t1418 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.236)
  %t1419 = call i64 @"sx_f64_sub"(i64 %t1417, i64 %t1418)
  %t1420 = call i64 @"sx_f64_mul"(i64 %t1414, i64 %t1419)
  %t1421 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.237)
  %t1422 = call i64 @"sx_f64_mul"(i64 %t1420, i64 %t1421)
  store i64 %t1422, ptr %local.boost.1295
  %t1423 = load i64, ptr %local.boost.1295
  %t1424 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.238)
  %t1425 = call i64 @"sx_f64_gt"(i64 %t1423, i64 %t1424)
  %t1426 = icmp ne i64 %t1425, 0
  br i1 %t1426, label %then56, label %else56
then56:
  %t1427 = load i64, ptr %local.al_d.1291
  %t1428 = load i64, ptr %local.boost.1295
  %t1429 = call i64 @"sx_f64_add"(i64 %t1427, i64 %t1428)
  store i64 %t1429, ptr %local.al_d.1291
  br label %then56_end
then56_end:
  br label %endif56
else56:
  br label %else56_end
else56_end:
  br label %endif56
endif56:
  %t1430 = phi i64 [ 0, %then56_end ], [ 0, %else56_end ]
  br label %then55_end
then55_end:
  br label %endif55
else55:
  %t1431 = load i64, ptr %local.be_c.1290
  %t1432 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.239)
  %t1433 = call i64 @"sx_f64_add"(i64 %t1431, i64 %t1432)
  store i64 %t1433, ptr %local.be_c.1290
  br label %else55_end
else55_end:
  br label %endif55
endif55:
  %t1434 = phi i64 [ %t1430, %then55_end ], [ 0, %else55_end ]
  br label %then54_end
then54_end:
  br label %endif54
else54:
  br label %else54_end
else54_end:
  br label %endif54
endif54:
  %t1435 = phi i64 [ %t1434, %then54_end ], [ 0, %else54_end ]
  %t1436 = load i64, ptr %local.step.1294
  %t1437 = load i64, ptr %local.delay_d.1302
  %t1438 = icmp sge i64 %t1436, %t1437
  %t1439 = zext i1 %t1438 to i64
  %t1440 = icmp ne i64 %t1439, 0
  br i1 %t1440, label %then57, label %else57
then57:
  %t1441 = load i64, ptr %local.rng.1293
  %t1442 = call i64 @"lcg_next"(i64 %t1441)
  store i64 %t1442, ptr %local.rng.1293
  %t1443 = load i64, ptr %local.rng.1293
  %t1444 = call i64 @"lcg_f64"(i64 %t1443)
  %t1445 = load i64, ptr %local.t_d.1299
  %t1446 = call i64 @"sx_f64_lt"(i64 %t1444, i64 %t1445)
  %t1447 = icmp ne i64 %t1446, 0
  br i1 %t1447, label %then58, label %else58
then58:
  %t1448 = load i64, ptr %local.al_d.1291
  %t1449 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.240)
  %t1450 = call i64 @"sx_f64_add"(i64 %t1448, i64 %t1449)
  store i64 %t1450, ptr %local.al_d.1291
  br label %then58_end
then58_end:
  br label %endif58
else58:
  %t1451 = load i64, ptr %local.be_d.1292
  %t1452 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.241)
  %t1453 = call i64 @"sx_f64_add"(i64 %t1451, i64 %t1452)
  store i64 %t1453, ptr %local.be_d.1292
  br label %else58_end
else58_end:
  br label %endif58
endif58:
  %t1454 = phi i64 [ 0, %then58_end ], [ 0, %else58_end ]
  br label %then57_end
then57_end:
  br label %endif57
else57:
  br label %else57_end
else57_end:
  br label %endif57
endif57:
  %t1455 = phi i64 [ %t1454, %then57_end ], [ 0, %else57_end ]
  %t1456 = load i64, ptr %local.step.1294
  %t1457 = add i64 %t1456, 1
  store i64 %t1457, ptr %local.step.1294
  br label %loop48
endloop48:
  %t1458 = load i64, ptr %local.al_a.1285
  %t1459 = load i64, ptr %local.be_a.1286
  %t1460 = call i64 @"beta_mean"(i64 %t1458, i64 %t1459)
  %t1461 = load i64, ptr %local.t_a.1296
  %t1462 = call i64 @"sx_f64_sub"(i64 %t1460, i64 %t1461)
  store i64 %t1462, ptr %local.ea.1303
  %t1463 = load i64, ptr %local.al_b.1287
  %t1464 = load i64, ptr %local.be_b.1288
  %t1465 = call i64 @"beta_mean"(i64 %t1463, i64 %t1464)
  %t1466 = load i64, ptr %local.t_b.1297
  %t1467 = call i64 @"sx_f64_sub"(i64 %t1465, i64 %t1466)
  store i64 %t1467, ptr %local.eb.1304
  %t1468 = load i64, ptr %local.al_c.1289
  %t1469 = load i64, ptr %local.be_c.1290
  %t1470 = call i64 @"beta_mean"(i64 %t1468, i64 %t1469)
  %t1471 = load i64, ptr %local.t_c.1298
  %t1472 = call i64 @"sx_f64_sub"(i64 %t1470, i64 %t1471)
  store i64 %t1472, ptr %local.ec.1305
  %t1473 = load i64, ptr %local.al_d.1291
  %t1474 = load i64, ptr %local.be_d.1292
  %t1475 = call i64 @"beta_mean"(i64 %t1473, i64 %t1474)
  %t1476 = load i64, ptr %local.t_d.1299
  %t1477 = call i64 @"sx_f64_sub"(i64 %t1475, i64 %t1476)
  store i64 %t1477, ptr %local.ed.1306
  %t1478 = load i64, ptr %local.ea.1303
  %t1479 = load i64, ptr %local.ea.1303
  %t1480 = call i64 @"sx_f64_mul"(i64 %t1478, i64 %t1479)
  %t1481 = load i64, ptr %local.eb.1304
  %t1482 = load i64, ptr %local.eb.1304
  %t1483 = call i64 @"sx_f64_mul"(i64 %t1481, i64 %t1482)
  %t1484 = call i64 @"sx_f64_add"(i64 %t1480, i64 %t1483)
  %t1485 = load i64, ptr %local.ec.1305
  %t1486 = load i64, ptr %local.ec.1305
  %t1487 = call i64 @"sx_f64_mul"(i64 %t1485, i64 %t1486)
  %t1488 = call i64 @"sx_f64_add"(i64 %t1484, i64 %t1487)
  %t1489 = load i64, ptr %local.ed.1306
  %t1490 = load i64, ptr %local.ed.1306
  %t1491 = call i64 @"sx_f64_mul"(i64 %t1489, i64 %t1490)
  %t1492 = call i64 @"sx_f64_add"(i64 %t1488, i64 %t1491)
  ret i64 %t1492
}

define i64 @"delay_loss_avg"(i64 %a0, i64 %a1, i64 %a2, i64 %obs, i64 %delay) nounwind {
entry:
  %local.l1.1493 = alloca i64
  %local.l2.1494 = alloca i64
  %local.l3.1495 = alloca i64
  %local.a0 = alloca i64
  store i64 %a0, ptr %local.a0
  %local.a1 = alloca i64
  store i64 %a1, ptr %local.a1
  %local.a2 = alloca i64
  store i64 %a2, ptr %local.a2
  %local.obs = alloca i64
  store i64 %obs, ptr %local.obs
  %local.delay = alloca i64
  store i64 %delay, ptr %local.delay
  %t1496 = load i64, ptr %local.a0
  %t1497 = load i64, ptr %local.a1
  %t1498 = load i64, ptr %local.a2
  %t1499 = load i64, ptr %local.obs
  %t1500 = load i64, ptr %local.delay
  %t1501 = call i64 @"train_delayed"(i64 %t1496, i64 %t1497, i64 %t1498, i64 %t1499, i64 %t1500, i64 42)
  store i64 %t1501, ptr %local.l1.1493
  %t1502 = load i64, ptr %local.a0
  %t1503 = load i64, ptr %local.a1
  %t1504 = load i64, ptr %local.a2
  %t1505 = load i64, ptr %local.obs
  %t1506 = load i64, ptr %local.delay
  %t1507 = call i64 @"train_delayed"(i64 %t1502, i64 %t1503, i64 %t1504, i64 %t1505, i64 %t1506, i64 137)
  store i64 %t1507, ptr %local.l2.1494
  %t1508 = load i64, ptr %local.a0
  %t1509 = load i64, ptr %local.a1
  %t1510 = load i64, ptr %local.a2
  %t1511 = load i64, ptr %local.obs
  %t1512 = load i64, ptr %local.delay
  %t1513 = call i64 @"train_delayed"(i64 %t1508, i64 %t1509, i64 %t1510, i64 %t1511, i64 %t1512, i64 999)
  store i64 %t1513, ptr %local.l3.1495
  %t1514 = load i64, ptr %local.l1.1493
  %t1515 = load i64, ptr %local.l2.1494
  %t1516 = call i64 @"sx_f64_add"(i64 %t1514, i64 %t1515)
  %t1517 = load i64, ptr %local.l3.1495
  %t1518 = call i64 @"sx_f64_add"(i64 %t1516, i64 %t1517)
  %t1519 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.242)
  %t1520 = call i64 @"sx_f64_div"(i64 %t1518, i64 %t1519)
  ret i64 %t1520
}

define i64 @"mg_delay"(i64 %a0, i64 %a1, i64 %a2, i64 %which, i64 %obs, i64 %delay) nounwind {
entry:
  %local.h.1521 = alloca i64
  %local.p0.1522 = alloca i64
  %local.p1.1523 = alloca i64
  %local.p2.1524 = alloca i64
  %local.m0.1525 = alloca i64
  %local.m1.1526 = alloca i64
  %local.m2.1527 = alloca i64
  %local.lp.1528 = alloca i64
  %local.lm.1529 = alloca i64
  %local.a0 = alloca i64
  store i64 %a0, ptr %local.a0
  %local.a1 = alloca i64
  store i64 %a1, ptr %local.a1
  %local.a2 = alloca i64
  store i64 %a2, ptr %local.a2
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %local.obs = alloca i64
  store i64 %obs, ptr %local.obs
  %local.delay = alloca i64
  store i64 %delay, ptr %local.delay
  %t1530 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.243)
  store i64 %t1530, ptr %local.h.1521
  %t1531 = load i64, ptr %local.a0
  store i64 %t1531, ptr %local.p0.1522
  %t1532 = load i64, ptr %local.a1
  store i64 %t1532, ptr %local.p1.1523
  %t1533 = load i64, ptr %local.a2
  store i64 %t1533, ptr %local.p2.1524
  %t1534 = load i64, ptr %local.a0
  store i64 %t1534, ptr %local.m0.1525
  %t1535 = load i64, ptr %local.a1
  store i64 %t1535, ptr %local.m1.1526
  %t1536 = load i64, ptr %local.a2
  store i64 %t1536, ptr %local.m2.1527
  %t1537 = load i64, ptr %local.which
  %t1538 = icmp eq i64 %t1537, 0
  %t1539 = zext i1 %t1538 to i64
  %t1540 = icmp ne i64 %t1539, 0
  br i1 %t1540, label %then59, label %else59
then59:
  %t1541 = load i64, ptr %local.a0
  %t1542 = load i64, ptr %local.h.1521
  %t1543 = call i64 @"sx_f64_add"(i64 %t1541, i64 %t1542)
  store i64 %t1543, ptr %local.p0.1522
  %t1544 = load i64, ptr %local.a0
  %t1545 = load i64, ptr %local.h.1521
  %t1546 = call i64 @"sx_f64_sub"(i64 %t1544, i64 %t1545)
  store i64 %t1546, ptr %local.m0.1525
  br label %then59_end
then59_end:
  br label %endif59
else59:
  br label %else59_end
else59_end:
  br label %endif59
endif59:
  %t1547 = phi i64 [ 0, %then59_end ], [ 0, %else59_end ]
  %t1548 = load i64, ptr %local.which
  %t1549 = icmp eq i64 %t1548, 1
  %t1550 = zext i1 %t1549 to i64
  %t1551 = icmp ne i64 %t1550, 0
  br i1 %t1551, label %then60, label %else60
then60:
  %t1552 = load i64, ptr %local.a1
  %t1553 = load i64, ptr %local.h.1521
  %t1554 = call i64 @"sx_f64_add"(i64 %t1552, i64 %t1553)
  store i64 %t1554, ptr %local.p1.1523
  %t1555 = load i64, ptr %local.a1
  %t1556 = load i64, ptr %local.h.1521
  %t1557 = call i64 @"sx_f64_sub"(i64 %t1555, i64 %t1556)
  store i64 %t1557, ptr %local.m1.1526
  br label %then60_end
then60_end:
  br label %endif60
else60:
  br label %else60_end
else60_end:
  br label %endif60
endif60:
  %t1558 = phi i64 [ 0, %then60_end ], [ 0, %else60_end ]
  %t1559 = load i64, ptr %local.which
  %t1560 = icmp eq i64 %t1559, 2
  %t1561 = zext i1 %t1560 to i64
  %t1562 = icmp ne i64 %t1561, 0
  br i1 %t1562, label %then61, label %else61
then61:
  %t1563 = load i64, ptr %local.a2
  %t1564 = load i64, ptr %local.h.1521
  %t1565 = call i64 @"sx_f64_add"(i64 %t1563, i64 %t1564)
  store i64 %t1565, ptr %local.p2.1524
  %t1566 = load i64, ptr %local.a2
  %t1567 = load i64, ptr %local.h.1521
  %t1568 = call i64 @"sx_f64_sub"(i64 %t1566, i64 %t1567)
  store i64 %t1568, ptr %local.m2.1527
  br label %then61_end
then61_end:
  br label %endif61
else61:
  br label %else61_end
else61_end:
  br label %endif61
endif61:
  %t1569 = phi i64 [ 0, %then61_end ], [ 0, %else61_end ]
  %t1570 = load i64, ptr %local.p0.1522
  %t1571 = load i64, ptr %local.p1.1523
  %t1572 = load i64, ptr %local.p2.1524
  %t1573 = load i64, ptr %local.obs
  %t1574 = load i64, ptr %local.delay
  %t1575 = call i64 @"delay_loss_avg"(i64 %t1570, i64 %t1571, i64 %t1572, i64 %t1573, i64 %t1574)
  store i64 %t1575, ptr %local.lp.1528
  %t1576 = load i64, ptr %local.m0.1525
  %t1577 = load i64, ptr %local.m1.1526
  %t1578 = load i64, ptr %local.m2.1527
  %t1579 = load i64, ptr %local.obs
  %t1580 = load i64, ptr %local.delay
  %t1581 = call i64 @"delay_loss_avg"(i64 %t1576, i64 %t1577, i64 %t1578, i64 %t1579, i64 %t1580)
  store i64 %t1581, ptr %local.lm.1529
  %t1582 = load i64, ptr %local.lp.1528
  %t1583 = load i64, ptr %local.lm.1529
  %t1584 = call i64 @"sx_f64_sub"(i64 %t1582, i64 %t1583)
  %t1585 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.244)
  %t1586 = load i64, ptr %local.h.1521
  %t1587 = call i64 @"sx_f64_mul"(i64 %t1585, i64 %t1586)
  %t1588 = call i64 @"sx_f64_div"(i64 %t1584, i64 %t1587)
  ret i64 %t1588
}

define i64 @"snapshot_error"(i64 %a0, i64 %a1, i64 %a2, i64 %snap_obs, i64 %delay) nounwind {
entry:
  %local.a0 = alloca i64
  store i64 %a0, ptr %local.a0
  %local.a1 = alloca i64
  store i64 %a1, ptr %local.a1
  %local.a2 = alloca i64
  store i64 %a2, ptr %local.a2
  %local.snap_obs = alloca i64
  store i64 %snap_obs, ptr %local.snap_obs
  %local.delay = alloca i64
  store i64 %delay, ptr %local.delay
  %t1589 = load i64, ptr %local.a0
  %t1590 = load i64, ptr %local.a1
  %t1591 = load i64, ptr %local.a2
  %t1592 = load i64, ptr %local.snap_obs
  %t1593 = load i64, ptr %local.delay
  %t1594 = call i64 @"delay_loss_avg"(i64 %t1589, i64 %t1590, i64 %t1591, i64 %t1592, i64 %t1593)
  ret i64 %t1594
}

define i64 @"run_exp3"() nounwind {
entry:
  %local.obs.1595 = alloca i64
  %local.delay.1596 = alloca i64
  %local.meta_cycles.1597 = alloca i64
  %local.meta_lr.1598 = alloca i64
  %local.loss_none.1599 = alloca i64
  %local.loss_unif.1600 = alloca i64
  %local.a0.1601 = alloca i64
  %local.a1.1602 = alloca i64
  %local.a2.1603 = alloca i64
  %local.mg.1604 = alloca i64
  %local.cycle.1605 = alloca i64
  %local.loss.1606 = alloca i64
  %local.loss_learned.1607 = alloca i64
  %local.early_none.1608 = alloca i64
  %local.early_learn.1609 = alloca i64
  %local.speedup.1610 = alloca i64
  %t1611 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.245)
  %t1612 = ptrtoint ptr %t1611 to i64
  %t1613 = inttoptr i64 %t1612 to ptr
  call void @intrinsic_println(ptr %t1613)
  %t1614 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.246)
  %t1615 = ptrtoint ptr %t1614 to i64
  %t1616 = inttoptr i64 %t1615 to ptr
  call void @intrinsic_println(ptr %t1616)
  %t1617 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.247)
  %t1618 = ptrtoint ptr %t1617 to i64
  %t1619 = inttoptr i64 %t1618 to ptr
  call void @intrinsic_println(ptr %t1619)
  %t1620 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.248)
  %t1621 = ptrtoint ptr %t1620 to i64
  %t1622 = inttoptr i64 %t1621 to ptr
  call void @intrinsic_println(ptr %t1622)
  %t1623 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.249)
  %t1624 = ptrtoint ptr %t1623 to i64
  %t1625 = inttoptr i64 %t1624 to ptr
  call void @intrinsic_println(ptr %t1625)
  %t1626 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.250)
  %t1627 = ptrtoint ptr %t1626 to i64
  %t1628 = inttoptr i64 %t1627 to ptr
  call void @intrinsic_println(ptr %t1628)
  store i64 150, ptr %local.obs.1595
  store i64 10, ptr %local.delay.1596
  store i64 40, ptr %local.meta_cycles.1597
  %t1629 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.251)
  store i64 %t1629, ptr %local.meta_lr.1598
  %t1630 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.252)
  %t1631 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.253)
  %t1632 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.254)
  %t1633 = load i64, ptr %local.obs.1595
  %t1634 = load i64, ptr %local.delay.1596
  %t1635 = call i64 @"delay_loss_avg"(i64 %t1630, i64 %t1631, i64 %t1632, i64 %t1633, i64 %t1634)
  store i64 %t1635, ptr %local.loss_none.1599
  %t1636 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.255)
  %t1637 = ptrtoint ptr %t1636 to i64
  %t1638 = inttoptr i64 %t1637 to ptr
  call void @intrinsic_print(ptr %t1638)
  %t1639 = load i64, ptr %local.loss_none.1599
  %t1640 = call i64 @"print_f64"(i64 %t1639)
  %t1641 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.256)
  %t1642 = ptrtoint ptr %t1641 to i64
  %t1643 = inttoptr i64 %t1642 to ptr
  call void @intrinsic_println(ptr %t1643)
  %t1644 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.257)
  %t1645 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.258)
  %t1646 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.259)
  %t1647 = load i64, ptr %local.obs.1595
  %t1648 = load i64, ptr %local.delay.1596
  %t1649 = call i64 @"delay_loss_avg"(i64 %t1644, i64 %t1645, i64 %t1646, i64 %t1647, i64 %t1648)
  store i64 %t1649, ptr %local.loss_unif.1600
  %t1650 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.260)
  %t1651 = ptrtoint ptr %t1650 to i64
  %t1652 = inttoptr i64 %t1651 to ptr
  call void @intrinsic_print(ptr %t1652)
  %t1653 = load i64, ptr %local.loss_unif.1600
  %t1654 = call i64 @"print_f64"(i64 %t1653)
  %t1655 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.261)
  %t1656 = ptrtoint ptr %t1655 to i64
  %t1657 = inttoptr i64 %t1656 to ptr
  call void @intrinsic_println(ptr %t1657)
  %t1658 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.262)
  store i64 %t1658, ptr %local.a0.1601
  %t1659 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.263)
  store i64 %t1659, ptr %local.a1.1602
  %t1660 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.264)
  store i64 %t1660, ptr %local.a2.1603
  %t1661 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.265)
  store i64 %t1661, ptr %local.mg.1604
  store i64 0, ptr %local.cycle.1605
  %t1662 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.266)
  store i64 %t1662, ptr %local.loss.1606
  %t1663 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.267)
  %t1664 = ptrtoint ptr %t1663 to i64
  %t1665 = inttoptr i64 %t1664 to ptr
  call void @intrinsic_println(ptr %t1665)
  %t1666 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.268)
  %t1667 = ptrtoint ptr %t1666 to i64
  %t1668 = inttoptr i64 %t1667 to ptr
  call void @intrinsic_println(ptr %t1668)
  %t1669 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.269)
  %t1670 = ptrtoint ptr %t1669 to i64
  %t1671 = inttoptr i64 %t1670 to ptr
  call void @intrinsic_println(ptr %t1671)
  br label %loop62
loop62:
  %t1672 = load i64, ptr %local.cycle.1605
  %t1673 = load i64, ptr %local.meta_cycles.1597
  %t1674 = icmp slt i64 %t1672, %t1673
  %t1675 = zext i1 %t1674 to i64
  %t1676 = icmp ne i64 %t1675, 0
  br i1 %t1676, label %body62, label %endloop62
body62:
  %t1677 = load i64, ptr %local.a0.1601
  %t1678 = load i64, ptr %local.a1.1602
  %t1679 = load i64, ptr %local.a2.1603
  %t1680 = load i64, ptr %local.obs.1595
  %t1681 = load i64, ptr %local.delay.1596
  %t1682 = call i64 @"mg_delay"(i64 %t1677, i64 %t1678, i64 %t1679, i64 0, i64 %t1680, i64 %t1681)
  store i64 %t1682, ptr %local.mg.1604
  %t1683 = load i64, ptr %local.a0.1601
  %t1684 = load i64, ptr %local.meta_lr.1598
  %t1685 = load i64, ptr %local.mg.1604
  %t1686 = call i64 @"sx_f64_mul"(i64 %t1684, i64 %t1685)
  %t1687 = call i64 @"sx_f64_sub"(i64 %t1683, i64 %t1686)
  %t1688 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.270)
  %t1689 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.271)
  %t1690 = call i64 @"clamp"(i64 %t1687, i64 %t1688, i64 %t1689)
  store i64 %t1690, ptr %local.a0.1601
  %t1691 = load i64, ptr %local.a0.1601
  %t1692 = load i64, ptr %local.a1.1602
  %t1693 = load i64, ptr %local.a2.1603
  %t1694 = load i64, ptr %local.obs.1595
  %t1695 = load i64, ptr %local.delay.1596
  %t1696 = call i64 @"mg_delay"(i64 %t1691, i64 %t1692, i64 %t1693, i64 1, i64 %t1694, i64 %t1695)
  store i64 %t1696, ptr %local.mg.1604
  %t1697 = load i64, ptr %local.a1.1602
  %t1698 = load i64, ptr %local.meta_lr.1598
  %t1699 = load i64, ptr %local.mg.1604
  %t1700 = call i64 @"sx_f64_mul"(i64 %t1698, i64 %t1699)
  %t1701 = call i64 @"sx_f64_sub"(i64 %t1697, i64 %t1700)
  %t1702 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.272)
  %t1703 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.273)
  %t1704 = call i64 @"clamp"(i64 %t1701, i64 %t1702, i64 %t1703)
  store i64 %t1704, ptr %local.a1.1602
  %t1705 = load i64, ptr %local.a0.1601
  %t1706 = load i64, ptr %local.a1.1602
  %t1707 = load i64, ptr %local.a2.1603
  %t1708 = load i64, ptr %local.obs.1595
  %t1709 = load i64, ptr %local.delay.1596
  %t1710 = call i64 @"mg_delay"(i64 %t1705, i64 %t1706, i64 %t1707, i64 2, i64 %t1708, i64 %t1709)
  store i64 %t1710, ptr %local.mg.1604
  %t1711 = load i64, ptr %local.a2.1603
  %t1712 = load i64, ptr %local.meta_lr.1598
  %t1713 = load i64, ptr %local.mg.1604
  %t1714 = call i64 @"sx_f64_mul"(i64 %t1712, i64 %t1713)
  %t1715 = call i64 @"sx_f64_sub"(i64 %t1711, i64 %t1714)
  %t1716 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.274)
  %t1717 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.275)
  %t1718 = call i64 @"clamp"(i64 %t1715, i64 %t1716, i64 %t1717)
  store i64 %t1718, ptr %local.a2.1603
  %t1719 = load i64, ptr %local.a0.1601
  %t1720 = load i64, ptr %local.a1.1602
  %t1721 = load i64, ptr %local.a2.1603
  %t1722 = load i64, ptr %local.obs.1595
  %t1723 = load i64, ptr %local.delay.1596
  %t1724 = call i64 @"delay_loss_avg"(i64 %t1719, i64 %t1720, i64 %t1721, i64 %t1722, i64 %t1723)
  store i64 %t1724, ptr %local.loss.1606
  %t1725 = load i64, ptr %local.cycle.1605
  %t1726 = icmp slt i64 %t1725, 5
  %t1727 = zext i1 %t1726 to i64
  %t1728 = icmp ne i64 %t1727, 0
  br i1 %t1728, label %then63, label %else63
then63:
  %t1729 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.276)
  %t1730 = ptrtoint ptr %t1729 to i64
  %t1731 = inttoptr i64 %t1730 to ptr
  call void @intrinsic_print(ptr %t1731)
  %t1732 = load i64, ptr %local.cycle.1605
  call void @print_i64(i64 %t1732)
  %t1733 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.277)
  %t1734 = ptrtoint ptr %t1733 to i64
  %t1735 = inttoptr i64 %t1734 to ptr
  call void @intrinsic_print(ptr %t1735)
  %t1736 = load i64, ptr %local.loss.1606
  %t1737 = call i64 @"print_f64"(i64 %t1736)
  %t1738 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.278)
  %t1739 = ptrtoint ptr %t1738 to i64
  %t1740 = inttoptr i64 %t1739 to ptr
  call void @intrinsic_print(ptr %t1740)
  %t1741 = load i64, ptr %local.a0.1601
  %t1742 = call i64 @"print_f64"(i64 %t1741)
  %t1743 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.279)
  %t1744 = ptrtoint ptr %t1743 to i64
  %t1745 = inttoptr i64 %t1744 to ptr
  call void @intrinsic_print(ptr %t1745)
  %t1746 = load i64, ptr %local.a1.1602
  %t1747 = call i64 @"print_f64"(i64 %t1746)
  %t1748 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.280)
  %t1749 = ptrtoint ptr %t1748 to i64
  %t1750 = inttoptr i64 %t1749 to ptr
  call void @intrinsic_print(ptr %t1750)
  %t1751 = load i64, ptr %local.a2.1603
  %t1752 = call i64 @"print_f64"(i64 %t1751)
  %t1753 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.281)
  %t1754 = ptrtoint ptr %t1753 to i64
  %t1755 = inttoptr i64 %t1754 to ptr
  call void @intrinsic_println(ptr %t1755)
  br label %then63_end
then63_end:
  br label %endif63
else63:
  br label %else63_end
else63_end:
  br label %endif63
endif63:
  %t1756 = phi i64 [ 0, %then63_end ], [ 0, %else63_end ]
  %t1757 = load i64, ptr %local.cycle.1605
  %t1758 = icmp eq i64 %t1757, 19
  %t1759 = zext i1 %t1758 to i64
  %t1760 = icmp ne i64 %t1759, 0
  br i1 %t1760, label %then64, label %else64
then64:
  %t1761 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.282)
  %t1762 = ptrtoint ptr %t1761 to i64
  %t1763 = inttoptr i64 %t1762 to ptr
  call void @intrinsic_print(ptr %t1763)
  %t1764 = load i64, ptr %local.loss.1606
  %t1765 = call i64 @"print_f64"(i64 %t1764)
  %t1766 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.283)
  %t1767 = ptrtoint ptr %t1766 to i64
  %t1768 = inttoptr i64 %t1767 to ptr
  call void @intrinsic_print(ptr %t1768)
  %t1769 = load i64, ptr %local.a0.1601
  %t1770 = call i64 @"print_f64"(i64 %t1769)
  %t1771 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.284)
  %t1772 = ptrtoint ptr %t1771 to i64
  %t1773 = inttoptr i64 %t1772 to ptr
  call void @intrinsic_print(ptr %t1773)
  %t1774 = load i64, ptr %local.a1.1602
  %t1775 = call i64 @"print_f64"(i64 %t1774)
  %t1776 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.285)
  %t1777 = ptrtoint ptr %t1776 to i64
  %t1778 = inttoptr i64 %t1777 to ptr
  call void @intrinsic_print(ptr %t1778)
  %t1779 = load i64, ptr %local.a2.1603
  %t1780 = call i64 @"print_f64"(i64 %t1779)
  %t1781 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.286)
  %t1782 = ptrtoint ptr %t1781 to i64
  %t1783 = inttoptr i64 %t1782 to ptr
  call void @intrinsic_println(ptr %t1783)
  br label %then64_end
then64_end:
  br label %endif64
else64:
  br label %else64_end
else64_end:
  br label %endif64
endif64:
  %t1784 = phi i64 [ 0, %then64_end ], [ 0, %else64_end ]
  %t1785 = load i64, ptr %local.cycle.1605
  %t1786 = icmp eq i64 %t1785, 39
  %t1787 = zext i1 %t1786 to i64
  %t1788 = icmp ne i64 %t1787, 0
  br i1 %t1788, label %then65, label %else65
then65:
  %t1789 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.287)
  %t1790 = ptrtoint ptr %t1789 to i64
  %t1791 = inttoptr i64 %t1790 to ptr
  call void @intrinsic_print(ptr %t1791)
  %t1792 = load i64, ptr %local.loss.1606
  %t1793 = call i64 @"print_f64"(i64 %t1792)
  %t1794 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.288)
  %t1795 = ptrtoint ptr %t1794 to i64
  %t1796 = inttoptr i64 %t1795 to ptr
  call void @intrinsic_print(ptr %t1796)
  %t1797 = load i64, ptr %local.a0.1601
  %t1798 = call i64 @"print_f64"(i64 %t1797)
  %t1799 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.289)
  %t1800 = ptrtoint ptr %t1799 to i64
  %t1801 = inttoptr i64 %t1800 to ptr
  call void @intrinsic_print(ptr %t1801)
  %t1802 = load i64, ptr %local.a1.1602
  %t1803 = call i64 @"print_f64"(i64 %t1802)
  %t1804 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.290)
  %t1805 = ptrtoint ptr %t1804 to i64
  %t1806 = inttoptr i64 %t1805 to ptr
  call void @intrinsic_print(ptr %t1806)
  %t1807 = load i64, ptr %local.a2.1603
  %t1808 = call i64 @"print_f64"(i64 %t1807)
  %t1809 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.291)
  %t1810 = ptrtoint ptr %t1809 to i64
  %t1811 = inttoptr i64 %t1810 to ptr
  call void @intrinsic_println(ptr %t1811)
  br label %then65_end
then65_end:
  br label %endif65
else65:
  br label %else65_end
else65_end:
  br label %endif65
endif65:
  %t1812 = phi i64 [ 0, %then65_end ], [ 0, %else65_end ]
  %t1813 = load i64, ptr %local.cycle.1605
  %t1814 = add i64 %t1813, 1
  store i64 %t1814, ptr %local.cycle.1605
  br label %loop62
endloop62:
  %t1815 = load i64, ptr %local.a0.1601
  %t1816 = load i64, ptr %local.a1.1602
  %t1817 = load i64, ptr %local.a2.1603
  %t1818 = load i64, ptr %local.obs.1595
  %t1819 = load i64, ptr %local.delay.1596
  %t1820 = call i64 @"delay_loss_avg"(i64 %t1815, i64 %t1816, i64 %t1817, i64 %t1818, i64 %t1819)
  store i64 %t1820, ptr %local.loss_learned.1607
  %t1821 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.292)
  %t1822 = ptrtoint ptr %t1821 to i64
  %t1823 = inttoptr i64 %t1822 to ptr
  call void @intrinsic_println(ptr %t1823)
  %t1824 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.293)
  %t1825 = ptrtoint ptr %t1824 to i64
  %t1826 = inttoptr i64 %t1825 to ptr
  call void @intrinsic_println(ptr %t1826)
  %t1827 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.294)
  %t1828 = ptrtoint ptr %t1827 to i64
  %t1829 = inttoptr i64 %t1828 to ptr
  call void @intrinsic_print(ptr %t1829)
  %t1830 = load i64, ptr %local.loss_learned.1607
  %t1831 = call i64 @"print_f64"(i64 %t1830)
  %t1832 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.295)
  %t1833 = ptrtoint ptr %t1832 to i64
  %t1834 = inttoptr i64 %t1833 to ptr
  call void @intrinsic_println(ptr %t1834)
  %t1835 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.296)
  %t1836 = ptrtoint ptr %t1835 to i64
  %t1837 = inttoptr i64 %t1836 to ptr
  call void @intrinsic_print(ptr %t1837)
  %t1838 = load i64, ptr %local.a0.1601
  %t1839 = call i64 @"print_f64"(i64 %t1838)
  %t1840 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.297)
  %t1841 = ptrtoint ptr %t1840 to i64
  %t1842 = inttoptr i64 %t1841 to ptr
  call void @intrinsic_println(ptr %t1842)
  %t1843 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.298)
  %t1844 = ptrtoint ptr %t1843 to i64
  %t1845 = inttoptr i64 %t1844 to ptr
  call void @intrinsic_print(ptr %t1845)
  %t1846 = load i64, ptr %local.a1.1602
  %t1847 = call i64 @"print_f64"(i64 %t1846)
  %t1848 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.299)
  %t1849 = ptrtoint ptr %t1848 to i64
  %t1850 = inttoptr i64 %t1849 to ptr
  call void @intrinsic_println(ptr %t1850)
  %t1851 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.300)
  %t1852 = ptrtoint ptr %t1851 to i64
  %t1853 = inttoptr i64 %t1852 to ptr
  call void @intrinsic_print(ptr %t1853)
  %t1854 = load i64, ptr %local.a2.1603
  %t1855 = call i64 @"print_f64"(i64 %t1854)
  %t1856 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.301)
  %t1857 = ptrtoint ptr %t1856 to i64
  %t1858 = inttoptr i64 %t1857 to ptr
  call void @intrinsic_println(ptr %t1858)
  %t1859 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.302)
  %t1860 = ptrtoint ptr %t1859 to i64
  %t1861 = inttoptr i64 %t1860 to ptr
  call void @intrinsic_println(ptr %t1861)
  %t1862 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.303)
  %t1863 = ptrtoint ptr %t1862 to i64
  %t1864 = inttoptr i64 %t1863 to ptr
  call void @intrinsic_println(ptr %t1864)
  %t1865 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.304)
  %t1866 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.305)
  %t1867 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.306)
  %t1868 = load i64, ptr %local.delay.1596
  %t1869 = call i64 @"snapshot_error"(i64 %t1865, i64 %t1866, i64 %t1867, i64 50, i64 %t1868)
  store i64 %t1869, ptr %local.early_none.1608
  %t1870 = load i64, ptr %local.a0.1601
  %t1871 = load i64, ptr %local.a1.1602
  %t1872 = load i64, ptr %local.a2.1603
  %t1873 = load i64, ptr %local.delay.1596
  %t1874 = call i64 @"snapshot_error"(i64 %t1870, i64 %t1871, i64 %t1872, i64 50, i64 %t1873)
  store i64 %t1874, ptr %local.early_learn.1609
  %t1875 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.307)
  %t1876 = ptrtoint ptr %t1875 to i64
  %t1877 = inttoptr i64 %t1876 to ptr
  call void @intrinsic_print(ptr %t1877)
  %t1878 = load i64, ptr %local.early_none.1608
  %t1879 = call i64 @"print_f64"(i64 %t1878)
  %t1880 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.308)
  %t1881 = ptrtoint ptr %t1880 to i64
  %t1882 = inttoptr i64 %t1881 to ptr
  call void @intrinsic_println(ptr %t1882)
  %t1883 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.309)
  %t1884 = ptrtoint ptr %t1883 to i64
  %t1885 = inttoptr i64 %t1884 to ptr
  call void @intrinsic_print(ptr %t1885)
  %t1886 = load i64, ptr %local.early_learn.1609
  %t1887 = call i64 @"print_f64"(i64 %t1886)
  %t1888 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.310)
  %t1889 = ptrtoint ptr %t1888 to i64
  %t1890 = inttoptr i64 %t1889 to ptr
  call void @intrinsic_println(ptr %t1890)
  %t1891 = load i64, ptr %local.early_learn.1609
  %t1892 = load i64, ptr %local.early_none.1608
  %t1893 = call i64 @"sx_f64_lt"(i64 %t1891, i64 %t1892)
  %t1894 = icmp ne i64 %t1893, 0
  br i1 %t1894, label %then66, label %else66
then66:
  %t1895 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.311)
  %t1896 = ptrtoint ptr %t1895 to i64
  %t1897 = inttoptr i64 %t1896 to ptr
  call void @intrinsic_println(ptr %t1897)
  %t1898 = load i64, ptr %local.early_none.1608
  %t1899 = load i64, ptr %local.early_learn.1609
  %t1900 = call i64 @"sx_f64_sub"(i64 %t1898, i64 %t1899)
  %t1901 = load i64, ptr %local.early_none.1608
  %t1902 = call i64 @f64_parse(ptr @.str.exp_belief_cascade.312)
  %t1903 = call i64 @"sx_f64_add"(i64 %t1901, i64 %t1902)
  %t1904 = call i64 @"sx_f64_div"(i64 %t1900, i64 %t1903)
  store i64 %t1904, ptr %local.speedup.1610
  %t1905 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.313)
  %t1906 = ptrtoint ptr %t1905 to i64
  %t1907 = inttoptr i64 %t1906 to ptr
  call void @intrinsic_print(ptr %t1907)
  %t1908 = load i64, ptr %local.speedup.1610
  %t1909 = call i64 @"print_f64"(i64 %t1908)
  %t1910 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.314)
  %t1911 = ptrtoint ptr %t1910 to i64
  %t1912 = inttoptr i64 %t1911 to ptr
  call void @intrinsic_println(ptr %t1912)
  br label %then66_end
then66_end:
  br label %endif66
else66:
  br label %else66_end
else66_end:
  br label %endif66
endif66:
  %t1913 = phi i64 [ 0, %then66_end ], [ 0, %else66_end ]
  %t1914 = load i64, ptr %local.a0.1601
  %t1915 = load i64, ptr %local.a2.1603
  %t1916 = call i64 @"sx_f64_gt"(i64 %t1914, i64 %t1915)
  %t1917 = icmp ne i64 %t1916, 0
  br i1 %t1917, label %then67, label %else67
then67:
  %t1918 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.315)
  %t1919 = ptrtoint ptr %t1918 to i64
  %t1920 = inttoptr i64 %t1919 to ptr
  call void @intrinsic_println(ptr %t1920)
  %t1921 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.316)
  %t1922 = ptrtoint ptr %t1921 to i64
  %t1923 = inttoptr i64 %t1922 to ptr
  call void @intrinsic_println(ptr %t1923)
  br label %then67_end
then67_end:
  br label %endif67
else67:
  br label %else67_end
else67_end:
  br label %endif67
endif67:
  %t1924 = phi i64 [ 0, %then67_end ], [ 0, %else67_end ]
  %t1925 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.317)
  %t1926 = ptrtoint ptr %t1925 to i64
  %t1927 = inttoptr i64 %t1926 to ptr
  call void @intrinsic_println(ptr %t1927)
  ret i64 0
}

define i64 @"simplex_main"() nounwind {
entry:
  %t1928 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.318)
  %t1929 = ptrtoint ptr %t1928 to i64
  %t1930 = inttoptr i64 %t1929 to ptr
  call void @intrinsic_println(ptr %t1930)
  %t1931 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.319)
  %t1932 = ptrtoint ptr %t1931 to i64
  %t1933 = inttoptr i64 %t1932 to ptr
  call void @intrinsic_println(ptr %t1933)
  %t1934 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.320)
  %t1935 = ptrtoint ptr %t1934 to i64
  %t1936 = inttoptr i64 %t1935 to ptr
  call void @intrinsic_println(ptr %t1936)
  %t1937 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.321)
  %t1938 = ptrtoint ptr %t1937 to i64
  %t1939 = inttoptr i64 %t1938 to ptr
  call void @intrinsic_println(ptr %t1939)
  %t1940 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.322)
  %t1941 = ptrtoint ptr %t1940 to i64
  %t1942 = inttoptr i64 %t1941 to ptr
  call void @intrinsic_println(ptr %t1942)
  %t1943 = call i64 @"run_exp1"()
  %t1944 = call i64 @"run_exp2"()
  %t1945 = call i64 @"run_exp3"()
  %t1946 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.323)
  %t1947 = ptrtoint ptr %t1946 to i64
  %t1948 = inttoptr i64 %t1947 to ptr
  call void @intrinsic_println(ptr %t1948)
  %t1949 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.324)
  %t1950 = ptrtoint ptr %t1949 to i64
  %t1951 = inttoptr i64 %t1950 to ptr
  call void @intrinsic_println(ptr %t1951)
  %t1952 = call ptr @intrinsic_string_new(ptr @.str.exp_belief_cascade.325)
  %t1953 = ptrtoint ptr %t1952 to i64
  %t1954 = inttoptr i64 %t1953 to ptr
  call void @intrinsic_println(ptr %t1954)
  ret i64 0
}


; String constants
@.str.exp_belief_cascade.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.2 = private unnamed_addr constant [8 x i8] c"10000.0\00"
@.str.exp_belief_cascade.3 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_belief_cascade.4 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_belief_cascade.5 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_belief_cascade.6 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_belief_cascade.7 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_belief_cascade.8 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_belief_cascade.9 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_belief_cascade.10 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_belief_cascade.11 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_belief_cascade.12 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_belief_cascade.13 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.14 = private unnamed_addr constant [4 x i8] c"0.8\00"
@.str.exp_belief_cascade.15 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_belief_cascade.16 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_belief_cascade.17 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_belief_cascade.18 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_belief_cascade.19 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_belief_cascade.20 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_belief_cascade.21 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_belief_cascade.22 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.23 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_belief_cascade.24 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_belief_cascade.25 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_belief_cascade.26 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_belief_cascade.27 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.28 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_belief_cascade.29 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_belief_cascade.30 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_belief_cascade.31 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_belief_cascade.32 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.33 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_belief_cascade.34 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_belief_cascade.35 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_belief_cascade.36 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_belief_cascade.37 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.38 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_belief_cascade.39 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_belief_cascade.40 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_belief_cascade.41 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_belief_cascade.42 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_belief_cascade.43 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_belief_cascade.44 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_belief_cascade.45 = private unnamed_addr constant [37 x i8] c"  EXP 1: BELIEF CHAIN  A->B->C->D->E\00"
@.str.exp_belief_cascade.46 = private unnamed_addr constant [38 x i8] c"  True: A=0.8 B=0.7 C=0.5 D=0.3 E=0.2\00"
@.str.exp_belief_cascade.47 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_belief_cascade.48 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.49 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_belief_cascade.50 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.51 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.52 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.53 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.54 = private unnamed_addr constant [30 x i8] c"  No interaction:       loss=\00"
@.str.exp_belief_cascade.55 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.56 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_belief_cascade.57 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_belief_cascade.58 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_belief_cascade.59 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_belief_cascade.60 = private unnamed_addr constant [30 x i8] c"  Uniform (alpha=1.0):  loss=\00"
@.str.exp_belief_cascade.61 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.62 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_belief_cascade.63 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_belief_cascade.64 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_belief_cascade.65 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_belief_cascade.66 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.67 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.68 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.69 = private unnamed_addr constant [52 x i8] c"  Cycle  Loss       a_AB     a_BC     a_CD     a_DE\00"
@.str.exp_belief_cascade.70 = private unnamed_addr constant [55 x i8] c"  -----  ---------  -------  -------  -------  -------\00"
@.str.exp_belief_cascade.71 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.72 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_belief_cascade.73 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.74 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_belief_cascade.75 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.76 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_belief_cascade.77 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.78 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_belief_cascade.79 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_belief_cascade.80 = private unnamed_addr constant [7 x i8] c"      \00"
@.str.exp_belief_cascade.81 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_belief_cascade.82 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_belief_cascade.83 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_belief_cascade.84 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_belief_cascade.85 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.86 = private unnamed_addr constant [10 x i8] c"  19     \00"
@.str.exp_belief_cascade.87 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_belief_cascade.88 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_belief_cascade.89 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_belief_cascade.90 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_belief_cascade.91 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.92 = private unnamed_addr constant [10 x i8] c"  39     \00"
@.str.exp_belief_cascade.93 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_belief_cascade.94 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_belief_cascade.95 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_belief_cascade.96 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_belief_cascade.97 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.98 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.99 = private unnamed_addr constant [24 x i8] c"  --- Chain Results ---\00"
@.str.exp_belief_cascade.100 = private unnamed_addr constant [30 x i8] c"  Learned chain:        loss=\00"
@.str.exp_belief_cascade.101 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.102 = private unnamed_addr constant [15 x i8] c"  alpha A->B: \00"
@.str.exp_belief_cascade.103 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.104 = private unnamed_addr constant [15 x i8] c"  alpha B->C: \00"
@.str.exp_belief_cascade.105 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.106 = private unnamed_addr constant [15 x i8] c"  alpha C->D: \00"
@.str.exp_belief_cascade.107 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.108 = private unnamed_addr constant [15 x i8] c"  alpha D->E: \00"
@.str.exp_belief_cascade.109 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.110 = private unnamed_addr constant [69 x i8] c"  FINDING: Early chain links (A->B) couple stronger than late (D->E)\00"
@.str.exp_belief_cascade.111 = private unnamed_addr constant [51 x i8] c"  FINDING: Learned chain BEATS independent beliefs\00"
@.str.exp_belief_cascade.112 = private unnamed_addr constant [51 x i8] c"  FINDING: Learned chain BEATS uniform interaction\00"
@.str.exp_belief_cascade.113 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.114 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_belief_cascade.115 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_belief_cascade.116 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_belief_cascade.117 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_belief_cascade.118 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_belief_cascade.119 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_belief_cascade.120 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.121 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_belief_cascade.122 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.exp_belief_cascade.123 = private unnamed_addr constant [4 x i8] c"0.8\00"
@.str.exp_belief_cascade.124 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_belief_cascade.125 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_belief_cascade.126 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_belief_cascade.127 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.128 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_belief_cascade.129 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_belief_cascade.130 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_belief_cascade.131 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_belief_cascade.132 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.133 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_belief_cascade.134 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_belief_cascade.135 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_belief_cascade.136 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_belief_cascade.137 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.138 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_belief_cascade.139 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_belief_cascade.140 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_belief_cascade.141 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_belief_cascade.142 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_belief_cascade.143 = private unnamed_addr constant [38 x i8] c"  EXP 2: CIRCULAR BELIEFS  A->B->C->A\00"
@.str.exp_belief_cascade.144 = private unnamed_addr constant [26 x i8] c"  True: A=0.7 B=0.4 C=0.8\00"
@.str.exp_belief_cascade.145 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_belief_cascade.146 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.147 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_belief_cascade.148 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.149 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.150 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.151 = private unnamed_addr constant [30 x i8] c"  No interaction:       loss=\00"
@.str.exp_belief_cascade.152 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.153 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_belief_cascade.154 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_belief_cascade.155 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_belief_cascade.156 = private unnamed_addr constant [30 x i8] c"  Uniform (alpha=1.0):  loss=\00"
@.str.exp_belief_cascade.157 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.158 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_belief_cascade.159 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_belief_cascade.160 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_belief_cascade.161 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.162 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.163 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_belief_cascade.164 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_belief_cascade.165 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_belief_cascade.166 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.167 = private unnamed_addr constant [43 x i8] c"  Cycle  Loss       a_AB     a_BC     a_CA\00"
@.str.exp_belief_cascade.168 = private unnamed_addr constant [46 x i8] c"  -----  ---------  -------  -------  -------\00"
@.str.exp_belief_cascade.169 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.170 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_belief_cascade.171 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.172 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_belief_cascade.173 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.174 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_belief_cascade.175 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_belief_cascade.176 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.177 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_belief_cascade.178 = private unnamed_addr constant [7 x i8] c"      \00"
@.str.exp_belief_cascade.179 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_belief_cascade.180 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_belief_cascade.181 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_belief_cascade.182 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.183 = private unnamed_addr constant [10 x i8] c"  19     \00"
@.str.exp_belief_cascade.184 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_belief_cascade.185 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_belief_cascade.186 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_belief_cascade.187 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.188 = private unnamed_addr constant [10 x i8] c"  39     \00"
@.str.exp_belief_cascade.189 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_belief_cascade.190 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_belief_cascade.191 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_belief_cascade.192 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.193 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.194 = private unnamed_addr constant [27 x i8] c"  --- Circular Results ---\00"
@.str.exp_belief_cascade.195 = private unnamed_addr constant [30 x i8] c"  Learned cycle:        loss=\00"
@.str.exp_belief_cascade.196 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.197 = private unnamed_addr constant [15 x i8] c"  alpha A->B: \00"
@.str.exp_belief_cascade.198 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.199 = private unnamed_addr constant [15 x i8] c"  alpha B->C: \00"
@.str.exp_belief_cascade.200 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.201 = private unnamed_addr constant [15 x i8] c"  alpha C->A: \00"
@.str.exp_belief_cascade.202 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.203 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_belief_cascade.204 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_belief_cascade.205 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_belief_cascade.206 = private unnamed_addr constant [56 x i8] c"  FINDING: System BROKE the cycle (one alpha near zero)\00"
@.str.exp_belief_cascade.207 = private unnamed_addr constant [59 x i8] c"  FINDING: Cycle maintained — all alphas remain positive\00"
@.str.exp_belief_cascade.208 = private unnamed_addr constant [32 x i8] c"  Oscillation events detected: \00"
@.str.exp_belief_cascade.209 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.210 = private unnamed_addr constant [50 x i8] c"  FINDING: Circular interaction IMPROVES accuracy\00"
@.str.exp_belief_cascade.211 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.212 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_belief_cascade.213 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_belief_cascade.214 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_belief_cascade.215 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_belief_cascade.216 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_belief_cascade.217 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_belief_cascade.218 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_belief_cascade.219 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_belief_cascade.220 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.221 = private unnamed_addr constant [5 x i8] c"0.75\00"
@.str.exp_belief_cascade.222 = private unnamed_addr constant [4 x i8] c"0.6\00"
@.str.exp_belief_cascade.223 = private unnamed_addr constant [5 x i8] c"0.45\00"
@.str.exp_belief_cascade.224 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_belief_cascade.225 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_belief_cascade.226 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_belief_cascade.227 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_belief_cascade.228 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.229 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_belief_cascade.230 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_belief_cascade.231 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_belief_cascade.232 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_belief_cascade.233 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.234 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_belief_cascade.235 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_belief_cascade.236 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_belief_cascade.237 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_belief_cascade.238 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.239 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_belief_cascade.240 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_belief_cascade.241 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_belief_cascade.242 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_belief_cascade.243 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_belief_cascade.244 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_belief_cascade.245 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_belief_cascade.246 = private unnamed_addr constant [23 x i8] c"  EXP 3: CASCADE DELAY\00"
@.str.exp_belief_cascade.247 = private unnamed_addr constant [40 x i8] c"  4 beliefs, evidence delay=10 per link\00"
@.str.exp_belief_cascade.248 = private unnamed_addr constant [34 x i8] c"  True: A=0.75 B=0.6 C=0.45 D=0.3\00"
@.str.exp_belief_cascade.249 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_belief_cascade.250 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.251 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_belief_cascade.252 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.253 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.254 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.255 = private unnamed_addr constant [30 x i8] c"  No interaction:       loss=\00"
@.str.exp_belief_cascade.256 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.257 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_belief_cascade.258 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_belief_cascade.259 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_belief_cascade.260 = private unnamed_addr constant [30 x i8] c"  Uniform (alpha=1.0):  loss=\00"
@.str.exp_belief_cascade.261 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.262 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_belief_cascade.263 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_belief_cascade.264 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_belief_cascade.265 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.266 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.267 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.268 = private unnamed_addr constant [43 x i8] c"  Cycle  Loss       a_AB     a_BC     a_CD\00"
@.str.exp_belief_cascade.269 = private unnamed_addr constant [46 x i8] c"  -----  ---------  -------  -------  -------\00"
@.str.exp_belief_cascade.270 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.271 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_belief_cascade.272 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.273 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_belief_cascade.274 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.275 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_belief_cascade.276 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_belief_cascade.277 = private unnamed_addr constant [7 x i8] c"      \00"
@.str.exp_belief_cascade.278 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_belief_cascade.279 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_belief_cascade.280 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_belief_cascade.281 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.282 = private unnamed_addr constant [10 x i8] c"  19     \00"
@.str.exp_belief_cascade.283 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_belief_cascade.284 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_belief_cascade.285 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_belief_cascade.286 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.287 = private unnamed_addr constant [10 x i8] c"  39     \00"
@.str.exp_belief_cascade.288 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_belief_cascade.289 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_belief_cascade.290 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_belief_cascade.291 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.292 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.293 = private unnamed_addr constant [24 x i8] c"  --- Delay Results ---\00"
@.str.exp_belief_cascade.294 = private unnamed_addr constant [30 x i8] c"  Learned delay chain:  loss=\00"
@.str.exp_belief_cascade.295 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.296 = private unnamed_addr constant [15 x i8] c"  alpha A->B: \00"
@.str.exp_belief_cascade.297 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.298 = private unnamed_addr constant [15 x i8] c"  alpha B->C: \00"
@.str.exp_belief_cascade.299 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.300 = private unnamed_addr constant [15 x i8] c"  alpha C->D: \00"
@.str.exp_belief_cascade.301 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.302 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.303 = private unnamed_addr constant [40 x i8] c"  --- Information Propagation Speed ---\00"
@.str.exp_belief_cascade.304 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.305 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.306 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_belief_cascade.307 = private unnamed_addr constant [38 x i8] c"  Error at obs=50 (no interaction):  \00"
@.str.exp_belief_cascade.308 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.309 = private unnamed_addr constant [38 x i8] c"  Error at obs=50 (learned chain):   \00"
@.str.exp_belief_cascade.310 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.311 = private unnamed_addr constant [65 x i8] c"  FINDING: Learned interaction SPEEDS UP information propagation\00"
@.str.exp_belief_cascade.312 = private unnamed_addr constant [10 x i8] c"0.0000001\00"
@.str.exp_belief_cascade.313 = private unnamed_addr constant [19 x i8] c"  Speedup factor: \00"
@.str.exp_belief_cascade.314 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.315 = private unnamed_addr constant [53 x i8] c"  FINDING: Early links (A->B) have stronger coupling\00"
@.str.exp_belief_cascade.316 = private unnamed_addr constant [57 x i8] c"           Compensates for longer propagation delay to D\00"
@.str.exp_belief_cascade.317 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.318 = private unnamed_addr constant [45 x i8] c"############################################\00"
@.str.exp_belief_cascade.319 = private unnamed_addr constant [45 x i8] c"#      BELIEF CASCADE EXPERIMENTS          #\00"
@.str.exp_belief_cascade.320 = private unnamed_addr constant [46 x i8] c"#  Information flow through belief chains   #\00"
@.str.exp_belief_cascade.321 = private unnamed_addr constant [45 x i8] c"############################################\00"
@.str.exp_belief_cascade.322 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_belief_cascade.323 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_belief_cascade.324 = private unnamed_addr constant [27 x i8] c"  ALL EXPERIMENTS COMPLETE\00"
@.str.exp_belief_cascade.325 = private unnamed_addr constant [45 x i8] c"============================================\00"
