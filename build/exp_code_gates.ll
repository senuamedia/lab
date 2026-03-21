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
  %t1 = call i64 @f64_parse(ptr @.str.exp_code_gates.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_code_gates.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"clamp"(i64 %x, i64 %lo, i64 %hi) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %local.lo = alloca i64
  store i64 %lo, ptr %local.lo
  %local.hi = alloca i64
  store i64 %hi, ptr %local.hi
  %t9 = load i64, ptr %local.x
  %t10 = load i64, ptr %local.lo
  %t11 = call i64 @"sx_f64_lt"(i64 %t9, i64 %t10)
  %t12 = icmp ne i64 %t11, 0
  br i1 %t12, label %then1, label %else1
then1:
  %t13 = load i64, ptr %local.lo
  ret i64 %t13
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t14 = phi i64 [ 0, %else1_end ]
  %t15 = load i64, ptr %local.x
  %t16 = load i64, ptr %local.hi
  %t17 = call i64 @"sx_f64_gt"(i64 %t15, i64 %t16)
  %t18 = icmp ne i64 %t17, 0
  br i1 %t18, label %then2, label %else2
then2:
  %t19 = load i64, ptr %local.hi
  ret i64 %t19
else2:
  br label %else2_end
else2_end:
  br label %endif2
endif2:
  %t20 = phi i64 [ 0, %else2_end ]
  %t21 = load i64, ptr %local.x
  ret i64 %t21
}

define i64 @"dot4"(i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %b0, i64 %b1, i64 %b2, i64 %b3) nounwind {
entry:
  %local.a0 = alloca i64
  store i64 %a0, ptr %local.a0
  %local.a1 = alloca i64
  store i64 %a1, ptr %local.a1
  %local.a2 = alloca i64
  store i64 %a2, ptr %local.a2
  %local.a3 = alloca i64
  store i64 %a3, ptr %local.a3
  %local.b0 = alloca i64
  store i64 %b0, ptr %local.b0
  %local.b1 = alloca i64
  store i64 %b1, ptr %local.b1
  %local.b2 = alloca i64
  store i64 %b2, ptr %local.b2
  %local.b3 = alloca i64
  store i64 %b3, ptr %local.b3
  %t22 = load i64, ptr %local.a0
  %t23 = load i64, ptr %local.b0
  %t24 = call i64 @"sx_f64_mul"(i64 %t22, i64 %t23)
  %t25 = load i64, ptr %local.a1
  %t26 = load i64, ptr %local.b1
  %t27 = call i64 @"sx_f64_mul"(i64 %t25, i64 %t26)
  %t28 = call i64 @"sx_f64_add"(i64 %t24, i64 %t27)
  %t29 = load i64, ptr %local.a2
  %t30 = load i64, ptr %local.b2
  %t31 = call i64 @"sx_f64_mul"(i64 %t29, i64 %t30)
  %t32 = call i64 @"sx_f64_add"(i64 %t28, i64 %t31)
  %t33 = load i64, ptr %local.a3
  %t34 = load i64, ptr %local.b3
  %t35 = call i64 @"sx_f64_mul"(i64 %t33, i64 %t34)
  %t36 = call i64 @"sx_f64_add"(i64 %t32, i64 %t35)
  ret i64 %t36
}

define i64 @"norm4"(i64 %a0, i64 %a1, i64 %a2, i64 %a3) nounwind {
entry:
  %local.a0 = alloca i64
  store i64 %a0, ptr %local.a0
  %local.a1 = alloca i64
  store i64 %a1, ptr %local.a1
  %local.a2 = alloca i64
  store i64 %a2, ptr %local.a2
  %local.a3 = alloca i64
  store i64 %a3, ptr %local.a3
  %t37 = load i64, ptr %local.a0
  %t38 = load i64, ptr %local.a1
  %t39 = load i64, ptr %local.a2
  %t40 = load i64, ptr %local.a3
  %t41 = load i64, ptr %local.a0
  %t42 = load i64, ptr %local.a1
  %t43 = load i64, ptr %local.a2
  %t44 = load i64, ptr %local.a3
  %t45 = call i64 @"dot4"(i64 %t37, i64 %t38, i64 %t39, i64 %t40, i64 %t41, i64 %t42, i64 %t43, i64 %t44)
  %t46 = call i64 @f64_parse(ptr @.str.exp_code_gates.2)
  %t47 = call i64 @"sx_f64_add"(i64 %t45, i64 %t46)
  %t48 = call i64 @"sqrt_f64"(i64 %t47)
  ret i64 %t48
}

define i64 @"cosine4"(i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %b0, i64 %b1, i64 %b2, i64 %b3) nounwind {
entry:
  %local.d.49 = alloca i64
  %local.na.50 = alloca i64
  %local.nb.51 = alloca i64
  %local.a0 = alloca i64
  store i64 %a0, ptr %local.a0
  %local.a1 = alloca i64
  store i64 %a1, ptr %local.a1
  %local.a2 = alloca i64
  store i64 %a2, ptr %local.a2
  %local.a3 = alloca i64
  store i64 %a3, ptr %local.a3
  %local.b0 = alloca i64
  store i64 %b0, ptr %local.b0
  %local.b1 = alloca i64
  store i64 %b1, ptr %local.b1
  %local.b2 = alloca i64
  store i64 %b2, ptr %local.b2
  %local.b3 = alloca i64
  store i64 %b3, ptr %local.b3
  %t52 = load i64, ptr %local.a0
  %t53 = load i64, ptr %local.a1
  %t54 = load i64, ptr %local.a2
  %t55 = load i64, ptr %local.a3
  %t56 = load i64, ptr %local.b0
  %t57 = load i64, ptr %local.b1
  %t58 = load i64, ptr %local.b2
  %t59 = load i64, ptr %local.b3
  %t60 = call i64 @"dot4"(i64 %t52, i64 %t53, i64 %t54, i64 %t55, i64 %t56, i64 %t57, i64 %t58, i64 %t59)
  store i64 %t60, ptr %local.d.49
  %t61 = load i64, ptr %local.a0
  %t62 = load i64, ptr %local.a1
  %t63 = load i64, ptr %local.a2
  %t64 = load i64, ptr %local.a3
  %t65 = call i64 @"norm4"(i64 %t61, i64 %t62, i64 %t63, i64 %t64)
  store i64 %t65, ptr %local.na.50
  %t66 = load i64, ptr %local.b0
  %t67 = load i64, ptr %local.b1
  %t68 = load i64, ptr %local.b2
  %t69 = load i64, ptr %local.b3
  %t70 = call i64 @"norm4"(i64 %t66, i64 %t67, i64 %t68, i64 %t69)
  store i64 %t70, ptr %local.nb.51
  %t71 = load i64, ptr %local.d.49
  %t72 = load i64, ptr %local.na.50
  %t73 = load i64, ptr %local.nb.51
  %t74 = call i64 @"sx_f64_mul"(i64 %t72, i64 %t73)
  %t75 = call i64 @f64_parse(ptr @.str.exp_code_gates.3)
  %t76 = call i64 @"sx_f64_add"(i64 %t74, i64 %t75)
  %t77 = call i64 @"sx_f64_div"(i64 %t71, i64 %t76)
  ret i64 %t77
}

define i64 @"lcg_next"(i64 %state) nounwind {
entry:
  %local.state = alloca i64
  store i64 %state, ptr %local.state
  %t78 = load i64, ptr %local.state
  %t79 = mul i64 %t78, 1664525
  %t80 = add i64 %t79, 1013904223
  ret i64 %t80
}

define i64 @"lcg_f64"(i64 %state) nounwind {
entry:
  %local.s.81 = alloca i64
  %local.m.82 = alloca i64
  %local.r.83 = alloca i64
  %local.rf.84 = alloca i64
  %local.mf.85 = alloca i64
  %local.state = alloca i64
  store i64 %state, ptr %local.state
  %t86 = load i64, ptr %local.state
  store i64 %t86, ptr %local.s.81
  %t87 = load i64, ptr %local.s.81
  %t88 = icmp slt i64 %t87, 0
  %t89 = zext i1 %t88 to i64
  %t90 = icmp ne i64 %t89, 0
  br i1 %t90, label %then3, label %else3
then3:
  %t91 = load i64, ptr %local.s.81
  %t92 = sub i64 0, %t91
  store i64 %t92, ptr %local.s.81
  br label %then3_end
then3_end:
  br label %endif3
else3:
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t93 = phi i64 [ 0, %then3_end ], [ 0, %else3_end ]
  store i64 2147483647, ptr %local.m.82
  %t94 = load i64, ptr %local.s.81
  %t95 = load i64, ptr %local.m.82
  %t96 = srem i64 %t94, %t95
  store i64 %t96, ptr %local.r.83
  %t97 = load i64, ptr %local.r.83
  %t98 = call i64 @"sx_int_to_f64"(i64 %t97)
  store i64 %t98, ptr %local.rf.84
  %t99 = load i64, ptr %local.m.82
  %t100 = call i64 @"sx_int_to_f64"(i64 %t99)
  store i64 %t100, ptr %local.mf.85
  %t101 = load i64, ptr %local.rf.84
  %t102 = load i64, ptr %local.mf.85
  %t103 = call i64 @"sx_f64_div"(i64 %t101, i64 %t102)
  ret i64 %t103
}

define i64 @"project_dim"(i64 %gi, i64 %gj_0, i64 %gj_1, i64 %gj_2, i64 %gj_3, i64 %gi_0, i64 %gi_1, i64 %gi_2, i64 %gi_3, i64 %alpha, i64 %dim) nounwind {
entry:
  %local.cos_val.104 = alloca i64
  %local.scale.105 = alloca i64
  %local.gj_sq.106 = alloca i64
  %local.proj.107 = alloca i64
  %local.gi = alloca i64
  store i64 %gi, ptr %local.gi
  %local.gj_0 = alloca i64
  store i64 %gj_0, ptr %local.gj_0
  %local.gj_1 = alloca i64
  store i64 %gj_1, ptr %local.gj_1
  %local.gj_2 = alloca i64
  store i64 %gj_2, ptr %local.gj_2
  %local.gj_3 = alloca i64
  store i64 %gj_3, ptr %local.gj_3
  %local.gi_0 = alloca i64
  store i64 %gi_0, ptr %local.gi_0
  %local.gi_1 = alloca i64
  store i64 %gi_1, ptr %local.gi_1
  %local.gi_2 = alloca i64
  store i64 %gi_2, ptr %local.gi_2
  %local.gi_3 = alloca i64
  store i64 %gi_3, ptr %local.gi_3
  %local.alpha = alloca i64
  store i64 %alpha, ptr %local.alpha
  %local.dim = alloca i64
  store i64 %dim, ptr %local.dim
  %t108 = load i64, ptr %local.gi_0
  %t109 = load i64, ptr %local.gi_1
  %t110 = load i64, ptr %local.gi_2
  %t111 = load i64, ptr %local.gi_3
  %t112 = load i64, ptr %local.gj_0
  %t113 = load i64, ptr %local.gj_1
  %t114 = load i64, ptr %local.gj_2
  %t115 = load i64, ptr %local.gj_3
  %t116 = call i64 @"cosine4"(i64 %t108, i64 %t109, i64 %t110, i64 %t111, i64 %t112, i64 %t113, i64 %t114, i64 %t115)
  store i64 %t116, ptr %local.cos_val.104
  %t117 = load i64, ptr %local.cos_val.104
  %t118 = call i64 @f64_parse(ptr @.str.exp_code_gates.4)
  %t119 = call i64 @"sx_f64_ge"(i64 %t117, i64 %t118)
  %t120 = icmp ne i64 %t119, 0
  br i1 %t120, label %then4, label %else4
then4:
  %t121 = load i64, ptr %local.gi
  ret i64 %t121
else4:
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t122 = phi i64 [ 0, %else4_end ]
  %t123 = load i64, ptr %local.alpha
  %t124 = call i64 @f64_parse(ptr @.str.exp_code_gates.5)
  %t125 = load i64, ptr %local.cos_val.104
  %t126 = call i64 @"sx_f64_sub"(i64 %t124, i64 %t125)
  %t127 = call i64 @"sx_f64_mul"(i64 %t123, i64 %t126)
  store i64 %t127, ptr %local.scale.105
  %t128 = load i64, ptr %local.gj_0
  %t129 = load i64, ptr %local.gj_1
  %t130 = load i64, ptr %local.gj_2
  %t131 = load i64, ptr %local.gj_3
  %t132 = load i64, ptr %local.gj_0
  %t133 = load i64, ptr %local.gj_1
  %t134 = load i64, ptr %local.gj_2
  %t135 = load i64, ptr %local.gj_3
  %t136 = call i64 @"dot4"(i64 %t128, i64 %t129, i64 %t130, i64 %t131, i64 %t132, i64 %t133, i64 %t134, i64 %t135)
  %t137 = call i64 @f64_parse(ptr @.str.exp_code_gates.6)
  %t138 = call i64 @"sx_f64_add"(i64 %t136, i64 %t137)
  store i64 %t138, ptr %local.gj_sq.106
  %t139 = load i64, ptr %local.scale.105
  %t140 = load i64, ptr %local.gi_0
  %t141 = load i64, ptr %local.gi_1
  %t142 = load i64, ptr %local.gi_2
  %t143 = load i64, ptr %local.gi_3
  %t144 = load i64, ptr %local.gj_0
  %t145 = load i64, ptr %local.gj_1
  %t146 = load i64, ptr %local.gj_2
  %t147 = load i64, ptr %local.gj_3
  %t148 = call i64 @"dot4"(i64 %t140, i64 %t141, i64 %t142, i64 %t143, i64 %t144, i64 %t145, i64 %t146, i64 %t147)
  %t149 = call i64 @"sx_f64_mul"(i64 %t139, i64 %t148)
  %t150 = load i64, ptr %local.gj_sq.106
  %t151 = call i64 @"sx_f64_div"(i64 %t149, i64 %t150)
  store i64 %t151, ptr %local.proj.107
  %t152 = load i64, ptr %local.dim
  %t153 = icmp eq i64 %t152, 0
  %t154 = zext i1 %t153 to i64
  %t155 = icmp ne i64 %t154, 0
  br i1 %t155, label %then5, label %else5
then5:
  %t156 = load i64, ptr %local.gi
  %t157 = load i64, ptr %local.proj.107
  %t158 = load i64, ptr %local.gj_0
  %t159 = call i64 @"sx_f64_mul"(i64 %t157, i64 %t158)
  %t160 = call i64 @"sx_f64_sub"(i64 %t156, i64 %t159)
  br label %then5_end
then5_end:
  br label %endif5
else5:
  %t161 = load i64, ptr %local.dim
  %t162 = icmp eq i64 %t161, 1
  %t163 = zext i1 %t162 to i64
  %t164 = icmp ne i64 %t163, 0
  br i1 %t164, label %then6, label %else6
then6:
  %t165 = load i64, ptr %local.gi
  %t166 = load i64, ptr %local.proj.107
  %t167 = load i64, ptr %local.gj_1
  %t168 = call i64 @"sx_f64_mul"(i64 %t166, i64 %t167)
  %t169 = call i64 @"sx_f64_sub"(i64 %t165, i64 %t168)
  br label %then6_end
then6_end:
  br label %endif6
else6:
  %t170 = load i64, ptr %local.dim
  %t171 = icmp eq i64 %t170, 2
  %t172 = zext i1 %t171 to i64
  %t173 = icmp ne i64 %t172, 0
  br i1 %t173, label %then7, label %else7
then7:
  %t174 = load i64, ptr %local.gi
  %t175 = load i64, ptr %local.proj.107
  %t176 = load i64, ptr %local.gj_2
  %t177 = call i64 @"sx_f64_mul"(i64 %t175, i64 %t176)
  %t178 = call i64 @"sx_f64_sub"(i64 %t174, i64 %t177)
  br label %then7_end
then7_end:
  br label %endif7
else7:
  %t179 = load i64, ptr %local.gi
  %t180 = load i64, ptr %local.proj.107
  %t181 = load i64, ptr %local.gj_3
  %t182 = call i64 @"sx_f64_mul"(i64 %t180, i64 %t181)
  %t183 = call i64 @"sx_f64_sub"(i64 %t179, i64 %t182)
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t184 = phi i64 [ %t178, %then7_end ], [ %t183, %else7_end ]
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t185 = phi i64 [ %t169, %then6_end ], [ %t184, %else6_end ]
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t186 = phi i64 [ %t160, %then5_end ], [ %t185, %else5_end ]
  ret i64 %t186
}

define i64 @"speed_loss"(i64 %w0, i64 %w1, i64 %w2, i64 %w3) nounwind {
entry:
  %local.d0.187 = alloca i64
  %local.d1.188 = alloca i64
  %local.d2.189 = alloca i64
  %local.d3.190 = alloca i64
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %t191 = load i64, ptr %local.w0
  %t192 = call i64 @f64_parse(ptr @.str.exp_code_gates.7)
  %t193 = call i64 @"sx_f64_sub"(i64 %t191, i64 %t192)
  %t194 = load i64, ptr %local.w0
  %t195 = call i64 @f64_parse(ptr @.str.exp_code_gates.8)
  %t196 = call i64 @"sx_f64_sub"(i64 %t194, i64 %t195)
  %t197 = call i64 @"sx_f64_mul"(i64 %t193, i64 %t196)
  store i64 %t197, ptr %local.d0.187
  %t198 = load i64, ptr %local.w1
  %t199 = call i64 @f64_parse(ptr @.str.exp_code_gates.9)
  %t200 = call i64 @"sx_f64_sub"(i64 %t198, i64 %t199)
  %t201 = load i64, ptr %local.w1
  %t202 = call i64 @f64_parse(ptr @.str.exp_code_gates.10)
  %t203 = call i64 @"sx_f64_sub"(i64 %t201, i64 %t202)
  %t204 = call i64 @"sx_f64_mul"(i64 %t200, i64 %t203)
  store i64 %t204, ptr %local.d1.188
  %t205 = load i64, ptr %local.w2
  %t206 = call i64 @f64_parse(ptr @.str.exp_code_gates.11)
  %t207 = call i64 @"sx_f64_add"(i64 %t205, i64 %t206)
  %t208 = load i64, ptr %local.w2
  %t209 = call i64 @f64_parse(ptr @.str.exp_code_gates.12)
  %t210 = call i64 @"sx_f64_add"(i64 %t208, i64 %t209)
  %t211 = call i64 @"sx_f64_mul"(i64 %t207, i64 %t210)
  store i64 %t211, ptr %local.d2.189
  %t212 = load i64, ptr %local.w3
  %t213 = call i64 @f64_parse(ptr @.str.exp_code_gates.13)
  %t214 = call i64 @"sx_f64_sub"(i64 %t212, i64 %t213)
  %t215 = load i64, ptr %local.w3
  %t216 = call i64 @f64_parse(ptr @.str.exp_code_gates.14)
  %t217 = call i64 @"sx_f64_sub"(i64 %t215, i64 %t216)
  %t218 = call i64 @"sx_f64_mul"(i64 %t214, i64 %t217)
  store i64 %t218, ptr %local.d3.190
  %t219 = load i64, ptr %local.d0.187
  %t220 = load i64, ptr %local.d1.188
  %t221 = call i64 @"sx_f64_add"(i64 %t219, i64 %t220)
  %t222 = load i64, ptr %local.d2.189
  %t223 = call i64 @"sx_f64_add"(i64 %t221, i64 %t222)
  %t224 = load i64, ptr %local.d3.190
  %t225 = call i64 @"sx_f64_add"(i64 %t223, i64 %t224)
  ret i64 %t225
}

define i64 @"accuracy_loss"(i64 %w0, i64 %w1, i64 %w2, i64 %w3) nounwind {
entry:
  %local.d0.226 = alloca i64
  %local.d1.227 = alloca i64
  %local.d2.228 = alloca i64
  %local.d3.229 = alloca i64
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %t230 = load i64, ptr %local.w0
  %t231 = call i64 @f64_parse(ptr @.str.exp_code_gates.15)
  %t232 = call i64 @"sx_f64_add"(i64 %t230, i64 %t231)
  %t233 = load i64, ptr %local.w0
  %t234 = call i64 @f64_parse(ptr @.str.exp_code_gates.16)
  %t235 = call i64 @"sx_f64_add"(i64 %t233, i64 %t234)
  %t236 = call i64 @"sx_f64_mul"(i64 %t232, i64 %t235)
  store i64 %t236, ptr %local.d0.226
  %t237 = load i64, ptr %local.w1
  %t238 = call i64 @f64_parse(ptr @.str.exp_code_gates.17)
  %t239 = call i64 @"sx_f64_sub"(i64 %t237, i64 %t238)
  %t240 = load i64, ptr %local.w1
  %t241 = call i64 @f64_parse(ptr @.str.exp_code_gates.18)
  %t242 = call i64 @"sx_f64_sub"(i64 %t240, i64 %t241)
  %t243 = call i64 @"sx_f64_mul"(i64 %t239, i64 %t242)
  store i64 %t243, ptr %local.d1.227
  %t244 = load i64, ptr %local.w2
  %t245 = call i64 @f64_parse(ptr @.str.exp_code_gates.19)
  %t246 = call i64 @"sx_f64_sub"(i64 %t244, i64 %t245)
  %t247 = load i64, ptr %local.w2
  %t248 = call i64 @f64_parse(ptr @.str.exp_code_gates.20)
  %t249 = call i64 @"sx_f64_sub"(i64 %t247, i64 %t248)
  %t250 = call i64 @"sx_f64_mul"(i64 %t246, i64 %t249)
  store i64 %t250, ptr %local.d2.228
  %t251 = load i64, ptr %local.w3
  %t252 = call i64 @f64_parse(ptr @.str.exp_code_gates.21)
  %t253 = call i64 @"sx_f64_add"(i64 %t251, i64 %t252)
  %t254 = load i64, ptr %local.w3
  %t255 = call i64 @f64_parse(ptr @.str.exp_code_gates.22)
  %t256 = call i64 @"sx_f64_add"(i64 %t254, i64 %t255)
  %t257 = call i64 @"sx_f64_mul"(i64 %t253, i64 %t256)
  store i64 %t257, ptr %local.d3.229
  %t258 = load i64, ptr %local.d0.226
  %t259 = load i64, ptr %local.d1.227
  %t260 = call i64 @"sx_f64_add"(i64 %t258, i64 %t259)
  %t261 = load i64, ptr %local.d2.228
  %t262 = call i64 @"sx_f64_add"(i64 %t260, i64 %t261)
  %t263 = load i64, ptr %local.d3.229
  %t264 = call i64 @"sx_f64_add"(i64 %t262, i64 %t263)
  ret i64 %t264
}

define i64 @"train_gates"(i64 %alpha_ab, i64 %alpha_ba, i64 %steps) nounwind {
entry:
  %local.w0.265 = alloca i64
  %local.w1.266 = alloca i64
  %local.w2.267 = alloca i64
  %local.w3.268 = alloca i64
  %local.step.269 = alloca i64
  %local.ga_0.270 = alloca i64
  %local.ga_1.271 = alloca i64
  %local.ga_2.272 = alloca i64
  %local.ga_3.273 = alloca i64
  %local.gb_0.274 = alloca i64
  %local.gb_1.275 = alloca i64
  %local.gb_2.276 = alloca i64
  %local.gb_3.277 = alloca i64
  %local.ra_0.278 = alloca i64
  %local.ra_1.279 = alloca i64
  %local.ra_2.280 = alloca i64
  %local.ra_3.281 = alloca i64
  %local.rb_0.282 = alloca i64
  %local.lr.283 = alloca i64
  %local.alpha_ab = alloca i64
  store i64 %alpha_ab, ptr %local.alpha_ab
  %local.alpha_ba = alloca i64
  store i64 %alpha_ba, ptr %local.alpha_ba
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %t284 = call i64 @f64_parse(ptr @.str.exp_code_gates.23)
  store i64 %t284, ptr %local.w0.265
  %t285 = call i64 @f64_parse(ptr @.str.exp_code_gates.24)
  store i64 %t285, ptr %local.w1.266
  %t286 = call i64 @f64_parse(ptr @.str.exp_code_gates.25)
  store i64 %t286, ptr %local.w2.267
  %t287 = call i64 @f64_parse(ptr @.str.exp_code_gates.26)
  store i64 %t287, ptr %local.w3.268
  store i64 0, ptr %local.step.269
  %t288 = call i64 @f64_parse(ptr @.str.exp_code_gates.27)
  store i64 %t288, ptr %local.ga_0.270
  %t289 = call i64 @f64_parse(ptr @.str.exp_code_gates.28)
  store i64 %t289, ptr %local.ga_1.271
  %t290 = call i64 @f64_parse(ptr @.str.exp_code_gates.29)
  store i64 %t290, ptr %local.ga_2.272
  %t291 = call i64 @f64_parse(ptr @.str.exp_code_gates.30)
  store i64 %t291, ptr %local.ga_3.273
  %t292 = call i64 @f64_parse(ptr @.str.exp_code_gates.31)
  store i64 %t292, ptr %local.gb_0.274
  %t293 = call i64 @f64_parse(ptr @.str.exp_code_gates.32)
  store i64 %t293, ptr %local.gb_1.275
  %t294 = call i64 @f64_parse(ptr @.str.exp_code_gates.33)
  store i64 %t294, ptr %local.gb_2.276
  %t295 = call i64 @f64_parse(ptr @.str.exp_code_gates.34)
  store i64 %t295, ptr %local.gb_3.277
  %t296 = call i64 @f64_parse(ptr @.str.exp_code_gates.35)
  store i64 %t296, ptr %local.ra_0.278
  %t297 = call i64 @f64_parse(ptr @.str.exp_code_gates.36)
  store i64 %t297, ptr %local.ra_1.279
  %t298 = call i64 @f64_parse(ptr @.str.exp_code_gates.37)
  store i64 %t298, ptr %local.ra_2.280
  %t299 = call i64 @f64_parse(ptr @.str.exp_code_gates.38)
  store i64 %t299, ptr %local.ra_3.281
  %t300 = call i64 @f64_parse(ptr @.str.exp_code_gates.39)
  store i64 %t300, ptr %local.rb_0.282
  %t301 = call i64 @f64_parse(ptr @.str.exp_code_gates.40)
  store i64 %t301, ptr %local.lr.283
  br label %loop8
loop8:
  %t302 = load i64, ptr %local.step.269
  %t303 = load i64, ptr %local.steps
  %t304 = icmp slt i64 %t302, %t303
  %t305 = zext i1 %t304 to i64
  %t306 = icmp ne i64 %t305, 0
  br i1 %t306, label %body8, label %endloop8
body8:
  %t307 = call i64 @f64_parse(ptr @.str.exp_code_gates.41)
  %t308 = load i64, ptr %local.w0.265
  %t309 = call i64 @f64_parse(ptr @.str.exp_code_gates.42)
  %t310 = call i64 @"sx_f64_sub"(i64 %t308, i64 %t309)
  %t311 = call i64 @"sx_f64_mul"(i64 %t307, i64 %t310)
  store i64 %t311, ptr %local.ga_0.270
  %t312 = call i64 @f64_parse(ptr @.str.exp_code_gates.43)
  %t313 = load i64, ptr %local.w1.266
  %t314 = call i64 @f64_parse(ptr @.str.exp_code_gates.44)
  %t315 = call i64 @"sx_f64_sub"(i64 %t313, i64 %t314)
  %t316 = call i64 @"sx_f64_mul"(i64 %t312, i64 %t315)
  store i64 %t316, ptr %local.ga_1.271
  %t317 = call i64 @f64_parse(ptr @.str.exp_code_gates.45)
  %t318 = load i64, ptr %local.w2.267
  %t319 = call i64 @f64_parse(ptr @.str.exp_code_gates.46)
  %t320 = call i64 @"sx_f64_add"(i64 %t318, i64 %t319)
  %t321 = call i64 @"sx_f64_mul"(i64 %t317, i64 %t320)
  store i64 %t321, ptr %local.ga_2.272
  %t322 = call i64 @f64_parse(ptr @.str.exp_code_gates.47)
  %t323 = load i64, ptr %local.w3.268
  %t324 = call i64 @f64_parse(ptr @.str.exp_code_gates.48)
  %t325 = call i64 @"sx_f64_sub"(i64 %t323, i64 %t324)
  %t326 = call i64 @"sx_f64_mul"(i64 %t322, i64 %t325)
  store i64 %t326, ptr %local.ga_3.273
  %t327 = call i64 @f64_parse(ptr @.str.exp_code_gates.49)
  %t328 = load i64, ptr %local.w0.265
  %t329 = call i64 @f64_parse(ptr @.str.exp_code_gates.50)
  %t330 = call i64 @"sx_f64_add"(i64 %t328, i64 %t329)
  %t331 = call i64 @"sx_f64_mul"(i64 %t327, i64 %t330)
  store i64 %t331, ptr %local.gb_0.274
  %t332 = call i64 @f64_parse(ptr @.str.exp_code_gates.51)
  %t333 = load i64, ptr %local.w1.266
  %t334 = call i64 @f64_parse(ptr @.str.exp_code_gates.52)
  %t335 = call i64 @"sx_f64_sub"(i64 %t333, i64 %t334)
  %t336 = call i64 @"sx_f64_mul"(i64 %t332, i64 %t335)
  store i64 %t336, ptr %local.gb_1.275
  %t337 = call i64 @f64_parse(ptr @.str.exp_code_gates.53)
  %t338 = load i64, ptr %local.w2.267
  %t339 = call i64 @f64_parse(ptr @.str.exp_code_gates.54)
  %t340 = call i64 @"sx_f64_sub"(i64 %t338, i64 %t339)
  %t341 = call i64 @"sx_f64_mul"(i64 %t337, i64 %t340)
  store i64 %t341, ptr %local.gb_2.276
  %t342 = call i64 @f64_parse(ptr @.str.exp_code_gates.55)
  %t343 = load i64, ptr %local.w3.268
  %t344 = call i64 @f64_parse(ptr @.str.exp_code_gates.56)
  %t345 = call i64 @"sx_f64_add"(i64 %t343, i64 %t344)
  %t346 = call i64 @"sx_f64_mul"(i64 %t342, i64 %t345)
  store i64 %t346, ptr %local.gb_3.277
  %t347 = load i64, ptr %local.ga_0.270
  %t348 = load i64, ptr %local.gb_0.274
  %t349 = load i64, ptr %local.gb_1.275
  %t350 = load i64, ptr %local.gb_2.276
  %t351 = load i64, ptr %local.gb_3.277
  %t352 = load i64, ptr %local.ga_0.270
  %t353 = load i64, ptr %local.ga_1.271
  %t354 = load i64, ptr %local.ga_2.272
  %t355 = load i64, ptr %local.ga_3.273
  %t356 = load i64, ptr %local.alpha_ab
  %t357 = call i64 @"project_dim"(i64 %t347, i64 %t348, i64 %t349, i64 %t350, i64 %t351, i64 %t352, i64 %t353, i64 %t354, i64 %t355, i64 %t356, i64 0)
  store i64 %t357, ptr %local.ra_0.278
  %t358 = load i64, ptr %local.ga_1.271
  %t359 = load i64, ptr %local.gb_0.274
  %t360 = load i64, ptr %local.gb_1.275
  %t361 = load i64, ptr %local.gb_2.276
  %t362 = load i64, ptr %local.gb_3.277
  %t363 = load i64, ptr %local.ga_0.270
  %t364 = load i64, ptr %local.ga_1.271
  %t365 = load i64, ptr %local.ga_2.272
  %t366 = load i64, ptr %local.ga_3.273
  %t367 = load i64, ptr %local.alpha_ab
  %t368 = call i64 @"project_dim"(i64 %t358, i64 %t359, i64 %t360, i64 %t361, i64 %t362, i64 %t363, i64 %t364, i64 %t365, i64 %t366, i64 %t367, i64 1)
  store i64 %t368, ptr %local.ra_1.279
  %t369 = load i64, ptr %local.ga_2.272
  %t370 = load i64, ptr %local.gb_0.274
  %t371 = load i64, ptr %local.gb_1.275
  %t372 = load i64, ptr %local.gb_2.276
  %t373 = load i64, ptr %local.gb_3.277
  %t374 = load i64, ptr %local.ga_0.270
  %t375 = load i64, ptr %local.ga_1.271
  %t376 = load i64, ptr %local.ga_2.272
  %t377 = load i64, ptr %local.ga_3.273
  %t378 = load i64, ptr %local.alpha_ab
  %t379 = call i64 @"project_dim"(i64 %t369, i64 %t370, i64 %t371, i64 %t372, i64 %t373, i64 %t374, i64 %t375, i64 %t376, i64 %t377, i64 %t378, i64 2)
  store i64 %t379, ptr %local.ra_2.280
  %t380 = load i64, ptr %local.ga_3.273
  %t381 = load i64, ptr %local.gb_0.274
  %t382 = load i64, ptr %local.gb_1.275
  %t383 = load i64, ptr %local.gb_2.276
  %t384 = load i64, ptr %local.gb_3.277
  %t385 = load i64, ptr %local.ga_0.270
  %t386 = load i64, ptr %local.ga_1.271
  %t387 = load i64, ptr %local.ga_2.272
  %t388 = load i64, ptr %local.ga_3.273
  %t389 = load i64, ptr %local.alpha_ab
  %t390 = call i64 @"project_dim"(i64 %t380, i64 %t381, i64 %t382, i64 %t383, i64 %t384, i64 %t385, i64 %t386, i64 %t387, i64 %t388, i64 %t389, i64 3)
  store i64 %t390, ptr %local.ra_3.281
  %t391 = load i64, ptr %local.gb_0.274
  %t392 = load i64, ptr %local.ga_0.270
  %t393 = load i64, ptr %local.ga_1.271
  %t394 = load i64, ptr %local.ga_2.272
  %t395 = load i64, ptr %local.ga_3.273
  %t396 = load i64, ptr %local.gb_0.274
  %t397 = load i64, ptr %local.gb_1.275
  %t398 = load i64, ptr %local.gb_2.276
  %t399 = load i64, ptr %local.gb_3.277
  %t400 = load i64, ptr %local.alpha_ba
  %t401 = call i64 @"project_dim"(i64 %t391, i64 %t392, i64 %t393, i64 %t394, i64 %t395, i64 %t396, i64 %t397, i64 %t398, i64 %t399, i64 %t400, i64 0)
  store i64 %t401, ptr %local.rb_0.282
  %t402 = load i64, ptr %local.w0.265
  %t403 = load i64, ptr %local.lr.283
  %t404 = load i64, ptr %local.ra_0.278
  %t405 = load i64, ptr %local.rb_0.282
  %t406 = call i64 @"sx_f64_add"(i64 %t404, i64 %t405)
  %t407 = call i64 @"sx_f64_mul"(i64 %t403, i64 %t406)
  %t408 = call i64 @"sx_f64_sub"(i64 %t402, i64 %t407)
  store i64 %t408, ptr %local.w0.265
  %t409 = load i64, ptr %local.w1.266
  %t410 = load i64, ptr %local.lr.283
  %t411 = load i64, ptr %local.ra_1.279
  %t412 = load i64, ptr %local.gb_1.275
  %t413 = load i64, ptr %local.ga_0.270
  %t414 = load i64, ptr %local.ga_1.271
  %t415 = load i64, ptr %local.ga_2.272
  %t416 = load i64, ptr %local.ga_3.273
  %t417 = load i64, ptr %local.gb_0.274
  %t418 = load i64, ptr %local.gb_1.275
  %t419 = load i64, ptr %local.gb_2.276
  %t420 = load i64, ptr %local.gb_3.277
  %t421 = load i64, ptr %local.alpha_ba
  %t422 = call i64 @"project_dim"(i64 %t412, i64 %t413, i64 %t414, i64 %t415, i64 %t416, i64 %t417, i64 %t418, i64 %t419, i64 %t420, i64 %t421, i64 1)
  %t423 = call i64 @"sx_f64_add"(i64 %t411, i64 %t422)
  %t424 = call i64 @"sx_f64_mul"(i64 %t410, i64 %t423)
  %t425 = call i64 @"sx_f64_sub"(i64 %t409, i64 %t424)
  store i64 %t425, ptr %local.w1.266
  %t426 = load i64, ptr %local.w2.267
  %t427 = load i64, ptr %local.lr.283
  %t428 = load i64, ptr %local.ra_2.280
  %t429 = load i64, ptr %local.gb_2.276
  %t430 = load i64, ptr %local.ga_0.270
  %t431 = load i64, ptr %local.ga_1.271
  %t432 = load i64, ptr %local.ga_2.272
  %t433 = load i64, ptr %local.ga_3.273
  %t434 = load i64, ptr %local.gb_0.274
  %t435 = load i64, ptr %local.gb_1.275
  %t436 = load i64, ptr %local.gb_2.276
  %t437 = load i64, ptr %local.gb_3.277
  %t438 = load i64, ptr %local.alpha_ba
  %t439 = call i64 @"project_dim"(i64 %t429, i64 %t430, i64 %t431, i64 %t432, i64 %t433, i64 %t434, i64 %t435, i64 %t436, i64 %t437, i64 %t438, i64 2)
  %t440 = call i64 @"sx_f64_add"(i64 %t428, i64 %t439)
  %t441 = call i64 @"sx_f64_mul"(i64 %t427, i64 %t440)
  %t442 = call i64 @"sx_f64_sub"(i64 %t426, i64 %t441)
  store i64 %t442, ptr %local.w2.267
  %t443 = load i64, ptr %local.w3.268
  %t444 = load i64, ptr %local.lr.283
  %t445 = load i64, ptr %local.ra_3.281
  %t446 = load i64, ptr %local.gb_3.277
  %t447 = load i64, ptr %local.ga_0.270
  %t448 = load i64, ptr %local.ga_1.271
  %t449 = load i64, ptr %local.ga_2.272
  %t450 = load i64, ptr %local.ga_3.273
  %t451 = load i64, ptr %local.gb_0.274
  %t452 = load i64, ptr %local.gb_1.275
  %t453 = load i64, ptr %local.gb_2.276
  %t454 = load i64, ptr %local.gb_3.277
  %t455 = load i64, ptr %local.alpha_ba
  %t456 = call i64 @"project_dim"(i64 %t446, i64 %t447, i64 %t448, i64 %t449, i64 %t450, i64 %t451, i64 %t452, i64 %t453, i64 %t454, i64 %t455, i64 3)
  %t457 = call i64 @"sx_f64_add"(i64 %t445, i64 %t456)
  %t458 = call i64 @"sx_f64_mul"(i64 %t444, i64 %t457)
  %t459 = call i64 @"sx_f64_sub"(i64 %t443, i64 %t458)
  store i64 %t459, ptr %local.w3.268
  %t460 = load i64, ptr %local.step.269
  %t461 = add i64 %t460, 1
  store i64 %t461, ptr %local.step.269
  br label %loop8
endloop8:
  %t462 = load i64, ptr %local.w0.265
  %t463 = load i64, ptr %local.w1.266
  %t464 = load i64, ptr %local.w2.267
  %t465 = load i64, ptr %local.w3.268
  %t466 = call i64 @"speed_loss"(i64 %t462, i64 %t463, i64 %t464, i64 %t465)
  %t467 = load i64, ptr %local.w0.265
  %t468 = load i64, ptr %local.w1.266
  %t469 = load i64, ptr %local.w2.267
  %t470 = load i64, ptr %local.w3.268
  %t471 = call i64 @"accuracy_loss"(i64 %t467, i64 %t468, i64 %t469, i64 %t470)
  %t472 = call i64 @"sx_f64_add"(i64 %t466, i64 %t471)
  ret i64 %t472
}

define i64 @"gate_meta_grad"(i64 %a_ab, i64 %a_ba, i64 %which, i64 %steps) nounwind {
entry:
  %local.h.473 = alloca i64
  %local.ab_p.474 = alloca i64
  %local.ba_p.475 = alloca i64
  %local.ab_m.476 = alloca i64
  %local.ba_m.477 = alloca i64
  %local.lp.478 = alloca i64
  %local.lm.479 = alloca i64
  %local.a_ab = alloca i64
  store i64 %a_ab, ptr %local.a_ab
  %local.a_ba = alloca i64
  store i64 %a_ba, ptr %local.a_ba
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %t480 = call i64 @f64_parse(ptr @.str.exp_code_gates.57)
  store i64 %t480, ptr %local.h.473
  %t481 = load i64, ptr %local.a_ab
  store i64 %t481, ptr %local.ab_p.474
  %t482 = load i64, ptr %local.a_ba
  store i64 %t482, ptr %local.ba_p.475
  %t483 = load i64, ptr %local.a_ab
  store i64 %t483, ptr %local.ab_m.476
  %t484 = load i64, ptr %local.a_ba
  store i64 %t484, ptr %local.ba_m.477
  %t485 = load i64, ptr %local.which
  %t486 = icmp eq i64 %t485, 0
  %t487 = zext i1 %t486 to i64
  %t488 = icmp ne i64 %t487, 0
  br i1 %t488, label %then9, label %else9
then9:
  %t489 = load i64, ptr %local.a_ab
  %t490 = load i64, ptr %local.h.473
  %t491 = call i64 @"sx_f64_add"(i64 %t489, i64 %t490)
  store i64 %t491, ptr %local.ab_p.474
  %t492 = load i64, ptr %local.a_ab
  %t493 = load i64, ptr %local.h.473
  %t494 = call i64 @"sx_f64_sub"(i64 %t492, i64 %t493)
  store i64 %t494, ptr %local.ab_m.476
  br label %then9_end
then9_end:
  br label %endif9
else9:
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t495 = phi i64 [ 0, %then9_end ], [ 0, %else9_end ]
  %t496 = load i64, ptr %local.which
  %t497 = icmp eq i64 %t496, 1
  %t498 = zext i1 %t497 to i64
  %t499 = icmp ne i64 %t498, 0
  br i1 %t499, label %then10, label %else10
then10:
  %t500 = load i64, ptr %local.a_ba
  %t501 = load i64, ptr %local.h.473
  %t502 = call i64 @"sx_f64_add"(i64 %t500, i64 %t501)
  store i64 %t502, ptr %local.ba_p.475
  %t503 = load i64, ptr %local.a_ba
  %t504 = load i64, ptr %local.h.473
  %t505 = call i64 @"sx_f64_sub"(i64 %t503, i64 %t504)
  store i64 %t505, ptr %local.ba_m.477
  br label %then10_end
then10_end:
  br label %endif10
else10:
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t506 = phi i64 [ 0, %then10_end ], [ 0, %else10_end ]
  %t507 = load i64, ptr %local.ab_p.474
  %t508 = load i64, ptr %local.ba_p.475
  %t509 = load i64, ptr %local.steps
  %t510 = call i64 @"train_gates"(i64 %t507, i64 %t508, i64 %t509)
  store i64 %t510, ptr %local.lp.478
  %t511 = load i64, ptr %local.ab_m.476
  %t512 = load i64, ptr %local.ba_m.477
  %t513 = load i64, ptr %local.steps
  %t514 = call i64 @"train_gates"(i64 %t511, i64 %t512, i64 %t513)
  store i64 %t514, ptr %local.lm.479
  %t515 = load i64, ptr %local.lp.478
  %t516 = load i64, ptr %local.lm.479
  %t517 = call i64 @"sx_f64_sub"(i64 %t515, i64 %t516)
  %t518 = call i64 @f64_parse(ptr @.str.exp_code_gates.58)
  %t519 = load i64, ptr %local.h.473
  %t520 = call i64 @"sx_f64_mul"(i64 %t518, i64 %t519)
  %t521 = call i64 @"sx_f64_div"(i64 %t517, i64 %t520)
  ret i64 %t521
}

define i64 @"run_exp1"() nounwind {
entry:
  %local.alpha_ab.522 = alloca i64
  %local.alpha_ba.523 = alloca i64
  %local.cycle.524 = alloca i64
  %local.mg.525 = alloca i64
  %local.loss.526 = alloca i64
  %local.meta_lr.527 = alloca i64
  %local.inner_steps.528 = alloca i64
  %local.meta_cycles.529 = alloca i64
  %local.loss_none.530 = alloca i64
  %local.loss_uniform.531 = alloca i64
  %local.final_loss.532 = alloca i64
  %t533 = call i64 @f64_parse(ptr @.str.exp_code_gates.59)
  store i64 %t533, ptr %local.alpha_ab.522
  %t534 = call i64 @f64_parse(ptr @.str.exp_code_gates.60)
  store i64 %t534, ptr %local.alpha_ba.523
  store i64 0, ptr %local.cycle.524
  %t535 = call i64 @f64_parse(ptr @.str.exp_code_gates.61)
  store i64 %t535, ptr %local.mg.525
  %t536 = call i64 @f64_parse(ptr @.str.exp_code_gates.62)
  store i64 %t536, ptr %local.loss.526
  %t537 = call i64 @f64_parse(ptr @.str.exp_code_gates.63)
  store i64 %t537, ptr %local.meta_lr.527
  store i64 300, ptr %local.inner_steps.528
  store i64 30, ptr %local.meta_cycles.529
  %t538 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.64)
  %t539 = ptrtoint ptr %t538 to i64
  %t540 = inttoptr i64 %t539 to ptr
  call void @intrinsic_println(ptr %t540)
  %t541 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.65)
  %t542 = ptrtoint ptr %t541 to i64
  %t543 = inttoptr i64 %t542 to ptr
  call void @intrinsic_println(ptr %t543)
  %t544 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.66)
  %t545 = ptrtoint ptr %t544 to i64
  %t546 = inttoptr i64 %t545 to ptr
  call void @intrinsic_println(ptr %t546)
  %t547 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.67)
  %t548 = ptrtoint ptr %t547 to i64
  %t549 = inttoptr i64 %t548 to ptr
  call void @intrinsic_println(ptr %t549)
  %t550 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.68)
  %t551 = ptrtoint ptr %t550 to i64
  %t552 = inttoptr i64 %t551 to ptr
  call void @intrinsic_println(ptr %t552)
  %t553 = call i64 @f64_parse(ptr @.str.exp_code_gates.69)
  %t554 = call i64 @f64_parse(ptr @.str.exp_code_gates.70)
  %t555 = load i64, ptr %local.inner_steps.528
  %t556 = call i64 @"train_gates"(i64 %t553, i64 %t554, i64 %t555)
  store i64 %t556, ptr %local.loss_none.530
  %t557 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.71)
  %t558 = ptrtoint ptr %t557 to i64
  %t559 = inttoptr i64 %t558 to ptr
  call void @intrinsic_print(ptr %t559)
  %t560 = load i64, ptr %local.loss_none.530
  %t561 = call i64 @"print_f64"(i64 %t560)
  %t562 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.72)
  %t563 = ptrtoint ptr %t562 to i64
  %t564 = inttoptr i64 %t563 to ptr
  call void @intrinsic_println(ptr %t564)
  %t565 = call i64 @f64_parse(ptr @.str.exp_code_gates.73)
  %t566 = call i64 @f64_parse(ptr @.str.exp_code_gates.74)
  %t567 = load i64, ptr %local.inner_steps.528
  %t568 = call i64 @"train_gates"(i64 %t565, i64 %t566, i64 %t567)
  store i64 %t568, ptr %local.loss_uniform.531
  %t569 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.75)
  %t570 = ptrtoint ptr %t569 to i64
  %t571 = inttoptr i64 %t570 to ptr
  call void @intrinsic_print(ptr %t571)
  %t572 = load i64, ptr %local.loss_uniform.531
  %t573 = call i64 @"print_f64"(i64 %t572)
  %t574 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.76)
  %t575 = ptrtoint ptr %t574 to i64
  %t576 = inttoptr i64 %t575 to ptr
  call void @intrinsic_println(ptr %t576)
  %t577 = load i64, ptr %local.alpha_ab.522
  %t578 = load i64, ptr %local.alpha_ba.523
  %t579 = load i64, ptr %local.inner_steps.528
  %t580 = call i64 @"train_gates"(i64 %t577, i64 %t578, i64 %t579)
  store i64 %t580, ptr %local.loss.526
  %t581 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.77)
  %t582 = ptrtoint ptr %t581 to i64
  %t583 = inttoptr i64 %t582 to ptr
  call void @intrinsic_print(ptr %t583)
  %t584 = load i64, ptr %local.loss.526
  %t585 = call i64 @"print_f64"(i64 %t584)
  %t586 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.78)
  %t587 = ptrtoint ptr %t586 to i64
  %t588 = inttoptr i64 %t587 to ptr
  call void @intrinsic_println(ptr %t588)
  %t589 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.79)
  %t590 = ptrtoint ptr %t589 to i64
  %t591 = inttoptr i64 %t590 to ptr
  call void @intrinsic_println(ptr %t591)
  %t592 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.80)
  %t593 = ptrtoint ptr %t592 to i64
  %t594 = inttoptr i64 %t593 to ptr
  call void @intrinsic_println(ptr %t594)
  %t595 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.81)
  %t596 = ptrtoint ptr %t595 to i64
  %t597 = inttoptr i64 %t596 to ptr
  call void @intrinsic_println(ptr %t597)
  br label %loop11
loop11:
  %t598 = load i64, ptr %local.cycle.524
  %t599 = load i64, ptr %local.meta_cycles.529
  %t600 = icmp slt i64 %t598, %t599
  %t601 = zext i1 %t600 to i64
  %t602 = icmp ne i64 %t601, 0
  br i1 %t602, label %body11, label %endloop11
body11:
  %t603 = load i64, ptr %local.alpha_ab.522
  %t604 = load i64, ptr %local.alpha_ba.523
  %t605 = load i64, ptr %local.inner_steps.528
  %t606 = call i64 @"gate_meta_grad"(i64 %t603, i64 %t604, i64 0, i64 %t605)
  store i64 %t606, ptr %local.mg.525
  %t607 = load i64, ptr %local.alpha_ab.522
  %t608 = load i64, ptr %local.meta_lr.527
  %t609 = load i64, ptr %local.mg.525
  %t610 = call i64 @"sx_f64_mul"(i64 %t608, i64 %t609)
  %t611 = call i64 @"sx_f64_sub"(i64 %t607, i64 %t610)
  %t612 = call i64 @f64_parse(ptr @.str.exp_code_gates.82)
  %t613 = call i64 @f64_parse(ptr @.str.exp_code_gates.83)
  %t614 = call i64 @"clamp"(i64 %t611, i64 %t612, i64 %t613)
  store i64 %t614, ptr %local.alpha_ab.522
  %t615 = load i64, ptr %local.alpha_ab.522
  %t616 = load i64, ptr %local.alpha_ba.523
  %t617 = load i64, ptr %local.inner_steps.528
  %t618 = call i64 @"gate_meta_grad"(i64 %t615, i64 %t616, i64 1, i64 %t617)
  store i64 %t618, ptr %local.mg.525
  %t619 = load i64, ptr %local.alpha_ba.523
  %t620 = load i64, ptr %local.meta_lr.527
  %t621 = load i64, ptr %local.mg.525
  %t622 = call i64 @"sx_f64_mul"(i64 %t620, i64 %t621)
  %t623 = call i64 @"sx_f64_sub"(i64 %t619, i64 %t622)
  %t624 = call i64 @f64_parse(ptr @.str.exp_code_gates.84)
  %t625 = call i64 @f64_parse(ptr @.str.exp_code_gates.85)
  %t626 = call i64 @"clamp"(i64 %t623, i64 %t624, i64 %t625)
  store i64 %t626, ptr %local.alpha_ba.523
  %t627 = load i64, ptr %local.alpha_ab.522
  %t628 = load i64, ptr %local.alpha_ba.523
  %t629 = load i64, ptr %local.inner_steps.528
  %t630 = call i64 @"train_gates"(i64 %t627, i64 %t628, i64 %t629)
  store i64 %t630, ptr %local.loss.526
  %t631 = load i64, ptr %local.cycle.524
  %t632 = icmp slt i64 %t631, 5
  %t633 = zext i1 %t632 to i64
  %t634 = icmp ne i64 %t633, 0
  br i1 %t634, label %then12, label %else12
then12:
  %t635 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.86)
  %t636 = ptrtoint ptr %t635 to i64
  %t637 = inttoptr i64 %t636 to ptr
  call void @intrinsic_print(ptr %t637)
  %t638 = load i64, ptr %local.cycle.524
  call void @print_i64(i64 %t638)
  %t639 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.87)
  %t640 = ptrtoint ptr %t639 to i64
  %t641 = inttoptr i64 %t640 to ptr
  call void @intrinsic_print(ptr %t641)
  %t642 = load i64, ptr %local.loss.526
  %t643 = call i64 @"print_f64"(i64 %t642)
  %t644 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.88)
  %t645 = ptrtoint ptr %t644 to i64
  %t646 = inttoptr i64 %t645 to ptr
  call void @intrinsic_print(ptr %t646)
  %t647 = load i64, ptr %local.alpha_ab.522
  %t648 = call i64 @"print_f64"(i64 %t647)
  %t649 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.89)
  %t650 = ptrtoint ptr %t649 to i64
  %t651 = inttoptr i64 %t650 to ptr
  call void @intrinsic_print(ptr %t651)
  %t652 = load i64, ptr %local.alpha_ba.523
  %t653 = call i64 @"print_f64"(i64 %t652)
  %t654 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.90)
  %t655 = ptrtoint ptr %t654 to i64
  %t656 = inttoptr i64 %t655 to ptr
  call void @intrinsic_println(ptr %t656)
  br label %then12_end
then12_end:
  br label %endif12
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t657 = phi i64 [ 0, %then12_end ], [ 0, %else12_end ]
  %t658 = load i64, ptr %local.cycle.524
  %t659 = icmp eq i64 %t658, 14
  %t660 = zext i1 %t659 to i64
  %t661 = icmp ne i64 %t660, 0
  br i1 %t661, label %then13, label %else13
then13:
  %t662 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.91)
  %t663 = ptrtoint ptr %t662 to i64
  %t664 = inttoptr i64 %t663 to ptr
  call void @intrinsic_print(ptr %t664)
  %t665 = load i64, ptr %local.loss.526
  %t666 = call i64 @"print_f64"(i64 %t665)
  %t667 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.92)
  %t668 = ptrtoint ptr %t667 to i64
  %t669 = inttoptr i64 %t668 to ptr
  call void @intrinsic_print(ptr %t669)
  %t670 = load i64, ptr %local.alpha_ab.522
  %t671 = call i64 @"print_f64"(i64 %t670)
  %t672 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.93)
  %t673 = ptrtoint ptr %t672 to i64
  %t674 = inttoptr i64 %t673 to ptr
  call void @intrinsic_print(ptr %t674)
  %t675 = load i64, ptr %local.alpha_ba.523
  %t676 = call i64 @"print_f64"(i64 %t675)
  %t677 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.94)
  %t678 = ptrtoint ptr %t677 to i64
  %t679 = inttoptr i64 %t678 to ptr
  call void @intrinsic_println(ptr %t679)
  br label %then13_end
then13_end:
  br label %endif13
else13:
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t680 = phi i64 [ 0, %then13_end ], [ 0, %else13_end ]
  %t681 = load i64, ptr %local.cycle.524
  %t682 = icmp eq i64 %t681, 29
  %t683 = zext i1 %t682 to i64
  %t684 = icmp ne i64 %t683, 0
  br i1 %t684, label %then14, label %else14
then14:
  %t685 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.95)
  %t686 = ptrtoint ptr %t685 to i64
  %t687 = inttoptr i64 %t686 to ptr
  call void @intrinsic_print(ptr %t687)
  %t688 = load i64, ptr %local.loss.526
  %t689 = call i64 @"print_f64"(i64 %t688)
  %t690 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.96)
  %t691 = ptrtoint ptr %t690 to i64
  %t692 = inttoptr i64 %t691 to ptr
  call void @intrinsic_print(ptr %t692)
  %t693 = load i64, ptr %local.alpha_ab.522
  %t694 = call i64 @"print_f64"(i64 %t693)
  %t695 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.97)
  %t696 = ptrtoint ptr %t695 to i64
  %t697 = inttoptr i64 %t696 to ptr
  call void @intrinsic_print(ptr %t697)
  %t698 = load i64, ptr %local.alpha_ba.523
  %t699 = call i64 @"print_f64"(i64 %t698)
  %t700 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.98)
  %t701 = ptrtoint ptr %t700 to i64
  %t702 = inttoptr i64 %t701 to ptr
  call void @intrinsic_println(ptr %t702)
  br label %then14_end
then14_end:
  br label %endif14
else14:
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t703 = phi i64 [ 0, %then14_end ], [ 0, %else14_end ]
  %t704 = load i64, ptr %local.cycle.524
  %t705 = add i64 %t704, 1
  store i64 %t705, ptr %local.cycle.524
  br label %loop11
endloop11:
  %t706 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.99)
  %t707 = ptrtoint ptr %t706 to i64
  %t708 = inttoptr i64 %t707 to ptr
  call void @intrinsic_println(ptr %t708)
  %t709 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.100)
  %t710 = ptrtoint ptr %t709 to i64
  %t711 = inttoptr i64 %t710 to ptr
  call void @intrinsic_print(ptr %t711)
  %t712 = load i64, ptr %local.alpha_ab.522
  %t713 = call i64 @"print_f64"(i64 %t712)
  %t714 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.101)
  %t715 = ptrtoint ptr %t714 to i64
  %t716 = inttoptr i64 %t715 to ptr
  call void @intrinsic_println(ptr %t716)
  %t717 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.102)
  %t718 = ptrtoint ptr %t717 to i64
  %t719 = inttoptr i64 %t718 to ptr
  call void @intrinsic_print(ptr %t719)
  %t720 = load i64, ptr %local.alpha_ba.523
  %t721 = call i64 @"print_f64"(i64 %t720)
  %t722 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.103)
  %t723 = ptrtoint ptr %t722 to i64
  %t724 = inttoptr i64 %t723 to ptr
  call void @intrinsic_println(ptr %t724)
  %t725 = load i64, ptr %local.alpha_ab.522
  %t726 = load i64, ptr %local.alpha_ba.523
  %t727 = load i64, ptr %local.inner_steps.528
  %t728 = call i64 @"train_gates"(i64 %t725, i64 %t726, i64 %t727)
  store i64 %t728, ptr %local.final_loss.532
  %t729 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.104)
  %t730 = ptrtoint ptr %t729 to i64
  %t731 = inttoptr i64 %t730 to ptr
  call void @intrinsic_print(ptr %t731)
  %t732 = load i64, ptr %local.final_loss.532
  %t733 = call i64 @"print_f64"(i64 %t732)
  %t734 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.105)
  %t735 = ptrtoint ptr %t734 to i64
  %t736 = inttoptr i64 %t735 to ptr
  call void @intrinsic_println(ptr %t736)
  %t737 = load i64, ptr %local.final_loss.532
  %t738 = load i64, ptr %local.loss_none.530
  %t739 = call i64 @"sx_f64_lt"(i64 %t737, i64 %t738)
  %t740 = icmp ne i64 %t739, 0
  br i1 %t740, label %then15, label %else15
then15:
  %t741 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.106)
  %t742 = ptrtoint ptr %t741 to i64
  %t743 = inttoptr i64 %t742 to ptr
  call void @intrinsic_println(ptr %t743)
  br label %then15_end
then15_end:
  br label %endif15
else15:
  %t744 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.107)
  %t745 = ptrtoint ptr %t744 to i64
  %t746 = inttoptr i64 %t745 to ptr
  call void @intrinsic_println(ptr %t746)
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t747 = phi i64 [ 0, %then15_end ], [ 0, %else15_end ]
  %t748 = load i64, ptr %local.final_loss.532
  %t749 = load i64, ptr %local.loss_uniform.531
  %t750 = call i64 @"sx_f64_lt"(i64 %t748, i64 %t749)
  %t751 = icmp ne i64 %t750, 0
  br i1 %t751, label %then16, label %else16
then16:
  %t752 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.108)
  %t753 = ptrtoint ptr %t752 to i64
  %t754 = inttoptr i64 %t753 to ptr
  call void @intrinsic_println(ptr %t754)
  br label %then16_end
then16_end:
  br label %endif16
else16:
  %t755 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.109)
  %t756 = ptrtoint ptr %t755 to i64
  %t757 = inttoptr i64 %t756 to ptr
  call void @intrinsic_println(ptr %t757)
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t758 = phi i64 [ 0, %then16_end ], [ 0, %else16_end ]
  %t759 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.110)
  %t760 = ptrtoint ptr %t759 to i64
  %t761 = inttoptr i64 %t760 to ptr
  call void @intrinsic_println(ptr %t761)
  ret i64 0
}

define i64 @"path_a_loss"(i64 %x) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t762 = load i64, ptr %local.x
  %t763 = call i64 @f64_parse(ptr @.str.exp_code_gates.111)
  %t764 = call i64 @"sx_f64_sub"(i64 %t762, i64 %t763)
  %t765 = load i64, ptr %local.x
  %t766 = call i64 @f64_parse(ptr @.str.exp_code_gates.112)
  %t767 = call i64 @"sx_f64_sub"(i64 %t765, i64 %t766)
  %t768 = call i64 @"sx_f64_mul"(i64 %t764, i64 %t767)
  %t769 = call i64 @f64_parse(ptr @.str.exp_code_gates.113)
  %t770 = call i64 @"sx_f64_add"(i64 %t768, i64 %t769)
  ret i64 %t770
}

define i64 @"path_b_loss"(i64 %x) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t771 = load i64, ptr %local.x
  %t772 = call i64 @f64_parse(ptr @.str.exp_code_gates.114)
  %t773 = call i64 @"sx_f64_add"(i64 %t771, i64 %t772)
  %t774 = load i64, ptr %local.x
  %t775 = call i64 @f64_parse(ptr @.str.exp_code_gates.115)
  %t776 = call i64 @"sx_f64_add"(i64 %t774, i64 %t775)
  %t777 = call i64 @"sx_f64_mul"(i64 %t773, i64 %t776)
  %t778 = call i64 @f64_parse(ptr @.str.exp_code_gates.116)
  %t779 = call i64 @"sx_f64_add"(i64 %t777, i64 %t778)
  ret i64 %t779
}

define i64 @"run_exp2"() nounwind {
entry:
  %local.seed.780 = alloca i64
  %local.theta.781 = alloca i64
  %local.det_total.782 = alloca i64
  %local.learn_total.783 = alloca i64
  %local.i.784 = alloca i64
  %local.target.785 = alloca i64
  %local.la.786 = alloca i64
  %local.lb.787 = alloca i64
  %local.blended.788 = alloca i64
  %local.grad_theta.789 = alloca i64
  %local.best_theta.790 = alloca i64
  %local.best_learn_loss.791 = alloca i64
  %local.n_inputs.792 = alloca i64
  %local.theta_lr.793 = alloca i64
  %local.n_epochs.794 = alloca i64
  %local.epoch.795 = alloca i64
  %local.gap.796 = alloca i64
  store i64 42, ptr %local.seed.780
  %t797 = call i64 @f64_parse(ptr @.str.exp_code_gates.117)
  store i64 %t797, ptr %local.theta.781
  %t798 = call i64 @f64_parse(ptr @.str.exp_code_gates.118)
  store i64 %t798, ptr %local.det_total.782
  %t799 = call i64 @f64_parse(ptr @.str.exp_code_gates.119)
  store i64 %t799, ptr %local.learn_total.783
  store i64 0, ptr %local.i.784
  %t800 = call i64 @f64_parse(ptr @.str.exp_code_gates.120)
  store i64 %t800, ptr %local.target.785
  %t801 = call i64 @f64_parse(ptr @.str.exp_code_gates.121)
  store i64 %t801, ptr %local.la.786
  %t802 = call i64 @f64_parse(ptr @.str.exp_code_gates.122)
  store i64 %t802, ptr %local.lb.787
  %t803 = call i64 @f64_parse(ptr @.str.exp_code_gates.123)
  store i64 %t803, ptr %local.blended.788
  %t804 = call i64 @f64_parse(ptr @.str.exp_code_gates.124)
  store i64 %t804, ptr %local.grad_theta.789
  %t805 = call i64 @f64_parse(ptr @.str.exp_code_gates.125)
  store i64 %t805, ptr %local.best_theta.790
  %t806 = call i64 @f64_parse(ptr @.str.exp_code_gates.126)
  store i64 %t806, ptr %local.best_learn_loss.791
  store i64 100, ptr %local.n_inputs.792
  %t807 = call i64 @f64_parse(ptr @.str.exp_code_gates.127)
  store i64 %t807, ptr %local.theta_lr.793
  store i64 20, ptr %local.n_epochs.794
  store i64 0, ptr %local.epoch.795
  %t808 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.128)
  %t809 = ptrtoint ptr %t808 to i64
  %t810 = inttoptr i64 %t809 to ptr
  call void @intrinsic_println(ptr %t810)
  %t811 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.129)
  %t812 = ptrtoint ptr %t811 to i64
  %t813 = inttoptr i64 %t812 to ptr
  call void @intrinsic_println(ptr %t813)
  %t814 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.130)
  %t815 = ptrtoint ptr %t814 to i64
  %t816 = inttoptr i64 %t815 to ptr
  call void @intrinsic_println(ptr %t816)
  %t817 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.131)
  %t818 = ptrtoint ptr %t817 to i64
  %t819 = inttoptr i64 %t818 to ptr
  call void @intrinsic_println(ptr %t819)
  %t820 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.132)
  %t821 = ptrtoint ptr %t820 to i64
  %t822 = inttoptr i64 %t821 to ptr
  call void @intrinsic_println(ptr %t822)
  store i64 42, ptr %local.seed.780
  store i64 0, ptr %local.i.784
  %t823 = call i64 @f64_parse(ptr @.str.exp_code_gates.133)
  store i64 %t823, ptr %local.det_total.782
  br label %loop17
loop17:
  %t824 = load i64, ptr %local.i.784
  %t825 = load i64, ptr %local.n_inputs.792
  %t826 = icmp slt i64 %t824, %t825
  %t827 = zext i1 %t826 to i64
  %t828 = icmp ne i64 %t827, 0
  br i1 %t828, label %body17, label %endloop17
body17:
  %t829 = load i64, ptr %local.seed.780
  %t830 = call i64 @"lcg_next"(i64 %t829)
  store i64 %t830, ptr %local.seed.780
  %t831 = load i64, ptr %local.seed.780
  %t832 = call i64 @"lcg_f64"(i64 %t831)
  %t833 = call i64 @f64_parse(ptr @.str.exp_code_gates.134)
  %t834 = call i64 @"sx_f64_mul"(i64 %t832, i64 %t833)
  %t835 = call i64 @f64_parse(ptr @.str.exp_code_gates.135)
  %t836 = call i64 @"sx_f64_sub"(i64 %t834, i64 %t835)
  store i64 %t836, ptr %local.target.785
  %t837 = load i64, ptr %local.target.785
  %t838 = call i64 @"path_a_loss"(i64 %t837)
  store i64 %t838, ptr %local.la.786
  %t839 = load i64, ptr %local.target.785
  %t840 = call i64 @"path_b_loss"(i64 %t839)
  store i64 %t840, ptr %local.lb.787
  %t841 = load i64, ptr %local.la.786
  %t842 = load i64, ptr %local.lb.787
  %t843 = call i64 @"sx_f64_lt"(i64 %t841, i64 %t842)
  %t844 = icmp ne i64 %t843, 0
  br i1 %t844, label %then18, label %else18
then18:
  %t845 = load i64, ptr %local.det_total.782
  %t846 = load i64, ptr %local.la.786
  %t847 = call i64 @"sx_f64_add"(i64 %t845, i64 %t846)
  store i64 %t847, ptr %local.det_total.782
  br label %then18_end
then18_end:
  br label %endif18
else18:
  %t848 = load i64, ptr %local.det_total.782
  %t849 = load i64, ptr %local.lb.787
  %t850 = call i64 @"sx_f64_add"(i64 %t848, i64 %t849)
  store i64 %t850, ptr %local.det_total.782
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t851 = phi i64 [ 0, %then18_end ], [ 0, %else18_end ]
  %t852 = load i64, ptr %local.i.784
  %t853 = add i64 %t852, 1
  store i64 %t853, ptr %local.i.784
  br label %loop17
endloop17:
  %t854 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.136)
  %t855 = ptrtoint ptr %t854 to i64
  %t856 = inttoptr i64 %t855 to ptr
  call void @intrinsic_print(ptr %t856)
  %t857 = load i64, ptr %local.det_total.782
  %t858 = call i64 @"print_f64"(i64 %t857)
  %t859 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.137)
  %t860 = ptrtoint ptr %t859 to i64
  %t861 = inttoptr i64 %t860 to ptr
  call void @intrinsic_println(ptr %t861)
  %t862 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.138)
  %t863 = ptrtoint ptr %t862 to i64
  %t864 = inttoptr i64 %t863 to ptr
  call void @intrinsic_println(ptr %t864)
  %t865 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.139)
  %t866 = ptrtoint ptr %t865 to i64
  %t867 = inttoptr i64 %t866 to ptr
  call void @intrinsic_println(ptr %t867)
  %t868 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.140)
  %t869 = ptrtoint ptr %t868 to i64
  %t870 = inttoptr i64 %t869 to ptr
  call void @intrinsic_println(ptr %t870)
  %t871 = call i64 @f64_parse(ptr @.str.exp_code_gates.141)
  store i64 %t871, ptr %local.theta.781
  store i64 0, ptr %local.epoch.795
  br label %loop19
loop19:
  %t872 = load i64, ptr %local.epoch.795
  %t873 = load i64, ptr %local.n_epochs.794
  %t874 = icmp slt i64 %t872, %t873
  %t875 = zext i1 %t874 to i64
  %t876 = icmp ne i64 %t875, 0
  br i1 %t876, label %body19, label %endloop19
body19:
  store i64 42, ptr %local.seed.780
  store i64 0, ptr %local.i.784
  %t877 = call i64 @f64_parse(ptr @.str.exp_code_gates.142)
  store i64 %t877, ptr %local.learn_total.783
  %t878 = call i64 @f64_parse(ptr @.str.exp_code_gates.143)
  store i64 %t878, ptr %local.grad_theta.789
  br label %loop20
loop20:
  %t879 = load i64, ptr %local.i.784
  %t880 = load i64, ptr %local.n_inputs.792
  %t881 = icmp slt i64 %t879, %t880
  %t882 = zext i1 %t881 to i64
  %t883 = icmp ne i64 %t882, 0
  br i1 %t883, label %body20, label %endloop20
body20:
  %t884 = load i64, ptr %local.seed.780
  %t885 = call i64 @"lcg_next"(i64 %t884)
  store i64 %t885, ptr %local.seed.780
  %t886 = load i64, ptr %local.seed.780
  %t887 = call i64 @"lcg_f64"(i64 %t886)
  %t888 = call i64 @f64_parse(ptr @.str.exp_code_gates.144)
  %t889 = call i64 @"sx_f64_mul"(i64 %t887, i64 %t888)
  %t890 = call i64 @f64_parse(ptr @.str.exp_code_gates.145)
  %t891 = call i64 @"sx_f64_sub"(i64 %t889, i64 %t890)
  store i64 %t891, ptr %local.target.785
  %t892 = load i64, ptr %local.target.785
  %t893 = call i64 @"path_a_loss"(i64 %t892)
  store i64 %t893, ptr %local.la.786
  %t894 = load i64, ptr %local.target.785
  %t895 = call i64 @"path_b_loss"(i64 %t894)
  store i64 %t895, ptr %local.lb.787
  %t896 = load i64, ptr %local.theta.781
  %t897 = load i64, ptr %local.la.786
  %t898 = call i64 @"sx_f64_mul"(i64 %t896, i64 %t897)
  %t899 = call i64 @f64_parse(ptr @.str.exp_code_gates.146)
  %t900 = load i64, ptr %local.theta.781
  %t901 = call i64 @"sx_f64_sub"(i64 %t899, i64 %t900)
  %t902 = load i64, ptr %local.lb.787
  %t903 = call i64 @"sx_f64_mul"(i64 %t901, i64 %t902)
  %t904 = call i64 @"sx_f64_add"(i64 %t898, i64 %t903)
  store i64 %t904, ptr %local.blended.788
  %t905 = load i64, ptr %local.learn_total.783
  %t906 = load i64, ptr %local.blended.788
  %t907 = call i64 @"sx_f64_add"(i64 %t905, i64 %t906)
  store i64 %t907, ptr %local.learn_total.783
  %t908 = load i64, ptr %local.grad_theta.789
  %t909 = load i64, ptr %local.la.786
  %t910 = load i64, ptr %local.lb.787
  %t911 = call i64 @"sx_f64_sub"(i64 %t909, i64 %t910)
  %t912 = call i64 @"sx_f64_add"(i64 %t908, i64 %t911)
  store i64 %t912, ptr %local.grad_theta.789
  %t913 = load i64, ptr %local.i.784
  %t914 = add i64 %t913, 1
  store i64 %t914, ptr %local.i.784
  br label %loop20
endloop20:
  %t915 = load i64, ptr %local.learn_total.783
  %t916 = load i64, ptr %local.best_learn_loss.791
  %t917 = call i64 @"sx_f64_lt"(i64 %t915, i64 %t916)
  %t918 = icmp ne i64 %t917, 0
  br i1 %t918, label %then21, label %else21
then21:
  %t919 = load i64, ptr %local.learn_total.783
  store i64 %t919, ptr %local.best_learn_loss.791
  %t920 = load i64, ptr %local.theta.781
  store i64 %t920, ptr %local.best_theta.790
  br label %then21_end
then21_end:
  br label %endif21
else21:
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t921 = phi i64 [ 0, %then21_end ], [ 0, %else21_end ]
  %t922 = load i64, ptr %local.epoch.795
  %t923 = icmp slt i64 %t922, 5
  %t924 = zext i1 %t923 to i64
  %t925 = icmp ne i64 %t924, 0
  br i1 %t925, label %then22, label %else22
then22:
  %t926 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.147)
  %t927 = ptrtoint ptr %t926 to i64
  %t928 = inttoptr i64 %t927 to ptr
  call void @intrinsic_print(ptr %t928)
  %t929 = load i64, ptr %local.epoch.795
  call void @print_i64(i64 %t929)
  %t930 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.148)
  %t931 = ptrtoint ptr %t930 to i64
  %t932 = inttoptr i64 %t931 to ptr
  call void @intrinsic_print(ptr %t932)
  %t933 = load i64, ptr %local.theta.781
  %t934 = call i64 @"print_f64"(i64 %t933)
  %t935 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.149)
  %t936 = ptrtoint ptr %t935 to i64
  %t937 = inttoptr i64 %t936 to ptr
  call void @intrinsic_print(ptr %t937)
  %t938 = load i64, ptr %local.learn_total.783
  %t939 = call i64 @"print_f64"(i64 %t938)
  %t940 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.150)
  %t941 = ptrtoint ptr %t940 to i64
  %t942 = inttoptr i64 %t941 to ptr
  call void @intrinsic_println(ptr %t942)
  br label %then22_end
then22_end:
  br label %endif22
else22:
  br label %else22_end
else22_end:
  br label %endif22
endif22:
  %t943 = phi i64 [ 0, %then22_end ], [ 0, %else22_end ]
  %t944 = load i64, ptr %local.epoch.795
  %t945 = icmp eq i64 %t944, 9
  %t946 = zext i1 %t945 to i64
  %t947 = icmp ne i64 %t946, 0
  br i1 %t947, label %then23, label %else23
then23:
  %t948 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.151)
  %t949 = ptrtoint ptr %t948 to i64
  %t950 = inttoptr i64 %t949 to ptr
  call void @intrinsic_print(ptr %t950)
  %t951 = load i64, ptr %local.theta.781
  %t952 = call i64 @"print_f64"(i64 %t951)
  %t953 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.152)
  %t954 = ptrtoint ptr %t953 to i64
  %t955 = inttoptr i64 %t954 to ptr
  call void @intrinsic_print(ptr %t955)
  %t956 = load i64, ptr %local.learn_total.783
  %t957 = call i64 @"print_f64"(i64 %t956)
  %t958 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.153)
  %t959 = ptrtoint ptr %t958 to i64
  %t960 = inttoptr i64 %t959 to ptr
  call void @intrinsic_println(ptr %t960)
  br label %then23_end
then23_end:
  br label %endif23
else23:
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t961 = phi i64 [ 0, %then23_end ], [ 0, %else23_end ]
  %t962 = load i64, ptr %local.epoch.795
  %t963 = icmp eq i64 %t962, 19
  %t964 = zext i1 %t963 to i64
  %t965 = icmp ne i64 %t964, 0
  br i1 %t965, label %then24, label %else24
then24:
  %t966 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.154)
  %t967 = ptrtoint ptr %t966 to i64
  %t968 = inttoptr i64 %t967 to ptr
  call void @intrinsic_print(ptr %t968)
  %t969 = load i64, ptr %local.theta.781
  %t970 = call i64 @"print_f64"(i64 %t969)
  %t971 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.155)
  %t972 = ptrtoint ptr %t971 to i64
  %t973 = inttoptr i64 %t972 to ptr
  call void @intrinsic_print(ptr %t973)
  %t974 = load i64, ptr %local.learn_total.783
  %t975 = call i64 @"print_f64"(i64 %t974)
  %t976 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.156)
  %t977 = ptrtoint ptr %t976 to i64
  %t978 = inttoptr i64 %t977 to ptr
  call void @intrinsic_println(ptr %t978)
  br label %then24_end
then24_end:
  br label %endif24
else24:
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t979 = phi i64 [ 0, %then24_end ], [ 0, %else24_end ]
  %t980 = load i64, ptr %local.theta.781
  %t981 = load i64, ptr %local.theta_lr.793
  %t982 = load i64, ptr %local.grad_theta.789
  %t983 = call i64 @"sx_f64_mul"(i64 %t981, i64 %t982)
  %t984 = call i64 @"sx_f64_sub"(i64 %t980, i64 %t983)
  store i64 %t984, ptr %local.theta.781
  %t985 = load i64, ptr %local.theta.781
  %t986 = call i64 @f64_parse(ptr @.str.exp_code_gates.157)
  %t987 = call i64 @f64_parse(ptr @.str.exp_code_gates.158)
  %t988 = call i64 @"clamp"(i64 %t985, i64 %t986, i64 %t987)
  store i64 %t988, ptr %local.theta.781
  %t989 = load i64, ptr %local.epoch.795
  %t990 = add i64 %t989, 1
  store i64 %t990, ptr %local.epoch.795
  br label %loop19
endloop19:
  %t991 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.159)
  %t992 = ptrtoint ptr %t991 to i64
  %t993 = inttoptr i64 %t992 to ptr
  call void @intrinsic_println(ptr %t993)
  %t994 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.160)
  %t995 = ptrtoint ptr %t994 to i64
  %t996 = inttoptr i64 %t995 to ptr
  call void @intrinsic_print(ptr %t996)
  %t997 = load i64, ptr %local.best_theta.790
  %t998 = call i64 @"print_f64"(i64 %t997)
  %t999 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.161)
  %t1000 = ptrtoint ptr %t999 to i64
  %t1001 = inttoptr i64 %t1000 to ptr
  call void @intrinsic_println(ptr %t1001)
  %t1002 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.162)
  %t1003 = ptrtoint ptr %t1002 to i64
  %t1004 = inttoptr i64 %t1003 to ptr
  call void @intrinsic_print(ptr %t1004)
  %t1005 = load i64, ptr %local.best_learn_loss.791
  %t1006 = call i64 @"print_f64"(i64 %t1005)
  %t1007 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.163)
  %t1008 = ptrtoint ptr %t1007 to i64
  %t1009 = inttoptr i64 %t1008 to ptr
  call void @intrinsic_println(ptr %t1009)
  %t1010 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.164)
  %t1011 = ptrtoint ptr %t1010 to i64
  %t1012 = inttoptr i64 %t1011 to ptr
  call void @intrinsic_print(ptr %t1012)
  %t1013 = load i64, ptr %local.det_total.782
  %t1014 = call i64 @"print_f64"(i64 %t1013)
  %t1015 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.165)
  %t1016 = ptrtoint ptr %t1015 to i64
  %t1017 = inttoptr i64 %t1016 to ptr
  call void @intrinsic_println(ptr %t1017)
  %t1018 = load i64, ptr %local.best_learn_loss.791
  %t1019 = load i64, ptr %local.det_total.782
  %t1020 = call i64 @"sx_f64_lt"(i64 %t1018, i64 %t1019)
  %t1021 = icmp ne i64 %t1020, 0
  br i1 %t1021, label %then25, label %else25
then25:
  %t1022 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.166)
  %t1023 = ptrtoint ptr %t1022 to i64
  %t1024 = inttoptr i64 %t1023 to ptr
  call void @intrinsic_println(ptr %t1024)
  br label %then25_end
then25_end:
  br label %endif25
else25:
  %t1025 = load i64, ptr %local.best_learn_loss.791
  %t1026 = load i64, ptr %local.det_total.782
  %t1027 = call i64 @"sx_f64_sub"(i64 %t1025, i64 %t1026)
  store i64 %t1027, ptr %local.gap.796
  %t1028 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.167)
  %t1029 = ptrtoint ptr %t1028 to i64
  %t1030 = inttoptr i64 %t1029 to ptr
  call void @intrinsic_print(ptr %t1030)
  %t1031 = load i64, ptr %local.gap.796
  %t1032 = call i64 @"print_f64"(i64 %t1031)
  %t1033 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.168)
  %t1034 = ptrtoint ptr %t1033 to i64
  %t1035 = inttoptr i64 %t1034 to ptr
  call void @intrinsic_println(ptr %t1035)
  %t1036 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.169)
  %t1037 = ptrtoint ptr %t1036 to i64
  %t1038 = inttoptr i64 %t1037 to ptr
  call void @intrinsic_println(ptr %t1038)
  %t1039 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.170)
  %t1040 = ptrtoint ptr %t1039 to i64
  %t1041 = inttoptr i64 %t1040 to ptr
  call void @intrinsic_println(ptr %t1041)
  br label %else25_end
else25_end:
  br label %endif25
endif25:
  %t1042 = phi i64 [ 0, %then25_end ], [ 0, %else25_end ]
  %t1043 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.171)
  %t1044 = ptrtoint ptr %t1043 to i64
  %t1045 = inttoptr i64 %t1044 to ptr
  call void @intrinsic_println(ptr %t1045)
  ret i64 0
}

define i64 @"latency_cost"(i64 %d1, i64 %d2, i64 %d3) nounwind {
entry:
  %local.base.1046 = alloca i64
  %local.inline_benefit.1047 = alloca i64
  %local.unroll_benefit.1048 = alloca i64
  %local.vec_benefit.1049 = alloca i64
  %local.d1 = alloca i64
  store i64 %d1, ptr %local.d1
  %local.d2 = alloca i64
  store i64 %d2, ptr %local.d2
  %local.d3 = alloca i64
  store i64 %d3, ptr %local.d3
  %t1050 = call i64 @f64_parse(ptr @.str.exp_code_gates.172)
  store i64 %t1050, ptr %local.base.1046
  %t1051 = call i64 @f64_parse(ptr @.str.exp_code_gates.173)
  %t1052 = load i64, ptr %local.d1
  %t1053 = call i64 @"sx_f64_mul"(i64 %t1051, i64 %t1052)
  store i64 %t1053, ptr %local.inline_benefit.1047
  %t1054 = call i64 @f64_parse(ptr @.str.exp_code_gates.174)
  %t1055 = load i64, ptr %local.d2
  %t1056 = call i64 @"sx_f64_mul"(i64 %t1054, i64 %t1055)
  store i64 %t1056, ptr %local.unroll_benefit.1048
  %t1057 = call i64 @f64_parse(ptr @.str.exp_code_gates.175)
  %t1058 = load i64, ptr %local.d3
  %t1059 = call i64 @"sx_f64_mul"(i64 %t1057, i64 %t1058)
  store i64 %t1059, ptr %local.vec_benefit.1049
  %t1060 = load i64, ptr %local.base.1046
  %t1061 = load i64, ptr %local.inline_benefit.1047
  %t1062 = call i64 @"sx_f64_sub"(i64 %t1060, i64 %t1061)
  %t1063 = load i64, ptr %local.unroll_benefit.1048
  %t1064 = call i64 @"sx_f64_sub"(i64 %t1062, i64 %t1063)
  %t1065 = load i64, ptr %local.vec_benefit.1049
  %t1066 = call i64 @"sx_f64_sub"(i64 %t1064, i64 %t1065)
  ret i64 %t1066
}

define i64 @"codesize_cost"(i64 %d1, i64 %d2, i64 %d3) nounwind {
entry:
  %local.base.1067 = alloca i64
  %local.inline_penalty.1068 = alloca i64
  %local.unroll_penalty.1069 = alloca i64
  %local.vec_penalty.1070 = alloca i64
  %local.d1 = alloca i64
  store i64 %d1, ptr %local.d1
  %local.d2 = alloca i64
  store i64 %d2, ptr %local.d2
  %local.d3 = alloca i64
  store i64 %d3, ptr %local.d3
  %t1071 = call i64 @f64_parse(ptr @.str.exp_code_gates.176)
  store i64 %t1071, ptr %local.base.1067
  %t1072 = call i64 @f64_parse(ptr @.str.exp_code_gates.177)
  %t1073 = load i64, ptr %local.d1
  %t1074 = call i64 @"sx_f64_mul"(i64 %t1072, i64 %t1073)
  store i64 %t1074, ptr %local.inline_penalty.1068
  %t1075 = call i64 @f64_parse(ptr @.str.exp_code_gates.178)
  %t1076 = load i64, ptr %local.d2
  %t1077 = call i64 @"sx_f64_mul"(i64 %t1075, i64 %t1076)
  store i64 %t1077, ptr %local.unroll_penalty.1069
  %t1078 = call i64 @f64_parse(ptr @.str.exp_code_gates.179)
  %t1079 = load i64, ptr %local.d3
  %t1080 = call i64 @"sx_f64_mul"(i64 %t1078, i64 %t1079)
  store i64 %t1080, ptr %local.vec_penalty.1070
  %t1081 = load i64, ptr %local.base.1067
  %t1082 = load i64, ptr %local.inline_penalty.1068
  %t1083 = call i64 @"sx_f64_add"(i64 %t1081, i64 %t1082)
  %t1084 = load i64, ptr %local.unroll_penalty.1069
  %t1085 = call i64 @"sx_f64_add"(i64 %t1083, i64 %t1084)
  %t1086 = load i64, ptr %local.vec_penalty.1070
  %t1087 = call i64 @"sx_f64_add"(i64 %t1085, i64 %t1086)
  ret i64 %t1087
}

define i64 @"total_cost"(i64 %d1, i64 %d2, i64 %d3) nounwind {
entry:
  %local.d1 = alloca i64
  store i64 %d1, ptr %local.d1
  %local.d2 = alloca i64
  store i64 %d2, ptr %local.d2
  %local.d3 = alloca i64
  store i64 %d3, ptr %local.d3
  %t1088 = load i64, ptr %local.d1
  %t1089 = load i64, ptr %local.d2
  %t1090 = load i64, ptr %local.d3
  %t1091 = call i64 @"latency_cost"(i64 %t1088, i64 %t1089, i64 %t1090)
  %t1092 = load i64, ptr %local.d1
  %t1093 = load i64, ptr %local.d2
  %t1094 = load i64, ptr %local.d3
  %t1095 = call i64 @"codesize_cost"(i64 %t1092, i64 %t1093, i64 %t1094)
  %t1096 = call i64 @"sx_f64_add"(i64 %t1091, i64 %t1095)
  ret i64 %t1096
}

define i64 @"cost_grad"(i64 %d1, i64 %d2, i64 %d3, i64 %which) nounwind {
entry:
  %local.h.1097 = alloca i64
  %local.lp.1098 = alloca i64
  %local.lm.1099 = alloca i64
  %local.d1 = alloca i64
  store i64 %d1, ptr %local.d1
  %local.d2 = alloca i64
  store i64 %d2, ptr %local.d2
  %local.d3 = alloca i64
  store i64 %d3, ptr %local.d3
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %t1100 = call i64 @f64_parse(ptr @.str.exp_code_gates.180)
  store i64 %t1100, ptr %local.h.1097
  %t1101 = call i64 @f64_parse(ptr @.str.exp_code_gates.181)
  store i64 %t1101, ptr %local.lp.1098
  %t1102 = call i64 @f64_parse(ptr @.str.exp_code_gates.182)
  store i64 %t1102, ptr %local.lm.1099
  %t1103 = load i64, ptr %local.which
  %t1104 = icmp eq i64 %t1103, 0
  %t1105 = zext i1 %t1104 to i64
  %t1106 = icmp ne i64 %t1105, 0
  br i1 %t1106, label %then26, label %else26
then26:
  %t1107 = load i64, ptr %local.d1
  %t1108 = load i64, ptr %local.h.1097
  %t1109 = call i64 @"sx_f64_add"(i64 %t1107, i64 %t1108)
  %t1110 = load i64, ptr %local.d2
  %t1111 = load i64, ptr %local.d3
  %t1112 = call i64 @"total_cost"(i64 %t1109, i64 %t1110, i64 %t1111)
  store i64 %t1112, ptr %local.lp.1098
  %t1113 = load i64, ptr %local.d1
  %t1114 = load i64, ptr %local.h.1097
  %t1115 = call i64 @"sx_f64_sub"(i64 %t1113, i64 %t1114)
  %t1116 = load i64, ptr %local.d2
  %t1117 = load i64, ptr %local.d3
  %t1118 = call i64 @"total_cost"(i64 %t1115, i64 %t1116, i64 %t1117)
  store i64 %t1118, ptr %local.lm.1099
  br label %then26_end
then26_end:
  br label %endif26
else26:
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t1119 = phi i64 [ 0, %then26_end ], [ 0, %else26_end ]
  %t1120 = load i64, ptr %local.which
  %t1121 = icmp eq i64 %t1120, 1
  %t1122 = zext i1 %t1121 to i64
  %t1123 = icmp ne i64 %t1122, 0
  br i1 %t1123, label %then27, label %else27
then27:
  %t1124 = load i64, ptr %local.d1
  %t1125 = load i64, ptr %local.d2
  %t1126 = load i64, ptr %local.h.1097
  %t1127 = call i64 @"sx_f64_add"(i64 %t1125, i64 %t1126)
  %t1128 = load i64, ptr %local.d3
  %t1129 = call i64 @"total_cost"(i64 %t1124, i64 %t1127, i64 %t1128)
  store i64 %t1129, ptr %local.lp.1098
  %t1130 = load i64, ptr %local.d1
  %t1131 = load i64, ptr %local.d2
  %t1132 = load i64, ptr %local.h.1097
  %t1133 = call i64 @"sx_f64_sub"(i64 %t1131, i64 %t1132)
  %t1134 = load i64, ptr %local.d3
  %t1135 = call i64 @"total_cost"(i64 %t1130, i64 %t1133, i64 %t1134)
  store i64 %t1135, ptr %local.lm.1099
  br label %then27_end
then27_end:
  br label %endif27
else27:
  br label %else27_end
else27_end:
  br label %endif27
endif27:
  %t1136 = phi i64 [ 0, %then27_end ], [ 0, %else27_end ]
  %t1137 = load i64, ptr %local.which
  %t1138 = icmp eq i64 %t1137, 2
  %t1139 = zext i1 %t1138 to i64
  %t1140 = icmp ne i64 %t1139, 0
  br i1 %t1140, label %then28, label %else28
then28:
  %t1141 = load i64, ptr %local.d1
  %t1142 = load i64, ptr %local.d2
  %t1143 = load i64, ptr %local.d3
  %t1144 = load i64, ptr %local.h.1097
  %t1145 = call i64 @"sx_f64_add"(i64 %t1143, i64 %t1144)
  %t1146 = call i64 @"total_cost"(i64 %t1141, i64 %t1142, i64 %t1145)
  store i64 %t1146, ptr %local.lp.1098
  %t1147 = load i64, ptr %local.d1
  %t1148 = load i64, ptr %local.d2
  %t1149 = load i64, ptr %local.d3
  %t1150 = load i64, ptr %local.h.1097
  %t1151 = call i64 @"sx_f64_sub"(i64 %t1149, i64 %t1150)
  %t1152 = call i64 @"total_cost"(i64 %t1147, i64 %t1148, i64 %t1151)
  store i64 %t1152, ptr %local.lm.1099
  br label %then28_end
then28_end:
  br label %endif28
else28:
  br label %else28_end
else28_end:
  br label %endif28
endif28:
  %t1153 = phi i64 [ 0, %then28_end ], [ 0, %else28_end ]
  %t1154 = load i64, ptr %local.lp.1098
  %t1155 = load i64, ptr %local.lm.1099
  %t1156 = call i64 @"sx_f64_sub"(i64 %t1154, i64 %t1155)
  %t1157 = call i64 @f64_parse(ptr @.str.exp_code_gates.183)
  %t1158 = load i64, ptr %local.h.1097
  %t1159 = call i64 @"sx_f64_mul"(i64 %t1157, i64 %t1158)
  %t1160 = call i64 @"sx_f64_div"(i64 %t1156, i64 %t1159)
  ret i64 %t1160
}

define i64 @"lat_grad"(i64 %d1, i64 %d2, i64 %d3, i64 %which) nounwind {
entry:
  %local.h.1161 = alloca i64
  %local.lp.1162 = alloca i64
  %local.lm.1163 = alloca i64
  %local.d1 = alloca i64
  store i64 %d1, ptr %local.d1
  %local.d2 = alloca i64
  store i64 %d2, ptr %local.d2
  %local.d3 = alloca i64
  store i64 %d3, ptr %local.d3
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %t1164 = call i64 @f64_parse(ptr @.str.exp_code_gates.184)
  store i64 %t1164, ptr %local.h.1161
  %t1165 = call i64 @f64_parse(ptr @.str.exp_code_gates.185)
  store i64 %t1165, ptr %local.lp.1162
  %t1166 = call i64 @f64_parse(ptr @.str.exp_code_gates.186)
  store i64 %t1166, ptr %local.lm.1163
  %t1167 = load i64, ptr %local.which
  %t1168 = icmp eq i64 %t1167, 0
  %t1169 = zext i1 %t1168 to i64
  %t1170 = icmp ne i64 %t1169, 0
  br i1 %t1170, label %then29, label %else29
then29:
  %t1171 = load i64, ptr %local.d1
  %t1172 = load i64, ptr %local.h.1161
  %t1173 = call i64 @"sx_f64_add"(i64 %t1171, i64 %t1172)
  %t1174 = load i64, ptr %local.d2
  %t1175 = load i64, ptr %local.d3
  %t1176 = call i64 @"latency_cost"(i64 %t1173, i64 %t1174, i64 %t1175)
  store i64 %t1176, ptr %local.lp.1162
  %t1177 = load i64, ptr %local.d1
  %t1178 = load i64, ptr %local.h.1161
  %t1179 = call i64 @"sx_f64_sub"(i64 %t1177, i64 %t1178)
  %t1180 = load i64, ptr %local.d2
  %t1181 = load i64, ptr %local.d3
  %t1182 = call i64 @"latency_cost"(i64 %t1179, i64 %t1180, i64 %t1181)
  store i64 %t1182, ptr %local.lm.1163
  br label %then29_end
then29_end:
  br label %endif29
else29:
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t1183 = phi i64 [ 0, %then29_end ], [ 0, %else29_end ]
  %t1184 = load i64, ptr %local.which
  %t1185 = icmp eq i64 %t1184, 1
  %t1186 = zext i1 %t1185 to i64
  %t1187 = icmp ne i64 %t1186, 0
  br i1 %t1187, label %then30, label %else30
then30:
  %t1188 = load i64, ptr %local.d1
  %t1189 = load i64, ptr %local.d2
  %t1190 = load i64, ptr %local.h.1161
  %t1191 = call i64 @"sx_f64_add"(i64 %t1189, i64 %t1190)
  %t1192 = load i64, ptr %local.d3
  %t1193 = call i64 @"latency_cost"(i64 %t1188, i64 %t1191, i64 %t1192)
  store i64 %t1193, ptr %local.lp.1162
  %t1194 = load i64, ptr %local.d1
  %t1195 = load i64, ptr %local.d2
  %t1196 = load i64, ptr %local.h.1161
  %t1197 = call i64 @"sx_f64_sub"(i64 %t1195, i64 %t1196)
  %t1198 = load i64, ptr %local.d3
  %t1199 = call i64 @"latency_cost"(i64 %t1194, i64 %t1197, i64 %t1198)
  store i64 %t1199, ptr %local.lm.1163
  br label %then30_end
then30_end:
  br label %endif30
else30:
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t1200 = phi i64 [ 0, %then30_end ], [ 0, %else30_end ]
  %t1201 = load i64, ptr %local.which
  %t1202 = icmp eq i64 %t1201, 2
  %t1203 = zext i1 %t1202 to i64
  %t1204 = icmp ne i64 %t1203, 0
  br i1 %t1204, label %then31, label %else31
then31:
  %t1205 = load i64, ptr %local.d1
  %t1206 = load i64, ptr %local.d2
  %t1207 = load i64, ptr %local.d3
  %t1208 = load i64, ptr %local.h.1161
  %t1209 = call i64 @"sx_f64_add"(i64 %t1207, i64 %t1208)
  %t1210 = call i64 @"latency_cost"(i64 %t1205, i64 %t1206, i64 %t1209)
  store i64 %t1210, ptr %local.lp.1162
  %t1211 = load i64, ptr %local.d1
  %t1212 = load i64, ptr %local.d2
  %t1213 = load i64, ptr %local.d3
  %t1214 = load i64, ptr %local.h.1161
  %t1215 = call i64 @"sx_f64_sub"(i64 %t1213, i64 %t1214)
  %t1216 = call i64 @"latency_cost"(i64 %t1211, i64 %t1212, i64 %t1215)
  store i64 %t1216, ptr %local.lm.1163
  br label %then31_end
then31_end:
  br label %endif31
else31:
  br label %else31_end
else31_end:
  br label %endif31
endif31:
  %t1217 = phi i64 [ 0, %then31_end ], [ 0, %else31_end ]
  %t1218 = load i64, ptr %local.lp.1162
  %t1219 = load i64, ptr %local.lm.1163
  %t1220 = call i64 @"sx_f64_sub"(i64 %t1218, i64 %t1219)
  %t1221 = call i64 @f64_parse(ptr @.str.exp_code_gates.187)
  %t1222 = load i64, ptr %local.h.1161
  %t1223 = call i64 @"sx_f64_mul"(i64 %t1221, i64 %t1222)
  %t1224 = call i64 @"sx_f64_div"(i64 %t1220, i64 %t1223)
  ret i64 %t1224
}

define i64 @"size_grad"(i64 %d1, i64 %d2, i64 %d3, i64 %which) nounwind {
entry:
  %local.h.1225 = alloca i64
  %local.lp.1226 = alloca i64
  %local.lm.1227 = alloca i64
  %local.d1 = alloca i64
  store i64 %d1, ptr %local.d1
  %local.d2 = alloca i64
  store i64 %d2, ptr %local.d2
  %local.d3 = alloca i64
  store i64 %d3, ptr %local.d3
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %t1228 = call i64 @f64_parse(ptr @.str.exp_code_gates.188)
  store i64 %t1228, ptr %local.h.1225
  %t1229 = call i64 @f64_parse(ptr @.str.exp_code_gates.189)
  store i64 %t1229, ptr %local.lp.1226
  %t1230 = call i64 @f64_parse(ptr @.str.exp_code_gates.190)
  store i64 %t1230, ptr %local.lm.1227
  %t1231 = load i64, ptr %local.which
  %t1232 = icmp eq i64 %t1231, 0
  %t1233 = zext i1 %t1232 to i64
  %t1234 = icmp ne i64 %t1233, 0
  br i1 %t1234, label %then32, label %else32
then32:
  %t1235 = load i64, ptr %local.d1
  %t1236 = load i64, ptr %local.h.1225
  %t1237 = call i64 @"sx_f64_add"(i64 %t1235, i64 %t1236)
  %t1238 = load i64, ptr %local.d2
  %t1239 = load i64, ptr %local.d3
  %t1240 = call i64 @"codesize_cost"(i64 %t1237, i64 %t1238, i64 %t1239)
  store i64 %t1240, ptr %local.lp.1226
  %t1241 = load i64, ptr %local.d1
  %t1242 = load i64, ptr %local.h.1225
  %t1243 = call i64 @"sx_f64_sub"(i64 %t1241, i64 %t1242)
  %t1244 = load i64, ptr %local.d2
  %t1245 = load i64, ptr %local.d3
  %t1246 = call i64 @"codesize_cost"(i64 %t1243, i64 %t1244, i64 %t1245)
  store i64 %t1246, ptr %local.lm.1227
  br label %then32_end
then32_end:
  br label %endif32
else32:
  br label %else32_end
else32_end:
  br label %endif32
endif32:
  %t1247 = phi i64 [ 0, %then32_end ], [ 0, %else32_end ]
  %t1248 = load i64, ptr %local.which
  %t1249 = icmp eq i64 %t1248, 1
  %t1250 = zext i1 %t1249 to i64
  %t1251 = icmp ne i64 %t1250, 0
  br i1 %t1251, label %then33, label %else33
then33:
  %t1252 = load i64, ptr %local.d1
  %t1253 = load i64, ptr %local.d2
  %t1254 = load i64, ptr %local.h.1225
  %t1255 = call i64 @"sx_f64_add"(i64 %t1253, i64 %t1254)
  %t1256 = load i64, ptr %local.d3
  %t1257 = call i64 @"codesize_cost"(i64 %t1252, i64 %t1255, i64 %t1256)
  store i64 %t1257, ptr %local.lp.1226
  %t1258 = load i64, ptr %local.d1
  %t1259 = load i64, ptr %local.d2
  %t1260 = load i64, ptr %local.h.1225
  %t1261 = call i64 @"sx_f64_sub"(i64 %t1259, i64 %t1260)
  %t1262 = load i64, ptr %local.d3
  %t1263 = call i64 @"codesize_cost"(i64 %t1258, i64 %t1261, i64 %t1262)
  store i64 %t1263, ptr %local.lm.1227
  br label %then33_end
then33_end:
  br label %endif33
else33:
  br label %else33_end
else33_end:
  br label %endif33
endif33:
  %t1264 = phi i64 [ 0, %then33_end ], [ 0, %else33_end ]
  %t1265 = load i64, ptr %local.which
  %t1266 = icmp eq i64 %t1265, 2
  %t1267 = zext i1 %t1266 to i64
  %t1268 = icmp ne i64 %t1267, 0
  br i1 %t1268, label %then34, label %else34
then34:
  %t1269 = load i64, ptr %local.d1
  %t1270 = load i64, ptr %local.d2
  %t1271 = load i64, ptr %local.d3
  %t1272 = load i64, ptr %local.h.1225
  %t1273 = call i64 @"sx_f64_add"(i64 %t1271, i64 %t1272)
  %t1274 = call i64 @"codesize_cost"(i64 %t1269, i64 %t1270, i64 %t1273)
  store i64 %t1274, ptr %local.lp.1226
  %t1275 = load i64, ptr %local.d1
  %t1276 = load i64, ptr %local.d2
  %t1277 = load i64, ptr %local.d3
  %t1278 = load i64, ptr %local.h.1225
  %t1279 = call i64 @"sx_f64_sub"(i64 %t1277, i64 %t1278)
  %t1280 = call i64 @"codesize_cost"(i64 %t1275, i64 %t1276, i64 %t1279)
  store i64 %t1280, ptr %local.lm.1227
  br label %then34_end
then34_end:
  br label %endif34
else34:
  br label %else34_end
else34_end:
  br label %endif34
endif34:
  %t1281 = phi i64 [ 0, %then34_end ], [ 0, %else34_end ]
  %t1282 = load i64, ptr %local.lp.1226
  %t1283 = load i64, ptr %local.lm.1227
  %t1284 = call i64 @"sx_f64_sub"(i64 %t1282, i64 %t1283)
  %t1285 = call i64 @f64_parse(ptr @.str.exp_code_gates.191)
  %t1286 = load i64, ptr %local.h.1225
  %t1287 = call i64 @"sx_f64_mul"(i64 %t1285, i64 %t1286)
  %t1288 = call i64 @"sx_f64_div"(i64 %t1284, i64 %t1287)
  ret i64 %t1288
}

define i64 @"decision_cosine"(i64 %d1, i64 %d2, i64 %d3, i64 %di, i64 %dj) nounwind {
entry:
  %local.gli.1289 = alloca i64
  %local.gsi.1290 = alloca i64
  %local.glj.1291 = alloca i64
  %local.gsj.1292 = alloca i64
  %local.dot_val.1293 = alloca i64
  %local.ni.1294 = alloca i64
  %local.nj.1295 = alloca i64
  %local.d1 = alloca i64
  store i64 %d1, ptr %local.d1
  %local.d2 = alloca i64
  store i64 %d2, ptr %local.d2
  %local.d3 = alloca i64
  store i64 %d3, ptr %local.d3
  %local.di = alloca i64
  store i64 %di, ptr %local.di
  %local.dj = alloca i64
  store i64 %dj, ptr %local.dj
  %t1296 = load i64, ptr %local.d1
  %t1297 = load i64, ptr %local.d2
  %t1298 = load i64, ptr %local.d3
  %t1299 = load i64, ptr %local.di
  %t1300 = call i64 @"lat_grad"(i64 %t1296, i64 %t1297, i64 %t1298, i64 %t1299)
  store i64 %t1300, ptr %local.gli.1289
  %t1301 = load i64, ptr %local.d1
  %t1302 = load i64, ptr %local.d2
  %t1303 = load i64, ptr %local.d3
  %t1304 = load i64, ptr %local.di
  %t1305 = call i64 @"size_grad"(i64 %t1301, i64 %t1302, i64 %t1303, i64 %t1304)
  store i64 %t1305, ptr %local.gsi.1290
  %t1306 = load i64, ptr %local.d1
  %t1307 = load i64, ptr %local.d2
  %t1308 = load i64, ptr %local.d3
  %t1309 = load i64, ptr %local.dj
  %t1310 = call i64 @"lat_grad"(i64 %t1306, i64 %t1307, i64 %t1308, i64 %t1309)
  store i64 %t1310, ptr %local.glj.1291
  %t1311 = load i64, ptr %local.d1
  %t1312 = load i64, ptr %local.d2
  %t1313 = load i64, ptr %local.d3
  %t1314 = load i64, ptr %local.dj
  %t1315 = call i64 @"size_grad"(i64 %t1311, i64 %t1312, i64 %t1313, i64 %t1314)
  store i64 %t1315, ptr %local.gsj.1292
  %t1316 = load i64, ptr %local.gli.1289
  %t1317 = load i64, ptr %local.glj.1291
  %t1318 = call i64 @"sx_f64_mul"(i64 %t1316, i64 %t1317)
  %t1319 = load i64, ptr %local.gsi.1290
  %t1320 = load i64, ptr %local.gsj.1292
  %t1321 = call i64 @"sx_f64_mul"(i64 %t1319, i64 %t1320)
  %t1322 = call i64 @"sx_f64_add"(i64 %t1318, i64 %t1321)
  store i64 %t1322, ptr %local.dot_val.1293
  %t1323 = load i64, ptr %local.gli.1289
  %t1324 = load i64, ptr %local.gli.1289
  %t1325 = call i64 @"sx_f64_mul"(i64 %t1323, i64 %t1324)
  %t1326 = load i64, ptr %local.gsi.1290
  %t1327 = load i64, ptr %local.gsi.1290
  %t1328 = call i64 @"sx_f64_mul"(i64 %t1326, i64 %t1327)
  %t1329 = call i64 @"sx_f64_add"(i64 %t1325, i64 %t1328)
  %t1330 = call i64 @f64_parse(ptr @.str.exp_code_gates.192)
  %t1331 = call i64 @"sx_f64_add"(i64 %t1329, i64 %t1330)
  %t1332 = call i64 @"sqrt_f64"(i64 %t1331)
  store i64 %t1332, ptr %local.ni.1294
  %t1333 = load i64, ptr %local.glj.1291
  %t1334 = load i64, ptr %local.glj.1291
  %t1335 = call i64 @"sx_f64_mul"(i64 %t1333, i64 %t1334)
  %t1336 = load i64, ptr %local.gsj.1292
  %t1337 = load i64, ptr %local.gsj.1292
  %t1338 = call i64 @"sx_f64_mul"(i64 %t1336, i64 %t1337)
  %t1339 = call i64 @"sx_f64_add"(i64 %t1335, i64 %t1338)
  %t1340 = call i64 @f64_parse(ptr @.str.exp_code_gates.193)
  %t1341 = call i64 @"sx_f64_add"(i64 %t1339, i64 %t1340)
  %t1342 = call i64 @"sqrt_f64"(i64 %t1341)
  store i64 %t1342, ptr %local.nj.1295
  %t1343 = load i64, ptr %local.dot_val.1293
  %t1344 = load i64, ptr %local.ni.1294
  %t1345 = load i64, ptr %local.nj.1295
  %t1346 = call i64 @"sx_f64_mul"(i64 %t1344, i64 %t1345)
  %t1347 = call i64 @f64_parse(ptr @.str.exp_code_gates.194)
  %t1348 = call i64 @"sx_f64_add"(i64 %t1346, i64 %t1347)
  %t1349 = call i64 @"sx_f64_div"(i64 %t1343, i64 %t1348)
  ret i64 %t1349
}

define i64 @"run_exp3"() nounwind {
entry:
  %local.d1.1350 = alloca i64
  %local.d2.1351 = alloca i64
  %local.d3.1352 = alloca i64
  %local.step.1353 = alloca i64
  %local.g1.1354 = alloca i64
  %local.g2.1355 = alloca i64
  %local.g3.1356 = alloca i64
  %local.prev_d1.1357 = alloca i64
  %local.prev_d2.1358 = alloca i64
  %local.prev_d3.1359 = alloca i64
  %local.conv_score.1360 = alloca i64
  %local.cost.1361 = alloca i64
  %local.lr.1362 = alloca i64
  %local.steps.1363 = alloca i64
  %local.init_cost.1364 = alloca i64
  %local.final_cost.1365 = alloca i64
  %t1366 = call i64 @f64_parse(ptr @.str.exp_code_gates.195)
  store i64 %t1366, ptr %local.d1.1350
  %t1367 = call i64 @f64_parse(ptr @.str.exp_code_gates.196)
  store i64 %t1367, ptr %local.d2.1351
  %t1368 = call i64 @f64_parse(ptr @.str.exp_code_gates.197)
  store i64 %t1368, ptr %local.d3.1352
  store i64 0, ptr %local.step.1353
  %t1369 = call i64 @f64_parse(ptr @.str.exp_code_gates.198)
  store i64 %t1369, ptr %local.g1.1354
  %t1370 = call i64 @f64_parse(ptr @.str.exp_code_gates.199)
  store i64 %t1370, ptr %local.g2.1355
  %t1371 = call i64 @f64_parse(ptr @.str.exp_code_gates.200)
  store i64 %t1371, ptr %local.g3.1356
  %t1372 = call i64 @f64_parse(ptr @.str.exp_code_gates.201)
  store i64 %t1372, ptr %local.prev_d1.1357
  %t1373 = call i64 @f64_parse(ptr @.str.exp_code_gates.202)
  store i64 %t1373, ptr %local.prev_d2.1358
  %t1374 = call i64 @f64_parse(ptr @.str.exp_code_gates.203)
  store i64 %t1374, ptr %local.prev_d3.1359
  %t1375 = call i64 @f64_parse(ptr @.str.exp_code_gates.204)
  store i64 %t1375, ptr %local.conv_score.1360
  %t1376 = call i64 @f64_parse(ptr @.str.exp_code_gates.205)
  store i64 %t1376, ptr %local.cost.1361
  %t1377 = call i64 @f64_parse(ptr @.str.exp_code_gates.206)
  store i64 %t1377, ptr %local.lr.1362
  store i64 100, ptr %local.steps.1363
  %t1378 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.207)
  %t1379 = ptrtoint ptr %t1378 to i64
  %t1380 = inttoptr i64 %t1379 to ptr
  call void @intrinsic_println(ptr %t1380)
  %t1381 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.208)
  %t1382 = ptrtoint ptr %t1381 to i64
  %t1383 = inttoptr i64 %t1382 to ptr
  call void @intrinsic_println(ptr %t1383)
  %t1384 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.209)
  %t1385 = ptrtoint ptr %t1384 to i64
  %t1386 = inttoptr i64 %t1385 to ptr
  call void @intrinsic_println(ptr %t1386)
  %t1387 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.210)
  %t1388 = ptrtoint ptr %t1387 to i64
  %t1389 = inttoptr i64 %t1388 to ptr
  call void @intrinsic_println(ptr %t1389)
  %t1390 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.211)
  %t1391 = ptrtoint ptr %t1390 to i64
  %t1392 = inttoptr i64 %t1391 to ptr
  call void @intrinsic_println(ptr %t1392)
  %t1393 = load i64, ptr %local.d1.1350
  %t1394 = load i64, ptr %local.d2.1351
  %t1395 = load i64, ptr %local.d3.1352
  %t1396 = call i64 @"total_cost"(i64 %t1393, i64 %t1394, i64 %t1395)
  store i64 %t1396, ptr %local.init_cost.1364
  %t1397 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.212)
  %t1398 = ptrtoint ptr %t1397 to i64
  %t1399 = inttoptr i64 %t1398 to ptr
  call void @intrinsic_print(ptr %t1399)
  %t1400 = load i64, ptr %local.init_cost.1364
  %t1401 = call i64 @"print_f64"(i64 %t1400)
  %t1402 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.213)
  %t1403 = ptrtoint ptr %t1402 to i64
  %t1404 = inttoptr i64 %t1403 to ptr
  call void @intrinsic_println(ptr %t1404)
  %t1405 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.214)
  %t1406 = ptrtoint ptr %t1405 to i64
  %t1407 = inttoptr i64 %t1406 to ptr
  call void @intrinsic_println(ptr %t1407)
  %t1408 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.215)
  %t1409 = ptrtoint ptr %t1408 to i64
  %t1410 = inttoptr i64 %t1409 to ptr
  call void @intrinsic_println(ptr %t1410)
  %t1411 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.216)
  %t1412 = ptrtoint ptr %t1411 to i64
  %t1413 = inttoptr i64 %t1412 to ptr
  call void @intrinsic_print(ptr %t1413)
  %t1414 = load i64, ptr %local.d1.1350
  %t1415 = load i64, ptr %local.d2.1351
  %t1416 = load i64, ptr %local.d3.1352
  %t1417 = call i64 @"decision_cosine"(i64 %t1414, i64 %t1415, i64 %t1416, i64 0, i64 0)
  %t1418 = call i64 @"print_f64"(i64 %t1417)
  %t1419 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.217)
  %t1420 = ptrtoint ptr %t1419 to i64
  %t1421 = inttoptr i64 %t1420 to ptr
  call void @intrinsic_print(ptr %t1421)
  %t1422 = load i64, ptr %local.d1.1350
  %t1423 = load i64, ptr %local.d2.1351
  %t1424 = load i64, ptr %local.d3.1352
  %t1425 = call i64 @"decision_cosine"(i64 %t1422, i64 %t1423, i64 %t1424, i64 0, i64 1)
  %t1426 = call i64 @"print_f64"(i64 %t1425)
  %t1427 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.218)
  %t1428 = ptrtoint ptr %t1427 to i64
  %t1429 = inttoptr i64 %t1428 to ptr
  call void @intrinsic_print(ptr %t1429)
  %t1430 = load i64, ptr %local.d1.1350
  %t1431 = load i64, ptr %local.d2.1351
  %t1432 = load i64, ptr %local.d3.1352
  %t1433 = call i64 @"decision_cosine"(i64 %t1430, i64 %t1431, i64 %t1432, i64 0, i64 2)
  %t1434 = call i64 @"print_f64"(i64 %t1433)
  %t1435 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.219)
  %t1436 = ptrtoint ptr %t1435 to i64
  %t1437 = inttoptr i64 %t1436 to ptr
  call void @intrinsic_println(ptr %t1437)
  %t1438 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.220)
  %t1439 = ptrtoint ptr %t1438 to i64
  %t1440 = inttoptr i64 %t1439 to ptr
  call void @intrinsic_print(ptr %t1440)
  %t1441 = load i64, ptr %local.d1.1350
  %t1442 = load i64, ptr %local.d2.1351
  %t1443 = load i64, ptr %local.d3.1352
  %t1444 = call i64 @"decision_cosine"(i64 %t1441, i64 %t1442, i64 %t1443, i64 1, i64 0)
  %t1445 = call i64 @"print_f64"(i64 %t1444)
  %t1446 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.221)
  %t1447 = ptrtoint ptr %t1446 to i64
  %t1448 = inttoptr i64 %t1447 to ptr
  call void @intrinsic_print(ptr %t1448)
  %t1449 = load i64, ptr %local.d1.1350
  %t1450 = load i64, ptr %local.d2.1351
  %t1451 = load i64, ptr %local.d3.1352
  %t1452 = call i64 @"decision_cosine"(i64 %t1449, i64 %t1450, i64 %t1451, i64 1, i64 1)
  %t1453 = call i64 @"print_f64"(i64 %t1452)
  %t1454 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.222)
  %t1455 = ptrtoint ptr %t1454 to i64
  %t1456 = inttoptr i64 %t1455 to ptr
  call void @intrinsic_print(ptr %t1456)
  %t1457 = load i64, ptr %local.d1.1350
  %t1458 = load i64, ptr %local.d2.1351
  %t1459 = load i64, ptr %local.d3.1352
  %t1460 = call i64 @"decision_cosine"(i64 %t1457, i64 %t1458, i64 %t1459, i64 1, i64 2)
  %t1461 = call i64 @"print_f64"(i64 %t1460)
  %t1462 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.223)
  %t1463 = ptrtoint ptr %t1462 to i64
  %t1464 = inttoptr i64 %t1463 to ptr
  call void @intrinsic_println(ptr %t1464)
  %t1465 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.224)
  %t1466 = ptrtoint ptr %t1465 to i64
  %t1467 = inttoptr i64 %t1466 to ptr
  call void @intrinsic_print(ptr %t1467)
  %t1468 = load i64, ptr %local.d1.1350
  %t1469 = load i64, ptr %local.d2.1351
  %t1470 = load i64, ptr %local.d3.1352
  %t1471 = call i64 @"decision_cosine"(i64 %t1468, i64 %t1469, i64 %t1470, i64 2, i64 0)
  %t1472 = call i64 @"print_f64"(i64 %t1471)
  %t1473 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.225)
  %t1474 = ptrtoint ptr %t1473 to i64
  %t1475 = inttoptr i64 %t1474 to ptr
  call void @intrinsic_print(ptr %t1475)
  %t1476 = load i64, ptr %local.d1.1350
  %t1477 = load i64, ptr %local.d2.1351
  %t1478 = load i64, ptr %local.d3.1352
  %t1479 = call i64 @"decision_cosine"(i64 %t1476, i64 %t1477, i64 %t1478, i64 2, i64 1)
  %t1480 = call i64 @"print_f64"(i64 %t1479)
  %t1481 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.226)
  %t1482 = ptrtoint ptr %t1481 to i64
  %t1483 = inttoptr i64 %t1482 to ptr
  call void @intrinsic_print(ptr %t1483)
  %t1484 = load i64, ptr %local.d1.1350
  %t1485 = load i64, ptr %local.d2.1351
  %t1486 = load i64, ptr %local.d3.1352
  %t1487 = call i64 @"decision_cosine"(i64 %t1484, i64 %t1485, i64 %t1486, i64 2, i64 2)
  %t1488 = call i64 @"print_f64"(i64 %t1487)
  %t1489 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.227)
  %t1490 = ptrtoint ptr %t1489 to i64
  %t1491 = inttoptr i64 %t1490 to ptr
  call void @intrinsic_println(ptr %t1491)
  %t1492 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.228)
  %t1493 = ptrtoint ptr %t1492 to i64
  %t1494 = inttoptr i64 %t1493 to ptr
  call void @intrinsic_println(ptr %t1494)
  %t1495 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.229)
  %t1496 = ptrtoint ptr %t1495 to i64
  %t1497 = inttoptr i64 %t1496 to ptr
  call void @intrinsic_println(ptr %t1497)
  %t1498 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.230)
  %t1499 = ptrtoint ptr %t1498 to i64
  %t1500 = inttoptr i64 %t1499 to ptr
  call void @intrinsic_println(ptr %t1500)
  br label %loop35
loop35:
  %t1501 = load i64, ptr %local.step.1353
  %t1502 = load i64, ptr %local.steps.1363
  %t1503 = icmp slt i64 %t1501, %t1502
  %t1504 = zext i1 %t1503 to i64
  %t1505 = icmp ne i64 %t1504, 0
  br i1 %t1505, label %body35, label %endloop35
body35:
  %t1506 = load i64, ptr %local.d1.1350
  store i64 %t1506, ptr %local.prev_d1.1357
  %t1507 = load i64, ptr %local.d2.1351
  store i64 %t1507, ptr %local.prev_d2.1358
  %t1508 = load i64, ptr %local.d3.1352
  store i64 %t1508, ptr %local.prev_d3.1359
  %t1509 = load i64, ptr %local.d1.1350
  %t1510 = load i64, ptr %local.d2.1351
  %t1511 = load i64, ptr %local.d3.1352
  %t1512 = call i64 @"cost_grad"(i64 %t1509, i64 %t1510, i64 %t1511, i64 0)
  store i64 %t1512, ptr %local.g1.1354
  %t1513 = load i64, ptr %local.d1.1350
  %t1514 = load i64, ptr %local.d2.1351
  %t1515 = load i64, ptr %local.d3.1352
  %t1516 = call i64 @"cost_grad"(i64 %t1513, i64 %t1514, i64 %t1515, i64 1)
  store i64 %t1516, ptr %local.g2.1355
  %t1517 = load i64, ptr %local.d1.1350
  %t1518 = load i64, ptr %local.d2.1351
  %t1519 = load i64, ptr %local.d3.1352
  %t1520 = call i64 @"cost_grad"(i64 %t1517, i64 %t1518, i64 %t1519, i64 2)
  store i64 %t1520, ptr %local.g3.1356
  %t1521 = load i64, ptr %local.d1.1350
  %t1522 = load i64, ptr %local.lr.1362
  %t1523 = load i64, ptr %local.g1.1354
  %t1524 = call i64 @"sx_f64_mul"(i64 %t1522, i64 %t1523)
  %t1525 = call i64 @"sx_f64_sub"(i64 %t1521, i64 %t1524)
  %t1526 = call i64 @f64_parse(ptr @.str.exp_code_gates.231)
  %t1527 = call i64 @f64_parse(ptr @.str.exp_code_gates.232)
  %t1528 = call i64 @"clamp"(i64 %t1525, i64 %t1526, i64 %t1527)
  store i64 %t1528, ptr %local.d1.1350
  %t1529 = load i64, ptr %local.d2.1351
  %t1530 = load i64, ptr %local.lr.1362
  %t1531 = load i64, ptr %local.g2.1355
  %t1532 = call i64 @"sx_f64_mul"(i64 %t1530, i64 %t1531)
  %t1533 = call i64 @"sx_f64_sub"(i64 %t1529, i64 %t1532)
  %t1534 = call i64 @f64_parse(ptr @.str.exp_code_gates.233)
  %t1535 = call i64 @f64_parse(ptr @.str.exp_code_gates.234)
  %t1536 = call i64 @"clamp"(i64 %t1533, i64 %t1534, i64 %t1535)
  store i64 %t1536, ptr %local.d2.1351
  %t1537 = load i64, ptr %local.d3.1352
  %t1538 = load i64, ptr %local.lr.1362
  %t1539 = load i64, ptr %local.g3.1356
  %t1540 = call i64 @"sx_f64_mul"(i64 %t1538, i64 %t1539)
  %t1541 = call i64 @"sx_f64_sub"(i64 %t1537, i64 %t1540)
  %t1542 = call i64 @f64_parse(ptr @.str.exp_code_gates.235)
  %t1543 = call i64 @f64_parse(ptr @.str.exp_code_gates.236)
  %t1544 = call i64 @"clamp"(i64 %t1541, i64 %t1542, i64 %t1543)
  store i64 %t1544, ptr %local.d3.1352
  %t1545 = load i64, ptr %local.d1.1350
  %t1546 = load i64, ptr %local.prev_d1.1357
  %t1547 = call i64 @"sx_f64_sub"(i64 %t1545, i64 %t1546)
  %t1548 = call i64 @"abs_f64"(i64 %t1547)
  %t1549 = load i64, ptr %local.d2.1351
  %t1550 = load i64, ptr %local.prev_d2.1358
  %t1551 = call i64 @"sx_f64_sub"(i64 %t1549, i64 %t1550)
  %t1552 = call i64 @"abs_f64"(i64 %t1551)
  %t1553 = call i64 @"sx_f64_add"(i64 %t1548, i64 %t1552)
  %t1554 = load i64, ptr %local.d3.1352
  %t1555 = load i64, ptr %local.prev_d3.1359
  %t1556 = call i64 @"sx_f64_sub"(i64 %t1554, i64 %t1555)
  %t1557 = call i64 @"abs_f64"(i64 %t1556)
  %t1558 = call i64 @"sx_f64_add"(i64 %t1553, i64 %t1557)
  store i64 %t1558, ptr %local.conv_score.1360
  %t1559 = load i64, ptr %local.d1.1350
  %t1560 = load i64, ptr %local.d2.1351
  %t1561 = load i64, ptr %local.d3.1352
  %t1562 = call i64 @"total_cost"(i64 %t1559, i64 %t1560, i64 %t1561)
  store i64 %t1562, ptr %local.cost.1361
  %t1563 = load i64, ptr %local.step.1353
  %t1564 = icmp slt i64 %t1563, 5
  %t1565 = zext i1 %t1564 to i64
  %t1566 = icmp ne i64 %t1565, 0
  br i1 %t1566, label %then36, label %else36
then36:
  %t1567 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.237)
  %t1568 = ptrtoint ptr %t1567 to i64
  %t1569 = inttoptr i64 %t1568 to ptr
  call void @intrinsic_print(ptr %t1569)
  %t1570 = load i64, ptr %local.step.1353
  call void @print_i64(i64 %t1570)
  %t1571 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.238)
  %t1572 = ptrtoint ptr %t1571 to i64
  %t1573 = inttoptr i64 %t1572 to ptr
  call void @intrinsic_print(ptr %t1573)
  %t1574 = load i64, ptr %local.d1.1350
  %t1575 = call i64 @"print_f64"(i64 %t1574)
  %t1576 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.239)
  %t1577 = ptrtoint ptr %t1576 to i64
  %t1578 = inttoptr i64 %t1577 to ptr
  call void @intrinsic_print(ptr %t1578)
  %t1579 = load i64, ptr %local.d2.1351
  %t1580 = call i64 @"print_f64"(i64 %t1579)
  %t1581 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.240)
  %t1582 = ptrtoint ptr %t1581 to i64
  %t1583 = inttoptr i64 %t1582 to ptr
  call void @intrinsic_print(ptr %t1583)
  %t1584 = load i64, ptr %local.d3.1352
  %t1585 = call i64 @"print_f64"(i64 %t1584)
  %t1586 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.241)
  %t1587 = ptrtoint ptr %t1586 to i64
  %t1588 = inttoptr i64 %t1587 to ptr
  call void @intrinsic_print(ptr %t1588)
  %t1589 = load i64, ptr %local.cost.1361
  %t1590 = call i64 @"print_f64"(i64 %t1589)
  %t1591 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.242)
  %t1592 = ptrtoint ptr %t1591 to i64
  %t1593 = inttoptr i64 %t1592 to ptr
  call void @intrinsic_print(ptr %t1593)
  %t1594 = load i64, ptr %local.conv_score.1360
  %t1595 = call i64 @"print_f64"(i64 %t1594)
  %t1596 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.243)
  %t1597 = ptrtoint ptr %t1596 to i64
  %t1598 = inttoptr i64 %t1597 to ptr
  call void @intrinsic_println(ptr %t1598)
  br label %then36_end
then36_end:
  br label %endif36
else36:
  br label %else36_end
else36_end:
  br label %endif36
endif36:
  %t1599 = phi i64 [ 0, %then36_end ], [ 0, %else36_end ]
  %t1600 = load i64, ptr %local.step.1353
  %t1601 = icmp eq i64 %t1600, 10
  %t1602 = zext i1 %t1601 to i64
  %t1603 = icmp ne i64 %t1602, 0
  br i1 %t1603, label %then37, label %else37
then37:
  %t1604 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.244)
  %t1605 = ptrtoint ptr %t1604 to i64
  %t1606 = inttoptr i64 %t1605 to ptr
  call void @intrinsic_print(ptr %t1606)
  %t1607 = load i64, ptr %local.d1.1350
  %t1608 = call i64 @"print_f64"(i64 %t1607)
  %t1609 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.245)
  %t1610 = ptrtoint ptr %t1609 to i64
  %t1611 = inttoptr i64 %t1610 to ptr
  call void @intrinsic_print(ptr %t1611)
  %t1612 = load i64, ptr %local.d2.1351
  %t1613 = call i64 @"print_f64"(i64 %t1612)
  %t1614 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.246)
  %t1615 = ptrtoint ptr %t1614 to i64
  %t1616 = inttoptr i64 %t1615 to ptr
  call void @intrinsic_print(ptr %t1616)
  %t1617 = load i64, ptr %local.d3.1352
  %t1618 = call i64 @"print_f64"(i64 %t1617)
  %t1619 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.247)
  %t1620 = ptrtoint ptr %t1619 to i64
  %t1621 = inttoptr i64 %t1620 to ptr
  call void @intrinsic_print(ptr %t1621)
  %t1622 = load i64, ptr %local.cost.1361
  %t1623 = call i64 @"print_f64"(i64 %t1622)
  %t1624 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.248)
  %t1625 = ptrtoint ptr %t1624 to i64
  %t1626 = inttoptr i64 %t1625 to ptr
  call void @intrinsic_print(ptr %t1626)
  %t1627 = load i64, ptr %local.conv_score.1360
  %t1628 = call i64 @"print_f64"(i64 %t1627)
  %t1629 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.249)
  %t1630 = ptrtoint ptr %t1629 to i64
  %t1631 = inttoptr i64 %t1630 to ptr
  call void @intrinsic_println(ptr %t1631)
  br label %then37_end
then37_end:
  br label %endif37
else37:
  br label %else37_end
else37_end:
  br label %endif37
endif37:
  %t1632 = phi i64 [ 0, %then37_end ], [ 0, %else37_end ]
  %t1633 = load i64, ptr %local.step.1353
  %t1634 = icmp eq i64 %t1633, 25
  %t1635 = zext i1 %t1634 to i64
  %t1636 = icmp ne i64 %t1635, 0
  br i1 %t1636, label %then38, label %else38
then38:
  %t1637 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.250)
  %t1638 = ptrtoint ptr %t1637 to i64
  %t1639 = inttoptr i64 %t1638 to ptr
  call void @intrinsic_print(ptr %t1639)
  %t1640 = load i64, ptr %local.d1.1350
  %t1641 = call i64 @"print_f64"(i64 %t1640)
  %t1642 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.251)
  %t1643 = ptrtoint ptr %t1642 to i64
  %t1644 = inttoptr i64 %t1643 to ptr
  call void @intrinsic_print(ptr %t1644)
  %t1645 = load i64, ptr %local.d2.1351
  %t1646 = call i64 @"print_f64"(i64 %t1645)
  %t1647 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.252)
  %t1648 = ptrtoint ptr %t1647 to i64
  %t1649 = inttoptr i64 %t1648 to ptr
  call void @intrinsic_print(ptr %t1649)
  %t1650 = load i64, ptr %local.d3.1352
  %t1651 = call i64 @"print_f64"(i64 %t1650)
  %t1652 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.253)
  %t1653 = ptrtoint ptr %t1652 to i64
  %t1654 = inttoptr i64 %t1653 to ptr
  call void @intrinsic_print(ptr %t1654)
  %t1655 = load i64, ptr %local.cost.1361
  %t1656 = call i64 @"print_f64"(i64 %t1655)
  %t1657 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.254)
  %t1658 = ptrtoint ptr %t1657 to i64
  %t1659 = inttoptr i64 %t1658 to ptr
  call void @intrinsic_print(ptr %t1659)
  %t1660 = load i64, ptr %local.conv_score.1360
  %t1661 = call i64 @"print_f64"(i64 %t1660)
  %t1662 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.255)
  %t1663 = ptrtoint ptr %t1662 to i64
  %t1664 = inttoptr i64 %t1663 to ptr
  call void @intrinsic_println(ptr %t1664)
  br label %then38_end
then38_end:
  br label %endif38
else38:
  br label %else38_end
else38_end:
  br label %endif38
endif38:
  %t1665 = phi i64 [ 0, %then38_end ], [ 0, %else38_end ]
  %t1666 = load i64, ptr %local.step.1353
  %t1667 = icmp eq i64 %t1666, 50
  %t1668 = zext i1 %t1667 to i64
  %t1669 = icmp ne i64 %t1668, 0
  br i1 %t1669, label %then39, label %else39
then39:
  %t1670 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.256)
  %t1671 = ptrtoint ptr %t1670 to i64
  %t1672 = inttoptr i64 %t1671 to ptr
  call void @intrinsic_print(ptr %t1672)
  %t1673 = load i64, ptr %local.d1.1350
  %t1674 = call i64 @"print_f64"(i64 %t1673)
  %t1675 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.257)
  %t1676 = ptrtoint ptr %t1675 to i64
  %t1677 = inttoptr i64 %t1676 to ptr
  call void @intrinsic_print(ptr %t1677)
  %t1678 = load i64, ptr %local.d2.1351
  %t1679 = call i64 @"print_f64"(i64 %t1678)
  %t1680 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.258)
  %t1681 = ptrtoint ptr %t1680 to i64
  %t1682 = inttoptr i64 %t1681 to ptr
  call void @intrinsic_print(ptr %t1682)
  %t1683 = load i64, ptr %local.d3.1352
  %t1684 = call i64 @"print_f64"(i64 %t1683)
  %t1685 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.259)
  %t1686 = ptrtoint ptr %t1685 to i64
  %t1687 = inttoptr i64 %t1686 to ptr
  call void @intrinsic_print(ptr %t1687)
  %t1688 = load i64, ptr %local.cost.1361
  %t1689 = call i64 @"print_f64"(i64 %t1688)
  %t1690 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.260)
  %t1691 = ptrtoint ptr %t1690 to i64
  %t1692 = inttoptr i64 %t1691 to ptr
  call void @intrinsic_print(ptr %t1692)
  %t1693 = load i64, ptr %local.conv_score.1360
  %t1694 = call i64 @"print_f64"(i64 %t1693)
  %t1695 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.261)
  %t1696 = ptrtoint ptr %t1695 to i64
  %t1697 = inttoptr i64 %t1696 to ptr
  call void @intrinsic_println(ptr %t1697)
  br label %then39_end
then39_end:
  br label %endif39
else39:
  br label %else39_end
else39_end:
  br label %endif39
endif39:
  %t1698 = phi i64 [ 0, %then39_end ], [ 0, %else39_end ]
  %t1699 = load i64, ptr %local.step.1353
  %t1700 = icmp eq i64 %t1699, 99
  %t1701 = zext i1 %t1700 to i64
  %t1702 = icmp ne i64 %t1701, 0
  br i1 %t1702, label %then40, label %else40
then40:
  %t1703 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.262)
  %t1704 = ptrtoint ptr %t1703 to i64
  %t1705 = inttoptr i64 %t1704 to ptr
  call void @intrinsic_print(ptr %t1705)
  %t1706 = load i64, ptr %local.d1.1350
  %t1707 = call i64 @"print_f64"(i64 %t1706)
  %t1708 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.263)
  %t1709 = ptrtoint ptr %t1708 to i64
  %t1710 = inttoptr i64 %t1709 to ptr
  call void @intrinsic_print(ptr %t1710)
  %t1711 = load i64, ptr %local.d2.1351
  %t1712 = call i64 @"print_f64"(i64 %t1711)
  %t1713 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.264)
  %t1714 = ptrtoint ptr %t1713 to i64
  %t1715 = inttoptr i64 %t1714 to ptr
  call void @intrinsic_print(ptr %t1715)
  %t1716 = load i64, ptr %local.d3.1352
  %t1717 = call i64 @"print_f64"(i64 %t1716)
  %t1718 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.265)
  %t1719 = ptrtoint ptr %t1718 to i64
  %t1720 = inttoptr i64 %t1719 to ptr
  call void @intrinsic_print(ptr %t1720)
  %t1721 = load i64, ptr %local.cost.1361
  %t1722 = call i64 @"print_f64"(i64 %t1721)
  %t1723 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.266)
  %t1724 = ptrtoint ptr %t1723 to i64
  %t1725 = inttoptr i64 %t1724 to ptr
  call void @intrinsic_print(ptr %t1725)
  %t1726 = load i64, ptr %local.conv_score.1360
  %t1727 = call i64 @"print_f64"(i64 %t1726)
  %t1728 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.267)
  %t1729 = ptrtoint ptr %t1728 to i64
  %t1730 = inttoptr i64 %t1729 to ptr
  call void @intrinsic_println(ptr %t1730)
  br label %then40_end
then40_end:
  br label %endif40
else40:
  br label %else40_end
else40_end:
  br label %endif40
endif40:
  %t1731 = phi i64 [ 0, %then40_end ], [ 0, %else40_end ]
  %t1732 = load i64, ptr %local.step.1353
  %t1733 = add i64 %t1732, 1
  store i64 %t1733, ptr %local.step.1353
  br label %loop35
endloop35:
  %t1734 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.268)
  %t1735 = ptrtoint ptr %t1734 to i64
  %t1736 = inttoptr i64 %t1735 to ptr
  call void @intrinsic_println(ptr %t1736)
  %t1737 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.269)
  %t1738 = ptrtoint ptr %t1737 to i64
  %t1739 = inttoptr i64 %t1738 to ptr
  call void @intrinsic_println(ptr %t1739)
  %t1740 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.270)
  %t1741 = ptrtoint ptr %t1740 to i64
  %t1742 = inttoptr i64 %t1741 to ptr
  call void @intrinsic_print(ptr %t1742)
  %t1743 = load i64, ptr %local.d1.1350
  %t1744 = load i64, ptr %local.d2.1351
  %t1745 = load i64, ptr %local.d3.1352
  %t1746 = call i64 @"decision_cosine"(i64 %t1743, i64 %t1744, i64 %t1745, i64 0, i64 0)
  %t1747 = call i64 @"print_f64"(i64 %t1746)
  %t1748 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.271)
  %t1749 = ptrtoint ptr %t1748 to i64
  %t1750 = inttoptr i64 %t1749 to ptr
  call void @intrinsic_print(ptr %t1750)
  %t1751 = load i64, ptr %local.d1.1350
  %t1752 = load i64, ptr %local.d2.1351
  %t1753 = load i64, ptr %local.d3.1352
  %t1754 = call i64 @"decision_cosine"(i64 %t1751, i64 %t1752, i64 %t1753, i64 0, i64 1)
  %t1755 = call i64 @"print_f64"(i64 %t1754)
  %t1756 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.272)
  %t1757 = ptrtoint ptr %t1756 to i64
  %t1758 = inttoptr i64 %t1757 to ptr
  call void @intrinsic_print(ptr %t1758)
  %t1759 = load i64, ptr %local.d1.1350
  %t1760 = load i64, ptr %local.d2.1351
  %t1761 = load i64, ptr %local.d3.1352
  %t1762 = call i64 @"decision_cosine"(i64 %t1759, i64 %t1760, i64 %t1761, i64 0, i64 2)
  %t1763 = call i64 @"print_f64"(i64 %t1762)
  %t1764 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.273)
  %t1765 = ptrtoint ptr %t1764 to i64
  %t1766 = inttoptr i64 %t1765 to ptr
  call void @intrinsic_println(ptr %t1766)
  %t1767 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.274)
  %t1768 = ptrtoint ptr %t1767 to i64
  %t1769 = inttoptr i64 %t1768 to ptr
  call void @intrinsic_print(ptr %t1769)
  %t1770 = load i64, ptr %local.d1.1350
  %t1771 = load i64, ptr %local.d2.1351
  %t1772 = load i64, ptr %local.d3.1352
  %t1773 = call i64 @"decision_cosine"(i64 %t1770, i64 %t1771, i64 %t1772, i64 1, i64 0)
  %t1774 = call i64 @"print_f64"(i64 %t1773)
  %t1775 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.275)
  %t1776 = ptrtoint ptr %t1775 to i64
  %t1777 = inttoptr i64 %t1776 to ptr
  call void @intrinsic_print(ptr %t1777)
  %t1778 = load i64, ptr %local.d1.1350
  %t1779 = load i64, ptr %local.d2.1351
  %t1780 = load i64, ptr %local.d3.1352
  %t1781 = call i64 @"decision_cosine"(i64 %t1778, i64 %t1779, i64 %t1780, i64 1, i64 1)
  %t1782 = call i64 @"print_f64"(i64 %t1781)
  %t1783 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.276)
  %t1784 = ptrtoint ptr %t1783 to i64
  %t1785 = inttoptr i64 %t1784 to ptr
  call void @intrinsic_print(ptr %t1785)
  %t1786 = load i64, ptr %local.d1.1350
  %t1787 = load i64, ptr %local.d2.1351
  %t1788 = load i64, ptr %local.d3.1352
  %t1789 = call i64 @"decision_cosine"(i64 %t1786, i64 %t1787, i64 %t1788, i64 1, i64 2)
  %t1790 = call i64 @"print_f64"(i64 %t1789)
  %t1791 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.277)
  %t1792 = ptrtoint ptr %t1791 to i64
  %t1793 = inttoptr i64 %t1792 to ptr
  call void @intrinsic_println(ptr %t1793)
  %t1794 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.278)
  %t1795 = ptrtoint ptr %t1794 to i64
  %t1796 = inttoptr i64 %t1795 to ptr
  call void @intrinsic_print(ptr %t1796)
  %t1797 = load i64, ptr %local.d1.1350
  %t1798 = load i64, ptr %local.d2.1351
  %t1799 = load i64, ptr %local.d3.1352
  %t1800 = call i64 @"decision_cosine"(i64 %t1797, i64 %t1798, i64 %t1799, i64 2, i64 0)
  %t1801 = call i64 @"print_f64"(i64 %t1800)
  %t1802 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.279)
  %t1803 = ptrtoint ptr %t1802 to i64
  %t1804 = inttoptr i64 %t1803 to ptr
  call void @intrinsic_print(ptr %t1804)
  %t1805 = load i64, ptr %local.d1.1350
  %t1806 = load i64, ptr %local.d2.1351
  %t1807 = load i64, ptr %local.d3.1352
  %t1808 = call i64 @"decision_cosine"(i64 %t1805, i64 %t1806, i64 %t1807, i64 2, i64 1)
  %t1809 = call i64 @"print_f64"(i64 %t1808)
  %t1810 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.280)
  %t1811 = ptrtoint ptr %t1810 to i64
  %t1812 = inttoptr i64 %t1811 to ptr
  call void @intrinsic_print(ptr %t1812)
  %t1813 = load i64, ptr %local.d1.1350
  %t1814 = load i64, ptr %local.d2.1351
  %t1815 = load i64, ptr %local.d3.1352
  %t1816 = call i64 @"decision_cosine"(i64 %t1813, i64 %t1814, i64 %t1815, i64 2, i64 2)
  %t1817 = call i64 @"print_f64"(i64 %t1816)
  %t1818 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.281)
  %t1819 = ptrtoint ptr %t1818 to i64
  %t1820 = inttoptr i64 %t1819 to ptr
  call void @intrinsic_println(ptr %t1820)
  %t1821 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.282)
  %t1822 = ptrtoint ptr %t1821 to i64
  %t1823 = inttoptr i64 %t1822 to ptr
  call void @intrinsic_println(ptr %t1823)
  %t1824 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.283)
  %t1825 = ptrtoint ptr %t1824 to i64
  %t1826 = inttoptr i64 %t1825 to ptr
  call void @intrinsic_print(ptr %t1826)
  %t1827 = load i64, ptr %local.d1.1350
  %t1828 = call i64 @"print_f64"(i64 %t1827)
  %t1829 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.284)
  %t1830 = ptrtoint ptr %t1829 to i64
  %t1831 = inttoptr i64 %t1830 to ptr
  call void @intrinsic_print(ptr %t1831)
  %t1832 = load i64, ptr %local.d2.1351
  %t1833 = call i64 @"print_f64"(i64 %t1832)
  %t1834 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.285)
  %t1835 = ptrtoint ptr %t1834 to i64
  %t1836 = inttoptr i64 %t1835 to ptr
  call void @intrinsic_print(ptr %t1836)
  %t1837 = load i64, ptr %local.d3.1352
  %t1838 = call i64 @"print_f64"(i64 %t1837)
  %t1839 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.286)
  %t1840 = ptrtoint ptr %t1839 to i64
  %t1841 = inttoptr i64 %t1840 to ptr
  call void @intrinsic_println(ptr %t1841)
  %t1842 = load i64, ptr %local.d1.1350
  %t1843 = load i64, ptr %local.d2.1351
  %t1844 = load i64, ptr %local.d3.1352
  %t1845 = call i64 @"total_cost"(i64 %t1842, i64 %t1843, i64 %t1844)
  store i64 %t1845, ptr %local.final_cost.1365
  %t1846 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.287)
  %t1847 = ptrtoint ptr %t1846 to i64
  %t1848 = inttoptr i64 %t1847 to ptr
  call void @intrinsic_print(ptr %t1848)
  %t1849 = load i64, ptr %local.final_cost.1365
  %t1850 = call i64 @"print_f64"(i64 %t1849)
  %t1851 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.288)
  %t1852 = ptrtoint ptr %t1851 to i64
  %t1853 = inttoptr i64 %t1852 to ptr
  call void @intrinsic_println(ptr %t1853)
  %t1854 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.289)
  %t1855 = ptrtoint ptr %t1854 to i64
  %t1856 = inttoptr i64 %t1855 to ptr
  call void @intrinsic_print(ptr %t1856)
  %t1857 = load i64, ptr %local.conv_score.1360
  %t1858 = call i64 @"print_f64"(i64 %t1857)
  %t1859 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.290)
  %t1860 = ptrtoint ptr %t1859 to i64
  %t1861 = inttoptr i64 %t1860 to ptr
  call void @intrinsic_println(ptr %t1861)
  %t1862 = load i64, ptr %local.conv_score.1360
  %t1863 = call i64 @f64_parse(ptr @.str.exp_code_gates.291)
  %t1864 = call i64 @"sx_f64_lt"(i64 %t1862, i64 %t1863)
  %t1865 = icmp ne i64 %t1864, 0
  br i1 %t1865, label %then41, label %else41
then41:
  %t1866 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.292)
  %t1867 = ptrtoint ptr %t1866 to i64
  %t1868 = inttoptr i64 %t1867 to ptr
  call void @intrinsic_println(ptr %t1868)
  br label %then41_end
then41_end:
  br label %endif41
else41:
  %t1869 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.293)
  %t1870 = ptrtoint ptr %t1869 to i64
  %t1871 = inttoptr i64 %t1870 to ptr
  call void @intrinsic_println(ptr %t1871)
  br label %else41_end
else41_end:
  br label %endif41
endif41:
  %t1872 = phi i64 [ 0, %then41_end ], [ 0, %else41_end ]
  %t1873 = load i64, ptr %local.final_cost.1365
  %t1874 = load i64, ptr %local.init_cost.1364
  %t1875 = call i64 @"sx_f64_lt"(i64 %t1873, i64 %t1874)
  %t1876 = icmp ne i64 %t1875, 0
  br i1 %t1876, label %then42, label %else42
then42:
  %t1877 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.294)
  %t1878 = ptrtoint ptr %t1877 to i64
  %t1879 = inttoptr i64 %t1878 to ptr
  call void @intrinsic_println(ptr %t1879)
  br label %then42_end
then42_end:
  br label %endif42
else42:
  br label %else42_end
else42_end:
  br label %endif42
endif42:
  %t1880 = phi i64 [ 0, %then42_end ], [ 0, %else42_end ]
  %t1881 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.295)
  %t1882 = ptrtoint ptr %t1881 to i64
  %t1883 = inttoptr i64 %t1882 to ptr
  call void @intrinsic_println(ptr %t1883)
  ret i64 0
}

define i64 @"simplex_main"() nounwind {
entry:
  %local.r1.1884 = alloca i64
  %local.r2.1885 = alloca i64
  %local.r3.1886 = alloca i64
  %t1887 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.296)
  %t1888 = ptrtoint ptr %t1887 to i64
  %t1889 = inttoptr i64 %t1888 to ptr
  call void @intrinsic_println(ptr %t1889)
  %t1890 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.297)
  %t1891 = ptrtoint ptr %t1890 to i64
  %t1892 = inttoptr i64 %t1891 to ptr
  call void @intrinsic_println(ptr %t1892)
  %t1893 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.298)
  %t1894 = ptrtoint ptr %t1893 to i64
  %t1895 = inttoptr i64 %t1894 to ptr
  call void @intrinsic_println(ptr %t1895)
  %t1896 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.299)
  %t1897 = ptrtoint ptr %t1896 to i64
  %t1898 = inttoptr i64 %t1897 to ptr
  call void @intrinsic_println(ptr %t1898)
  %t1899 = call i64 @"run_exp1"()
  store i64 %t1899, ptr %local.r1.1884
  %t1900 = call i64 @"run_exp2"()
  store i64 %t1900, ptr %local.r2.1885
  %t1901 = call i64 @"run_exp3"()
  store i64 %t1901, ptr %local.r3.1886
  %t1902 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.300)
  %t1903 = ptrtoint ptr %t1902 to i64
  %t1904 = inttoptr i64 %t1903 to ptr
  call void @intrinsic_println(ptr %t1904)
  %t1905 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.301)
  %t1906 = ptrtoint ptr %t1905 to i64
  %t1907 = inttoptr i64 %t1906 to ptr
  call void @intrinsic_println(ptr %t1907)
  %t1908 = call ptr @intrinsic_string_new(ptr @.str.exp_code_gates.302)
  %t1909 = ptrtoint ptr %t1908 to i64
  %t1910 = inttoptr i64 %t1909 to ptr
  call void @intrinsic_println(ptr %t1910)
  ret i64 0
}


; String constants
@.str.exp_code_gates.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.2 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_code_gates.3 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_code_gates.4 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.5 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.6 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_code_gates.7 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_code_gates.8 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_code_gates.9 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.10 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.11 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_code_gates.12 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_code_gates.13 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_code_gates.14 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_code_gates.15 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_code_gates.16 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_code_gates.17 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_code_gates.18 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_code_gates.19 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_code_gates.20 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_code_gates.21 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_code_gates.22 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_code_gates.23 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.24 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.25 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.26 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.27 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.28 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.29 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.30 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.31 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.32 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.33 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.34 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.35 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.36 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.37 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.38 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.39 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.40 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_code_gates.41 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_code_gates.42 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_code_gates.43 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_code_gates.44 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.45 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_code_gates.46 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_code_gates.47 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_code_gates.48 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_code_gates.49 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_code_gates.50 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_code_gates.51 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_code_gates.52 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_code_gates.53 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_code_gates.54 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_code_gates.55 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_code_gates.56 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_code_gates.57 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_code_gates.58 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_code_gates.59 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_code_gates.60 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_code_gates.61 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.62 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.63 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_code_gates.64 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_code_gates.65 = private unnamed_addr constant [47 x i8] c"  EXPERIMENT 1: Multi-Gate Conflict Resolution\00"
@.str.exp_code_gates.66 = private unnamed_addr constant [50 x i8] c"  Speed gate vs Accuracy gate on shared 4D params\00"
@.str.exp_code_gates.67 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_code_gates.68 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.69 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.70 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.71 = private unnamed_addr constant [31 x i8] c"  No projection:       loss = \00"
@.str.exp_code_gates.72 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.73 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_code_gates.74 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_code_gates.75 = private unnamed_addr constant [31 x i8] c"  Uniform (alpha=1.0): loss = \00"
@.str.exp_code_gates.76 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.77 = private unnamed_addr constant [31 x i8] c"  Initial (alpha=0.5): loss = \00"
@.str.exp_code_gates.78 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.79 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.80 = private unnamed_addr constant [40 x i8] c"  Cycle  Loss       alpha_ab   alpha_ba\00"
@.str.exp_code_gates.81 = private unnamed_addr constant [41 x i8] c"  -----  ---------  ---------  ---------\00"
@.str.exp_code_gates.82 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.83 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_code_gates.84 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.85 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_code_gates.86 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_code_gates.87 = private unnamed_addr constant [7 x i8] c"      \00"
@.str.exp_code_gates.88 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_code_gates.89 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_code_gates.90 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.91 = private unnamed_addr constant [10 x i8] c"  14     \00"
@.str.exp_code_gates.92 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_code_gates.93 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_code_gates.94 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.95 = private unnamed_addr constant [10 x i8] c"  29     \00"
@.str.exp_code_gates.96 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_code_gates.97 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_code_gates.98 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.99 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.100 = private unnamed_addr constant [22 x i8] c"  Learned alpha_ab = \00"
@.str.exp_code_gates.101 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.102 = private unnamed_addr constant [22 x i8] c"  Learned alpha_ba = \00"
@.str.exp_code_gates.103 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.104 = private unnamed_addr constant [25 x i8] c"  Final combined loss = \00"
@.str.exp_code_gates.105 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.106 = private unnamed_addr constant [49 x i8] c"  RESULT: Learned projection BEATS no-projection\00"
@.str.exp_code_gates.107 = private unnamed_addr constant [44 x i8] c"  RESULT: No improvement over no-projection\00"
@.str.exp_code_gates.108 = private unnamed_addr constant [54 x i8] c"  RESULT: Learned projection BEATS uniform projection\00"
@.str.exp_code_gates.109 = private unnamed_addr constant [33 x i8] c"  RESULT: Uniform is competitive\00"
@.str.exp_code_gates.110 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.111 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_code_gates.112 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_code_gates.113 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_code_gates.114 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_code_gates.115 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_code_gates.116 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_code_gates.117 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_code_gates.118 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.119 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.120 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.121 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.122 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.123 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.124 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.125 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_code_gates.126 = private unnamed_addr constant [9 x i8] c"999999.0\00"
@.str.exp_code_gates.127 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_code_gates.128 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_code_gates.129 = private unnamed_addr constant [52 x i8] c"  EXPERIMENT 2: Deterministic vs Learnable Decision\00"
@.str.exp_code_gates.130 = private unnamed_addr constant [52 x i8] c"  100 random inputs, theta blends path_a and path_b\00"
@.str.exp_code_gates.131 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_code_gates.132 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.133 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.134 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_code_gates.135 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_code_gates.136 = private unnamed_addr constant [29 x i8] c"  Deterministic total loss: \00"
@.str.exp_code_gates.137 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.138 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.139 = private unnamed_addr constant [31 x i8] c"  Epoch  theta      learn_loss\00"
@.str.exp_code_gates.140 = private unnamed_addr constant [31 x i8] c"  -----  ---------  ----------\00"
@.str.exp_code_gates.141 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_code_gates.142 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.143 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.144 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_code_gates.145 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_code_gates.146 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_code_gates.147 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_code_gates.148 = private unnamed_addr constant [7 x i8] c"      \00"
@.str.exp_code_gates.149 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_code_gates.150 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.151 = private unnamed_addr constant [10 x i8] c"  9      \00"
@.str.exp_code_gates.152 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_code_gates.153 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.154 = private unnamed_addr constant [10 x i8] c"  19     \00"
@.str.exp_code_gates.155 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_code_gates.156 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.157 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.158 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_code_gates.159 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.160 = private unnamed_addr constant [16 x i8] c"  Best theta = \00"
@.str.exp_code_gates.161 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.162 = private unnamed_addr constant [25 x i8] c"  Best learnable loss = \00"
@.str.exp_code_gates.163 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.164 = private unnamed_addr constant [25 x i8] c"  Deterministic loss  = \00"
@.str.exp_code_gates.165 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.166 = private unnamed_addr constant [46 x i8] c"  RESULT: Learnable theta beats deterministic\00"
@.str.exp_code_gates.167 = private unnamed_addr constant [33 x i8] c"  RESULT: Deterministic wins by \00"
@.str.exp_code_gates.168 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.169 = private unnamed_addr constant [47 x i8] c"  (Expected: per-input min beats global blend)\00"
@.str.exp_code_gates.170 = private unnamed_addr constant [52 x i8] c"  Gradient reveals optimal bias direction via theta\00"
@.str.exp_code_gates.171 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.172 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_code_gates.173 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_code_gates.174 = private unnamed_addr constant [4 x i8] c"2.5\00"
@.str.exp_code_gates.175 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_code_gates.176 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_code_gates.177 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_code_gates.178 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_code_gates.179 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_code_gates.180 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_code_gates.181 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.182 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.183 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_code_gates.184 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_code_gates.185 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.186 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.187 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_code_gates.188 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_code_gates.189 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.190 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.191 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_code_gates.192 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_code_gates.193 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_code_gates.194 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_code_gates.195 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_code_gates.196 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_code_gates.197 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_code_gates.198 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.199 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.200 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.201 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_code_gates.202 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_code_gates.203 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_code_gates.204 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.205 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.206 = private unnamed_addr constant [5 x i8] c"0.02\00"
@.str.exp_code_gates.207 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_code_gates.208 = private unnamed_addr constant [56 x i8] c"  EXPERIMENT 3: Convergence of Code Structure Decisions\00"
@.str.exp_code_gates.209 = private unnamed_addr constant [54 x i8] c"  d1=inline/call, d2=unroll/loop, d3=vectorise/scalar\00"
@.str.exp_code_gates.210 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_code_gates.211 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.212 = private unnamed_addr constant [32 x i8] c"  Initial cost (d1=d2=d3=0.5): \00"
@.str.exp_code_gates.213 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.214 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.215 = private unnamed_addr constant [61 x i8] c"  Initial 3x3 interaction matrix (cosine of gradient pairs):\00"
@.str.exp_code_gates.216 = private unnamed_addr constant [18 x i8] c"    cos(d1,d1) = \00"
@.str.exp_code_gates.217 = private unnamed_addr constant [16 x i8] c"  cos(d1,d2) = \00"
@.str.exp_code_gates.218 = private unnamed_addr constant [16 x i8] c"  cos(d1,d3) = \00"
@.str.exp_code_gates.219 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.220 = private unnamed_addr constant [18 x i8] c"    cos(d2,d1) = \00"
@.str.exp_code_gates.221 = private unnamed_addr constant [16 x i8] c"  cos(d2,d2) = \00"
@.str.exp_code_gates.222 = private unnamed_addr constant [16 x i8] c"  cos(d2,d3) = \00"
@.str.exp_code_gates.223 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.224 = private unnamed_addr constant [18 x i8] c"    cos(d3,d1) = \00"
@.str.exp_code_gates.225 = private unnamed_addr constant [16 x i8] c"  cos(d3,d2) = \00"
@.str.exp_code_gates.226 = private unnamed_addr constant [16 x i8] c"  cos(d3,d3) = \00"
@.str.exp_code_gates.227 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.228 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.229 = private unnamed_addr constant [54 x i8] c"  Step   d1        d2        d3        cost      S(t)\00"
@.str.exp_code_gates.230 = private unnamed_addr constant [58 x i8] c"  -----  --------  --------  --------  --------  --------\00"
@.str.exp_code_gates.231 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.232 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_code_gates.233 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.234 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_code_gates.235 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_code_gates.236 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_code_gates.237 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_code_gates.238 = private unnamed_addr constant [7 x i8] c"      \00"
@.str.exp_code_gates.239 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_code_gates.240 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_code_gates.241 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_code_gates.242 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_code_gates.243 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.244 = private unnamed_addr constant [10 x i8] c"  10     \00"
@.str.exp_code_gates.245 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_code_gates.246 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_code_gates.247 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_code_gates.248 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_code_gates.249 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.250 = private unnamed_addr constant [10 x i8] c"  25     \00"
@.str.exp_code_gates.251 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_code_gates.252 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_code_gates.253 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_code_gates.254 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_code_gates.255 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.256 = private unnamed_addr constant [10 x i8] c"  50     \00"
@.str.exp_code_gates.257 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_code_gates.258 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_code_gates.259 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_code_gates.260 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_code_gates.261 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.262 = private unnamed_addr constant [10 x i8] c"  99     \00"
@.str.exp_code_gates.263 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_code_gates.264 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_code_gates.265 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_code_gates.266 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_code_gates.267 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.268 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.269 = private unnamed_addr constant [32 x i8] c"  Final 3x3 interaction matrix:\00"
@.str.exp_code_gates.270 = private unnamed_addr constant [18 x i8] c"    cos(d1,d1) = \00"
@.str.exp_code_gates.271 = private unnamed_addr constant [16 x i8] c"  cos(d1,d2) = \00"
@.str.exp_code_gates.272 = private unnamed_addr constant [16 x i8] c"  cos(d1,d3) = \00"
@.str.exp_code_gates.273 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.274 = private unnamed_addr constant [18 x i8] c"    cos(d2,d1) = \00"
@.str.exp_code_gates.275 = private unnamed_addr constant [16 x i8] c"  cos(d2,d2) = \00"
@.str.exp_code_gates.276 = private unnamed_addr constant [16 x i8] c"  cos(d2,d3) = \00"
@.str.exp_code_gates.277 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.278 = private unnamed_addr constant [18 x i8] c"    cos(d3,d1) = \00"
@.str.exp_code_gates.279 = private unnamed_addr constant [16 x i8] c"  cos(d3,d2) = \00"
@.str.exp_code_gates.280 = private unnamed_addr constant [16 x i8] c"  cos(d3,d3) = \00"
@.str.exp_code_gates.281 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.282 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.283 = private unnamed_addr constant [23 x i8] c"  Final decisions: d1=\00"
@.str.exp_code_gates.284 = private unnamed_addr constant [6 x i8] c"  d2=\00"
@.str.exp_code_gates.285 = private unnamed_addr constant [6 x i8] c"  d3=\00"
@.str.exp_code_gates.286 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.287 = private unnamed_addr constant [15 x i8] c"  Final cost: \00"
@.str.exp_code_gates.288 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.289 = private unnamed_addr constant [15 x i8] c"  Final S(t): \00"
@.str.exp_code_gates.290 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.291 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_code_gates.292 = private unnamed_addr constant [39 x i8] c"  RESULT: Decisions CONVERGED (S -> 0)\00"
@.str.exp_code_gates.293 = private unnamed_addr constant [35 x i8] c"  RESULT: Decisions still drifting\00"
@.str.exp_code_gates.294 = private unnamed_addr constant [37 x i8] c"  RESULT: Cost improved from initial\00"
@.str.exp_code_gates.295 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.296 = private unnamed_addr constant [65 x i8] c"################################################################\00"
@.str.exp_code_gates.297 = private unnamed_addr constant [65 x i8] c"#  Geometric Contraction Framework: Code Optimisation Gates    #\00"
@.str.exp_code_gates.298 = private unnamed_addr constant [65 x i8] c"################################################################\00"
@.str.exp_code_gates.299 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_code_gates.300 = private unnamed_addr constant [65 x i8] c"================================================================\00"
@.str.exp_code_gates.301 = private unnamed_addr constant [27 x i8] c"  ALL EXPERIMENTS COMPLETE\00"
@.str.exp_code_gates.302 = private unnamed_addr constant [65 x i8] c"================================================================\00"
