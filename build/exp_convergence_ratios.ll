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
  %t1 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
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
  %t9 = load i64, ptr %local.a0
  %t10 = load i64, ptr %local.b0
  %t11 = call i64 @"sx_f64_mul"(i64 %t9, i64 %t10)
  %t12 = load i64, ptr %local.a1
  %t13 = load i64, ptr %local.b1
  %t14 = call i64 @"sx_f64_mul"(i64 %t12, i64 %t13)
  %t15 = call i64 @"sx_f64_add"(i64 %t11, i64 %t14)
  %t16 = load i64, ptr %local.a2
  %t17 = load i64, ptr %local.b2
  %t18 = call i64 @"sx_f64_mul"(i64 %t16, i64 %t17)
  %t19 = call i64 @"sx_f64_add"(i64 %t15, i64 %t18)
  %t20 = load i64, ptr %local.a3
  %t21 = load i64, ptr %local.b3
  %t22 = call i64 @"sx_f64_mul"(i64 %t20, i64 %t21)
  %t23 = call i64 @"sx_f64_add"(i64 %t19, i64 %t22)
  ret i64 %t23
}

define i64 @"cosine4"(i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %b0, i64 %b1, i64 %b2, i64 %b3) nounwind {
entry:
  %local.d.24 = alloca i64
  %local.na.25 = alloca i64
  %local.nb.26 = alloca i64
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
  %t27 = load i64, ptr %local.a0
  %t28 = load i64, ptr %local.a1
  %t29 = load i64, ptr %local.a2
  %t30 = load i64, ptr %local.a3
  %t31 = load i64, ptr %local.b0
  %t32 = load i64, ptr %local.b1
  %t33 = load i64, ptr %local.b2
  %t34 = load i64, ptr %local.b3
  %t35 = call i64 @"dot4"(i64 %t27, i64 %t28, i64 %t29, i64 %t30, i64 %t31, i64 %t32, i64 %t33, i64 %t34)
  store i64 %t35, ptr %local.d.24
  %t36 = load i64, ptr %local.a0
  %t37 = load i64, ptr %local.a1
  %t38 = load i64, ptr %local.a2
  %t39 = load i64, ptr %local.a3
  %t40 = load i64, ptr %local.a0
  %t41 = load i64, ptr %local.a1
  %t42 = load i64, ptr %local.a2
  %t43 = load i64, ptr %local.a3
  %t44 = call i64 @"dot4"(i64 %t36, i64 %t37, i64 %t38, i64 %t39, i64 %t40, i64 %t41, i64 %t42, i64 %t43)
  %t45 = call i64 @"sqrt_f64"(i64 %t44)
  store i64 %t45, ptr %local.na.25
  %t46 = load i64, ptr %local.b0
  %t47 = load i64, ptr %local.b1
  %t48 = load i64, ptr %local.b2
  %t49 = load i64, ptr %local.b3
  %t50 = load i64, ptr %local.b0
  %t51 = load i64, ptr %local.b1
  %t52 = load i64, ptr %local.b2
  %t53 = load i64, ptr %local.b3
  %t54 = call i64 @"dot4"(i64 %t46, i64 %t47, i64 %t48, i64 %t49, i64 %t50, i64 %t51, i64 %t52, i64 %t53)
  %t55 = call i64 @"sqrt_f64"(i64 %t54)
  store i64 %t55, ptr %local.nb.26
  %t56 = load i64, ptr %local.d.24
  %t57 = load i64, ptr %local.na.25
  %t58 = load i64, ptr %local.nb.26
  %t59 = call i64 @"sx_f64_mul"(i64 %t57, i64 %t58)
  %t60 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.2)
  %t61 = call i64 @"sx_f64_add"(i64 %t59, i64 %t60)
  %t62 = call i64 @"sx_f64_div"(i64 %t56, i64 %t61)
  ret i64 %t62
}

define i64 @"project_dim"(i64 %gi, i64 %gj_0, i64 %gj_1, i64 %gj_2, i64 %gj_3, i64 %gi_0, i64 %gi_1, i64 %gi_2, i64 %gi_3, i64 %alpha, i64 %dim) nounwind {
entry:
  %local.cos_val.63 = alloca i64
  %local.scale.64 = alloca i64
  %local.gj_sq.65 = alloca i64
  %local.proj.66 = alloca i64
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
  %t67 = load i64, ptr %local.gi_0
  %t68 = load i64, ptr %local.gi_1
  %t69 = load i64, ptr %local.gi_2
  %t70 = load i64, ptr %local.gi_3
  %t71 = load i64, ptr %local.gj_0
  %t72 = load i64, ptr %local.gj_1
  %t73 = load i64, ptr %local.gj_2
  %t74 = load i64, ptr %local.gj_3
  %t75 = call i64 @"cosine4"(i64 %t67, i64 %t68, i64 %t69, i64 %t70, i64 %t71, i64 %t72, i64 %t73, i64 %t74)
  store i64 %t75, ptr %local.cos_val.63
  %t76 = load i64, ptr %local.cos_val.63
  %t77 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.3)
  %t78 = call i64 @"sx_f64_ge"(i64 %t76, i64 %t77)
  %t79 = icmp ne i64 %t78, 0
  br i1 %t79, label %then1, label %else1
then1:
  %t80 = load i64, ptr %local.gi
  ret i64 %t80
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t81 = phi i64 [ 0, %else1_end ]
  %t82 = load i64, ptr %local.alpha
  %t83 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.4)
  %t84 = load i64, ptr %local.cos_val.63
  %t85 = call i64 @"sx_f64_sub"(i64 %t83, i64 %t84)
  %t86 = call i64 @"sx_f64_mul"(i64 %t82, i64 %t85)
  store i64 %t86, ptr %local.scale.64
  %t87 = load i64, ptr %local.gj_0
  %t88 = load i64, ptr %local.gj_1
  %t89 = load i64, ptr %local.gj_2
  %t90 = load i64, ptr %local.gj_3
  %t91 = load i64, ptr %local.gj_0
  %t92 = load i64, ptr %local.gj_1
  %t93 = load i64, ptr %local.gj_2
  %t94 = load i64, ptr %local.gj_3
  %t95 = call i64 @"dot4"(i64 %t87, i64 %t88, i64 %t89, i64 %t90, i64 %t91, i64 %t92, i64 %t93, i64 %t94)
  %t96 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.5)
  %t97 = call i64 @"sx_f64_add"(i64 %t95, i64 %t96)
  store i64 %t97, ptr %local.gj_sq.65
  %t98 = load i64, ptr %local.scale.64
  %t99 = load i64, ptr %local.gi_0
  %t100 = load i64, ptr %local.gi_1
  %t101 = load i64, ptr %local.gi_2
  %t102 = load i64, ptr %local.gi_3
  %t103 = load i64, ptr %local.gj_0
  %t104 = load i64, ptr %local.gj_1
  %t105 = load i64, ptr %local.gj_2
  %t106 = load i64, ptr %local.gj_3
  %t107 = call i64 @"dot4"(i64 %t99, i64 %t100, i64 %t101, i64 %t102, i64 %t103, i64 %t104, i64 %t105, i64 %t106)
  %t108 = call i64 @"sx_f64_mul"(i64 %t98, i64 %t107)
  %t109 = load i64, ptr %local.gj_sq.65
  %t110 = call i64 @"sx_f64_div"(i64 %t108, i64 %t109)
  store i64 %t110, ptr %local.proj.66
  %t111 = load i64, ptr %local.dim
  %t112 = icmp eq i64 %t111, 0
  %t113 = zext i1 %t112 to i64
  %t114 = icmp ne i64 %t113, 0
  br i1 %t114, label %then2, label %else2
then2:
  %t115 = load i64, ptr %local.gi
  %t116 = load i64, ptr %local.proj.66
  %t117 = load i64, ptr %local.gj_0
  %t118 = call i64 @"sx_f64_mul"(i64 %t116, i64 %t117)
  %t119 = call i64 @"sx_f64_sub"(i64 %t115, i64 %t118)
  br label %then2_end
then2_end:
  br label %endif2
else2:
  %t120 = load i64, ptr %local.dim
  %t121 = icmp eq i64 %t120, 1
  %t122 = zext i1 %t121 to i64
  %t123 = icmp ne i64 %t122, 0
  br i1 %t123, label %then3, label %else3
then3:
  %t124 = load i64, ptr %local.gi
  %t125 = load i64, ptr %local.proj.66
  %t126 = load i64, ptr %local.gj_1
  %t127 = call i64 @"sx_f64_mul"(i64 %t125, i64 %t126)
  %t128 = call i64 @"sx_f64_sub"(i64 %t124, i64 %t127)
  br label %then3_end
then3_end:
  br label %endif3
else3:
  %t129 = load i64, ptr %local.dim
  %t130 = icmp eq i64 %t129, 2
  %t131 = zext i1 %t130 to i64
  %t132 = icmp ne i64 %t131, 0
  br i1 %t132, label %then4, label %else4
then4:
  %t133 = load i64, ptr %local.gi
  %t134 = load i64, ptr %local.proj.66
  %t135 = load i64, ptr %local.gj_2
  %t136 = call i64 @"sx_f64_mul"(i64 %t134, i64 %t135)
  %t137 = call i64 @"sx_f64_sub"(i64 %t133, i64 %t136)
  br label %then4_end
then4_end:
  br label %endif4
else4:
  %t138 = load i64, ptr %local.gi
  %t139 = load i64, ptr %local.proj.66
  %t140 = load i64, ptr %local.gj_3
  %t141 = call i64 @"sx_f64_mul"(i64 %t139, i64 %t140)
  %t142 = call i64 @"sx_f64_sub"(i64 %t138, i64 %t141)
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t143 = phi i64 [ %t137, %then4_end ], [ %t142, %else4_end ]
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t144 = phi i64 [ %t128, %then3_end ], [ %t143, %else3_end ]
  br label %else2_end
else2_end:
  br label %endif2
endif2:
  %t145 = phi i64 [ %t119, %then2_end ], [ %t144, %else2_end ]
  ret i64 %t145
}

define i64 @"clamp"(i64 %x, i64 %lo, i64 %hi) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %local.lo = alloca i64
  store i64 %lo, ptr %local.lo
  %local.hi = alloca i64
  store i64 %hi, ptr %local.hi
  %t146 = load i64, ptr %local.x
  %t147 = load i64, ptr %local.lo
  %t148 = call i64 @"sx_f64_lt"(i64 %t146, i64 %t147)
  %t149 = icmp ne i64 %t148, 0
  br i1 %t149, label %then5, label %else5
then5:
  %t150 = load i64, ptr %local.lo
  ret i64 %t150
else5:
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t151 = phi i64 [ 0, %else5_end ]
  %t152 = load i64, ptr %local.x
  %t153 = load i64, ptr %local.hi
  %t154 = call i64 @"sx_f64_gt"(i64 %t152, i64 %t153)
  %t155 = icmp ne i64 %t154, 0
  br i1 %t155, label %then6, label %else6
then6:
  %t156 = load i64, ptr %local.hi
  ret i64 %t156
else6:
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t157 = phi i64 [ 0, %else6_end ]
  %t158 = load i64, ptr %local.x
  ret i64 %t158
}

define i64 @"run_cycle_p"(i64 %alpha_ab, i64 %alpha_ac, i64 %alpha_ba, i64 %alpha_bc, i64 %alpha_ca, i64 %alpha_cb, i64 %ta0, i64 %ta1, i64 %ta2, i64 %ta3, i64 %tb0, i64 %tb1, i64 %tb2, i64 %tb3, i64 %tc0, i64 %tc1, i64 %tc2, i64 %tc3, i64 %steps) nounwind {
entry:
  %local.w0.159 = alloca i64
  %local.w1.160 = alloca i64
  %local.w2.161 = alloca i64
  %local.w3.162 = alloca i64
  %local.step.163 = alloca i64
  %local.ga_0.164 = alloca i64
  %local.ga_1.165 = alloca i64
  %local.ga_2.166 = alloca i64
  %local.ga_3.167 = alloca i64
  %local.gb_0.168 = alloca i64
  %local.gb_1.169 = alloca i64
  %local.gb_2.170 = alloca i64
  %local.gb_3.171 = alloca i64
  %local.gc_0.172 = alloca i64
  %local.gc_1.173 = alloca i64
  %local.gc_2.174 = alloca i64
  %local.gc_3.175 = alloca i64
  %local.ra_0.176 = alloca i64
  %local.ra_1.177 = alloca i64
  %local.ra_2.178 = alloca i64
  %local.ra_3.179 = alloca i64
  %local.rb_0.180 = alloca i64
  %local.rb_1.181 = alloca i64
  %local.rb_2.182 = alloca i64
  %local.rb_3.183 = alloca i64
  %local.rc_0.184 = alloca i64
  %local.rc_1.185 = alloca i64
  %local.rc_2.186 = alloca i64
  %local.rc_3.187 = alloca i64
  %local.lr.188 = alloca i64
  %local.da0.189 = alloca i64
  %local.da1.190 = alloca i64
  %local.da2.191 = alloca i64
  %local.da3.192 = alloca i64
  %local.db0.193 = alloca i64
  %local.db1.194 = alloca i64
  %local.db2.195 = alloca i64
  %local.db3.196 = alloca i64
  %local.dc0.197 = alloca i64
  %local.dc1.198 = alloca i64
  %local.dc2.199 = alloca i64
  %local.dc3.200 = alloca i64
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
  %local.ta0 = alloca i64
  store i64 %ta0, ptr %local.ta0
  %local.ta1 = alloca i64
  store i64 %ta1, ptr %local.ta1
  %local.ta2 = alloca i64
  store i64 %ta2, ptr %local.ta2
  %local.ta3 = alloca i64
  store i64 %ta3, ptr %local.ta3
  %local.tb0 = alloca i64
  store i64 %tb0, ptr %local.tb0
  %local.tb1 = alloca i64
  store i64 %tb1, ptr %local.tb1
  %local.tb2 = alloca i64
  store i64 %tb2, ptr %local.tb2
  %local.tb3 = alloca i64
  store i64 %tb3, ptr %local.tb3
  %local.tc0 = alloca i64
  store i64 %tc0, ptr %local.tc0
  %local.tc1 = alloca i64
  store i64 %tc1, ptr %local.tc1
  %local.tc2 = alloca i64
  store i64 %tc2, ptr %local.tc2
  %local.tc3 = alloca i64
  store i64 %tc3, ptr %local.tc3
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %t201 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.6)
  store i64 %t201, ptr %local.w0.159
  %t202 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.7)
  store i64 %t202, ptr %local.w1.160
  %t203 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.8)
  store i64 %t203, ptr %local.w2.161
  %t204 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.9)
  store i64 %t204, ptr %local.w3.162
  store i64 0, ptr %local.step.163
  %t205 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.10)
  store i64 %t205, ptr %local.ga_0.164
  %t206 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.11)
  store i64 %t206, ptr %local.ga_1.165
  %t207 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.12)
  store i64 %t207, ptr %local.ga_2.166
  %t208 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.13)
  store i64 %t208, ptr %local.ga_3.167
  %t209 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.14)
  store i64 %t209, ptr %local.gb_0.168
  %t210 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.15)
  store i64 %t210, ptr %local.gb_1.169
  %t211 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.16)
  store i64 %t211, ptr %local.gb_2.170
  %t212 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.17)
  store i64 %t212, ptr %local.gb_3.171
  %t213 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.18)
  store i64 %t213, ptr %local.gc_0.172
  %t214 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.19)
  store i64 %t214, ptr %local.gc_1.173
  %t215 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.20)
  store i64 %t215, ptr %local.gc_2.174
  %t216 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.21)
  store i64 %t216, ptr %local.gc_3.175
  %t217 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.22)
  store i64 %t217, ptr %local.ra_0.176
  %t218 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.23)
  store i64 %t218, ptr %local.ra_1.177
  %t219 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.24)
  store i64 %t219, ptr %local.ra_2.178
  %t220 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.25)
  store i64 %t220, ptr %local.ra_3.179
  %t221 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.26)
  store i64 %t221, ptr %local.rb_0.180
  %t222 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.27)
  store i64 %t222, ptr %local.rb_1.181
  %t223 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.28)
  store i64 %t223, ptr %local.rb_2.182
  %t224 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.29)
  store i64 %t224, ptr %local.rb_3.183
  %t225 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.30)
  store i64 %t225, ptr %local.rc_0.184
  %t226 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.31)
  store i64 %t226, ptr %local.rc_1.185
  %t227 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.32)
  store i64 %t227, ptr %local.rc_2.186
  %t228 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.33)
  store i64 %t228, ptr %local.rc_3.187
  %t229 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.34)
  store i64 %t229, ptr %local.lr.188
  br label %loop7
loop7:
  %t230 = load i64, ptr %local.step.163
  %t231 = load i64, ptr %local.steps
  %t232 = icmp slt i64 %t230, %t231
  %t233 = zext i1 %t232 to i64
  %t234 = icmp ne i64 %t233, 0
  br i1 %t234, label %body7, label %endloop7
body7:
  %t235 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.35)
  %t236 = load i64, ptr %local.w0.159
  %t237 = load i64, ptr %local.ta0
  %t238 = call i64 @"sx_f64_sub"(i64 %t236, i64 %t237)
  %t239 = call i64 @"sx_f64_mul"(i64 %t235, i64 %t238)
  store i64 %t239, ptr %local.ga_0.164
  %t240 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.36)
  %t241 = load i64, ptr %local.w1.160
  %t242 = load i64, ptr %local.ta1
  %t243 = call i64 @"sx_f64_sub"(i64 %t241, i64 %t242)
  %t244 = call i64 @"sx_f64_mul"(i64 %t240, i64 %t243)
  store i64 %t244, ptr %local.ga_1.165
  %t245 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.37)
  %t246 = load i64, ptr %local.w2.161
  %t247 = load i64, ptr %local.ta2
  %t248 = call i64 @"sx_f64_sub"(i64 %t246, i64 %t247)
  %t249 = call i64 @"sx_f64_mul"(i64 %t245, i64 %t248)
  store i64 %t249, ptr %local.ga_2.166
  %t250 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.38)
  %t251 = load i64, ptr %local.w3.162
  %t252 = load i64, ptr %local.ta3
  %t253 = call i64 @"sx_f64_sub"(i64 %t251, i64 %t252)
  %t254 = call i64 @"sx_f64_mul"(i64 %t250, i64 %t253)
  store i64 %t254, ptr %local.ga_3.167
  %t255 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.39)
  %t256 = load i64, ptr %local.w0.159
  %t257 = load i64, ptr %local.tb0
  %t258 = call i64 @"sx_f64_sub"(i64 %t256, i64 %t257)
  %t259 = call i64 @"sx_f64_mul"(i64 %t255, i64 %t258)
  store i64 %t259, ptr %local.gb_0.168
  %t260 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.40)
  %t261 = load i64, ptr %local.w1.160
  %t262 = load i64, ptr %local.tb1
  %t263 = call i64 @"sx_f64_sub"(i64 %t261, i64 %t262)
  %t264 = call i64 @"sx_f64_mul"(i64 %t260, i64 %t263)
  store i64 %t264, ptr %local.gb_1.169
  %t265 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.41)
  %t266 = load i64, ptr %local.w2.161
  %t267 = load i64, ptr %local.tb2
  %t268 = call i64 @"sx_f64_sub"(i64 %t266, i64 %t267)
  %t269 = call i64 @"sx_f64_mul"(i64 %t265, i64 %t268)
  store i64 %t269, ptr %local.gb_2.170
  %t270 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.42)
  %t271 = load i64, ptr %local.w3.162
  %t272 = load i64, ptr %local.tb3
  %t273 = call i64 @"sx_f64_sub"(i64 %t271, i64 %t272)
  %t274 = call i64 @"sx_f64_mul"(i64 %t270, i64 %t273)
  store i64 %t274, ptr %local.gb_3.171
  %t275 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.43)
  %t276 = load i64, ptr %local.w0.159
  %t277 = load i64, ptr %local.tc0
  %t278 = call i64 @"sx_f64_sub"(i64 %t276, i64 %t277)
  %t279 = call i64 @"sx_f64_mul"(i64 %t275, i64 %t278)
  store i64 %t279, ptr %local.gc_0.172
  %t280 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.44)
  %t281 = load i64, ptr %local.w1.160
  %t282 = load i64, ptr %local.tc1
  %t283 = call i64 @"sx_f64_sub"(i64 %t281, i64 %t282)
  %t284 = call i64 @"sx_f64_mul"(i64 %t280, i64 %t283)
  store i64 %t284, ptr %local.gc_1.173
  %t285 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.45)
  %t286 = load i64, ptr %local.w2.161
  %t287 = load i64, ptr %local.tc2
  %t288 = call i64 @"sx_f64_sub"(i64 %t286, i64 %t287)
  %t289 = call i64 @"sx_f64_mul"(i64 %t285, i64 %t288)
  store i64 %t289, ptr %local.gc_2.174
  %t290 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.46)
  %t291 = load i64, ptr %local.w3.162
  %t292 = load i64, ptr %local.tc3
  %t293 = call i64 @"sx_f64_sub"(i64 %t291, i64 %t292)
  %t294 = call i64 @"sx_f64_mul"(i64 %t290, i64 %t293)
  store i64 %t294, ptr %local.gc_3.175
  %t295 = load i64, ptr %local.ga_0.164
  %t296 = load i64, ptr %local.gb_0.168
  %t297 = load i64, ptr %local.gb_1.169
  %t298 = load i64, ptr %local.gb_2.170
  %t299 = load i64, ptr %local.gb_3.171
  %t300 = load i64, ptr %local.ga_0.164
  %t301 = load i64, ptr %local.ga_1.165
  %t302 = load i64, ptr %local.ga_2.166
  %t303 = load i64, ptr %local.ga_3.167
  %t304 = load i64, ptr %local.alpha_ab
  %t305 = call i64 @"project_dim"(i64 %t295, i64 %t296, i64 %t297, i64 %t298, i64 %t299, i64 %t300, i64 %t301, i64 %t302, i64 %t303, i64 %t304, i64 0)
  store i64 %t305, ptr %local.ra_0.176
  %t306 = load i64, ptr %local.ra_0.176
  %t307 = load i64, ptr %local.gc_0.172
  %t308 = load i64, ptr %local.gc_1.173
  %t309 = load i64, ptr %local.gc_2.174
  %t310 = load i64, ptr %local.gc_3.175
  %t311 = load i64, ptr %local.ga_0.164
  %t312 = load i64, ptr %local.ga_1.165
  %t313 = load i64, ptr %local.ga_2.166
  %t314 = load i64, ptr %local.ga_3.167
  %t315 = load i64, ptr %local.alpha_ac
  %t316 = call i64 @"project_dim"(i64 %t306, i64 %t307, i64 %t308, i64 %t309, i64 %t310, i64 %t311, i64 %t312, i64 %t313, i64 %t314, i64 %t315, i64 0)
  store i64 %t316, ptr %local.ra_0.176
  %t317 = load i64, ptr %local.ga_1.165
  %t318 = load i64, ptr %local.gb_0.168
  %t319 = load i64, ptr %local.gb_1.169
  %t320 = load i64, ptr %local.gb_2.170
  %t321 = load i64, ptr %local.gb_3.171
  %t322 = load i64, ptr %local.ga_0.164
  %t323 = load i64, ptr %local.ga_1.165
  %t324 = load i64, ptr %local.ga_2.166
  %t325 = load i64, ptr %local.ga_3.167
  %t326 = load i64, ptr %local.alpha_ab
  %t327 = call i64 @"project_dim"(i64 %t317, i64 %t318, i64 %t319, i64 %t320, i64 %t321, i64 %t322, i64 %t323, i64 %t324, i64 %t325, i64 %t326, i64 1)
  store i64 %t327, ptr %local.ra_1.177
  %t328 = load i64, ptr %local.ra_1.177
  %t329 = load i64, ptr %local.gc_0.172
  %t330 = load i64, ptr %local.gc_1.173
  %t331 = load i64, ptr %local.gc_2.174
  %t332 = load i64, ptr %local.gc_3.175
  %t333 = load i64, ptr %local.ga_0.164
  %t334 = load i64, ptr %local.ga_1.165
  %t335 = load i64, ptr %local.ga_2.166
  %t336 = load i64, ptr %local.ga_3.167
  %t337 = load i64, ptr %local.alpha_ac
  %t338 = call i64 @"project_dim"(i64 %t328, i64 %t329, i64 %t330, i64 %t331, i64 %t332, i64 %t333, i64 %t334, i64 %t335, i64 %t336, i64 %t337, i64 1)
  store i64 %t338, ptr %local.ra_1.177
  %t339 = load i64, ptr %local.ga_2.166
  %t340 = load i64, ptr %local.gb_0.168
  %t341 = load i64, ptr %local.gb_1.169
  %t342 = load i64, ptr %local.gb_2.170
  %t343 = load i64, ptr %local.gb_3.171
  %t344 = load i64, ptr %local.ga_0.164
  %t345 = load i64, ptr %local.ga_1.165
  %t346 = load i64, ptr %local.ga_2.166
  %t347 = load i64, ptr %local.ga_3.167
  %t348 = load i64, ptr %local.alpha_ab
  %t349 = call i64 @"project_dim"(i64 %t339, i64 %t340, i64 %t341, i64 %t342, i64 %t343, i64 %t344, i64 %t345, i64 %t346, i64 %t347, i64 %t348, i64 2)
  store i64 %t349, ptr %local.ra_2.178
  %t350 = load i64, ptr %local.ra_2.178
  %t351 = load i64, ptr %local.gc_0.172
  %t352 = load i64, ptr %local.gc_1.173
  %t353 = load i64, ptr %local.gc_2.174
  %t354 = load i64, ptr %local.gc_3.175
  %t355 = load i64, ptr %local.ga_0.164
  %t356 = load i64, ptr %local.ga_1.165
  %t357 = load i64, ptr %local.ga_2.166
  %t358 = load i64, ptr %local.ga_3.167
  %t359 = load i64, ptr %local.alpha_ac
  %t360 = call i64 @"project_dim"(i64 %t350, i64 %t351, i64 %t352, i64 %t353, i64 %t354, i64 %t355, i64 %t356, i64 %t357, i64 %t358, i64 %t359, i64 2)
  store i64 %t360, ptr %local.ra_2.178
  %t361 = load i64, ptr %local.ga_3.167
  %t362 = load i64, ptr %local.gb_0.168
  %t363 = load i64, ptr %local.gb_1.169
  %t364 = load i64, ptr %local.gb_2.170
  %t365 = load i64, ptr %local.gb_3.171
  %t366 = load i64, ptr %local.ga_0.164
  %t367 = load i64, ptr %local.ga_1.165
  %t368 = load i64, ptr %local.ga_2.166
  %t369 = load i64, ptr %local.ga_3.167
  %t370 = load i64, ptr %local.alpha_ab
  %t371 = call i64 @"project_dim"(i64 %t361, i64 %t362, i64 %t363, i64 %t364, i64 %t365, i64 %t366, i64 %t367, i64 %t368, i64 %t369, i64 %t370, i64 3)
  store i64 %t371, ptr %local.ra_3.179
  %t372 = load i64, ptr %local.ra_3.179
  %t373 = load i64, ptr %local.gc_0.172
  %t374 = load i64, ptr %local.gc_1.173
  %t375 = load i64, ptr %local.gc_2.174
  %t376 = load i64, ptr %local.gc_3.175
  %t377 = load i64, ptr %local.ga_0.164
  %t378 = load i64, ptr %local.ga_1.165
  %t379 = load i64, ptr %local.ga_2.166
  %t380 = load i64, ptr %local.ga_3.167
  %t381 = load i64, ptr %local.alpha_ac
  %t382 = call i64 @"project_dim"(i64 %t372, i64 %t373, i64 %t374, i64 %t375, i64 %t376, i64 %t377, i64 %t378, i64 %t379, i64 %t380, i64 %t381, i64 3)
  store i64 %t382, ptr %local.ra_3.179
  %t383 = load i64, ptr %local.gb_0.168
  %t384 = load i64, ptr %local.ga_0.164
  %t385 = load i64, ptr %local.ga_1.165
  %t386 = load i64, ptr %local.ga_2.166
  %t387 = load i64, ptr %local.ga_3.167
  %t388 = load i64, ptr %local.gb_0.168
  %t389 = load i64, ptr %local.gb_1.169
  %t390 = load i64, ptr %local.gb_2.170
  %t391 = load i64, ptr %local.gb_3.171
  %t392 = load i64, ptr %local.alpha_ba
  %t393 = call i64 @"project_dim"(i64 %t383, i64 %t384, i64 %t385, i64 %t386, i64 %t387, i64 %t388, i64 %t389, i64 %t390, i64 %t391, i64 %t392, i64 0)
  store i64 %t393, ptr %local.rb_0.180
  %t394 = load i64, ptr %local.rb_0.180
  %t395 = load i64, ptr %local.gc_0.172
  %t396 = load i64, ptr %local.gc_1.173
  %t397 = load i64, ptr %local.gc_2.174
  %t398 = load i64, ptr %local.gc_3.175
  %t399 = load i64, ptr %local.gb_0.168
  %t400 = load i64, ptr %local.gb_1.169
  %t401 = load i64, ptr %local.gb_2.170
  %t402 = load i64, ptr %local.gb_3.171
  %t403 = load i64, ptr %local.alpha_bc
  %t404 = call i64 @"project_dim"(i64 %t394, i64 %t395, i64 %t396, i64 %t397, i64 %t398, i64 %t399, i64 %t400, i64 %t401, i64 %t402, i64 %t403, i64 0)
  store i64 %t404, ptr %local.rb_0.180
  %t405 = load i64, ptr %local.gb_1.169
  %t406 = load i64, ptr %local.ga_0.164
  %t407 = load i64, ptr %local.ga_1.165
  %t408 = load i64, ptr %local.ga_2.166
  %t409 = load i64, ptr %local.ga_3.167
  %t410 = load i64, ptr %local.gb_0.168
  %t411 = load i64, ptr %local.gb_1.169
  %t412 = load i64, ptr %local.gb_2.170
  %t413 = load i64, ptr %local.gb_3.171
  %t414 = load i64, ptr %local.alpha_ba
  %t415 = call i64 @"project_dim"(i64 %t405, i64 %t406, i64 %t407, i64 %t408, i64 %t409, i64 %t410, i64 %t411, i64 %t412, i64 %t413, i64 %t414, i64 1)
  store i64 %t415, ptr %local.rb_1.181
  %t416 = load i64, ptr %local.rb_1.181
  %t417 = load i64, ptr %local.gc_0.172
  %t418 = load i64, ptr %local.gc_1.173
  %t419 = load i64, ptr %local.gc_2.174
  %t420 = load i64, ptr %local.gc_3.175
  %t421 = load i64, ptr %local.gb_0.168
  %t422 = load i64, ptr %local.gb_1.169
  %t423 = load i64, ptr %local.gb_2.170
  %t424 = load i64, ptr %local.gb_3.171
  %t425 = load i64, ptr %local.alpha_bc
  %t426 = call i64 @"project_dim"(i64 %t416, i64 %t417, i64 %t418, i64 %t419, i64 %t420, i64 %t421, i64 %t422, i64 %t423, i64 %t424, i64 %t425, i64 1)
  store i64 %t426, ptr %local.rb_1.181
  %t427 = load i64, ptr %local.gb_2.170
  %t428 = load i64, ptr %local.ga_0.164
  %t429 = load i64, ptr %local.ga_1.165
  %t430 = load i64, ptr %local.ga_2.166
  %t431 = load i64, ptr %local.ga_3.167
  %t432 = load i64, ptr %local.gb_0.168
  %t433 = load i64, ptr %local.gb_1.169
  %t434 = load i64, ptr %local.gb_2.170
  %t435 = load i64, ptr %local.gb_3.171
  %t436 = load i64, ptr %local.alpha_ba
  %t437 = call i64 @"project_dim"(i64 %t427, i64 %t428, i64 %t429, i64 %t430, i64 %t431, i64 %t432, i64 %t433, i64 %t434, i64 %t435, i64 %t436, i64 2)
  store i64 %t437, ptr %local.rb_2.182
  %t438 = load i64, ptr %local.rb_2.182
  %t439 = load i64, ptr %local.gc_0.172
  %t440 = load i64, ptr %local.gc_1.173
  %t441 = load i64, ptr %local.gc_2.174
  %t442 = load i64, ptr %local.gc_3.175
  %t443 = load i64, ptr %local.gb_0.168
  %t444 = load i64, ptr %local.gb_1.169
  %t445 = load i64, ptr %local.gb_2.170
  %t446 = load i64, ptr %local.gb_3.171
  %t447 = load i64, ptr %local.alpha_bc
  %t448 = call i64 @"project_dim"(i64 %t438, i64 %t439, i64 %t440, i64 %t441, i64 %t442, i64 %t443, i64 %t444, i64 %t445, i64 %t446, i64 %t447, i64 2)
  store i64 %t448, ptr %local.rb_2.182
  %t449 = load i64, ptr %local.gb_3.171
  %t450 = load i64, ptr %local.ga_0.164
  %t451 = load i64, ptr %local.ga_1.165
  %t452 = load i64, ptr %local.ga_2.166
  %t453 = load i64, ptr %local.ga_3.167
  %t454 = load i64, ptr %local.gb_0.168
  %t455 = load i64, ptr %local.gb_1.169
  %t456 = load i64, ptr %local.gb_2.170
  %t457 = load i64, ptr %local.gb_3.171
  %t458 = load i64, ptr %local.alpha_ba
  %t459 = call i64 @"project_dim"(i64 %t449, i64 %t450, i64 %t451, i64 %t452, i64 %t453, i64 %t454, i64 %t455, i64 %t456, i64 %t457, i64 %t458, i64 3)
  store i64 %t459, ptr %local.rb_3.183
  %t460 = load i64, ptr %local.rb_3.183
  %t461 = load i64, ptr %local.gc_0.172
  %t462 = load i64, ptr %local.gc_1.173
  %t463 = load i64, ptr %local.gc_2.174
  %t464 = load i64, ptr %local.gc_3.175
  %t465 = load i64, ptr %local.gb_0.168
  %t466 = load i64, ptr %local.gb_1.169
  %t467 = load i64, ptr %local.gb_2.170
  %t468 = load i64, ptr %local.gb_3.171
  %t469 = load i64, ptr %local.alpha_bc
  %t470 = call i64 @"project_dim"(i64 %t460, i64 %t461, i64 %t462, i64 %t463, i64 %t464, i64 %t465, i64 %t466, i64 %t467, i64 %t468, i64 %t469, i64 3)
  store i64 %t470, ptr %local.rb_3.183
  %t471 = load i64, ptr %local.gc_0.172
  %t472 = load i64, ptr %local.ga_0.164
  %t473 = load i64, ptr %local.ga_1.165
  %t474 = load i64, ptr %local.ga_2.166
  %t475 = load i64, ptr %local.ga_3.167
  %t476 = load i64, ptr %local.gc_0.172
  %t477 = load i64, ptr %local.gc_1.173
  %t478 = load i64, ptr %local.gc_2.174
  %t479 = load i64, ptr %local.gc_3.175
  %t480 = load i64, ptr %local.alpha_ca
  %t481 = call i64 @"project_dim"(i64 %t471, i64 %t472, i64 %t473, i64 %t474, i64 %t475, i64 %t476, i64 %t477, i64 %t478, i64 %t479, i64 %t480, i64 0)
  store i64 %t481, ptr %local.rc_0.184
  %t482 = load i64, ptr %local.rc_0.184
  %t483 = load i64, ptr %local.gb_0.168
  %t484 = load i64, ptr %local.gb_1.169
  %t485 = load i64, ptr %local.gb_2.170
  %t486 = load i64, ptr %local.gb_3.171
  %t487 = load i64, ptr %local.gc_0.172
  %t488 = load i64, ptr %local.gc_1.173
  %t489 = load i64, ptr %local.gc_2.174
  %t490 = load i64, ptr %local.gc_3.175
  %t491 = load i64, ptr %local.alpha_cb
  %t492 = call i64 @"project_dim"(i64 %t482, i64 %t483, i64 %t484, i64 %t485, i64 %t486, i64 %t487, i64 %t488, i64 %t489, i64 %t490, i64 %t491, i64 0)
  store i64 %t492, ptr %local.rc_0.184
  %t493 = load i64, ptr %local.gc_1.173
  %t494 = load i64, ptr %local.ga_0.164
  %t495 = load i64, ptr %local.ga_1.165
  %t496 = load i64, ptr %local.ga_2.166
  %t497 = load i64, ptr %local.ga_3.167
  %t498 = load i64, ptr %local.gc_0.172
  %t499 = load i64, ptr %local.gc_1.173
  %t500 = load i64, ptr %local.gc_2.174
  %t501 = load i64, ptr %local.gc_3.175
  %t502 = load i64, ptr %local.alpha_ca
  %t503 = call i64 @"project_dim"(i64 %t493, i64 %t494, i64 %t495, i64 %t496, i64 %t497, i64 %t498, i64 %t499, i64 %t500, i64 %t501, i64 %t502, i64 1)
  store i64 %t503, ptr %local.rc_1.185
  %t504 = load i64, ptr %local.rc_1.185
  %t505 = load i64, ptr %local.gb_0.168
  %t506 = load i64, ptr %local.gb_1.169
  %t507 = load i64, ptr %local.gb_2.170
  %t508 = load i64, ptr %local.gb_3.171
  %t509 = load i64, ptr %local.gc_0.172
  %t510 = load i64, ptr %local.gc_1.173
  %t511 = load i64, ptr %local.gc_2.174
  %t512 = load i64, ptr %local.gc_3.175
  %t513 = load i64, ptr %local.alpha_cb
  %t514 = call i64 @"project_dim"(i64 %t504, i64 %t505, i64 %t506, i64 %t507, i64 %t508, i64 %t509, i64 %t510, i64 %t511, i64 %t512, i64 %t513, i64 1)
  store i64 %t514, ptr %local.rc_1.185
  %t515 = load i64, ptr %local.gc_2.174
  %t516 = load i64, ptr %local.ga_0.164
  %t517 = load i64, ptr %local.ga_1.165
  %t518 = load i64, ptr %local.ga_2.166
  %t519 = load i64, ptr %local.ga_3.167
  %t520 = load i64, ptr %local.gc_0.172
  %t521 = load i64, ptr %local.gc_1.173
  %t522 = load i64, ptr %local.gc_2.174
  %t523 = load i64, ptr %local.gc_3.175
  %t524 = load i64, ptr %local.alpha_ca
  %t525 = call i64 @"project_dim"(i64 %t515, i64 %t516, i64 %t517, i64 %t518, i64 %t519, i64 %t520, i64 %t521, i64 %t522, i64 %t523, i64 %t524, i64 2)
  store i64 %t525, ptr %local.rc_2.186
  %t526 = load i64, ptr %local.rc_2.186
  %t527 = load i64, ptr %local.gb_0.168
  %t528 = load i64, ptr %local.gb_1.169
  %t529 = load i64, ptr %local.gb_2.170
  %t530 = load i64, ptr %local.gb_3.171
  %t531 = load i64, ptr %local.gc_0.172
  %t532 = load i64, ptr %local.gc_1.173
  %t533 = load i64, ptr %local.gc_2.174
  %t534 = load i64, ptr %local.gc_3.175
  %t535 = load i64, ptr %local.alpha_cb
  %t536 = call i64 @"project_dim"(i64 %t526, i64 %t527, i64 %t528, i64 %t529, i64 %t530, i64 %t531, i64 %t532, i64 %t533, i64 %t534, i64 %t535, i64 2)
  store i64 %t536, ptr %local.rc_2.186
  %t537 = load i64, ptr %local.gc_3.175
  %t538 = load i64, ptr %local.ga_0.164
  %t539 = load i64, ptr %local.ga_1.165
  %t540 = load i64, ptr %local.ga_2.166
  %t541 = load i64, ptr %local.ga_3.167
  %t542 = load i64, ptr %local.gc_0.172
  %t543 = load i64, ptr %local.gc_1.173
  %t544 = load i64, ptr %local.gc_2.174
  %t545 = load i64, ptr %local.gc_3.175
  %t546 = load i64, ptr %local.alpha_ca
  %t547 = call i64 @"project_dim"(i64 %t537, i64 %t538, i64 %t539, i64 %t540, i64 %t541, i64 %t542, i64 %t543, i64 %t544, i64 %t545, i64 %t546, i64 3)
  store i64 %t547, ptr %local.rc_3.187
  %t548 = load i64, ptr %local.rc_3.187
  %t549 = load i64, ptr %local.gb_0.168
  %t550 = load i64, ptr %local.gb_1.169
  %t551 = load i64, ptr %local.gb_2.170
  %t552 = load i64, ptr %local.gb_3.171
  %t553 = load i64, ptr %local.gc_0.172
  %t554 = load i64, ptr %local.gc_1.173
  %t555 = load i64, ptr %local.gc_2.174
  %t556 = load i64, ptr %local.gc_3.175
  %t557 = load i64, ptr %local.alpha_cb
  %t558 = call i64 @"project_dim"(i64 %t548, i64 %t549, i64 %t550, i64 %t551, i64 %t552, i64 %t553, i64 %t554, i64 %t555, i64 %t556, i64 %t557, i64 3)
  store i64 %t558, ptr %local.rc_3.187
  %t559 = load i64, ptr %local.w0.159
  %t560 = load i64, ptr %local.lr.188
  %t561 = load i64, ptr %local.ra_0.176
  %t562 = load i64, ptr %local.rb_0.180
  %t563 = call i64 @"sx_f64_add"(i64 %t561, i64 %t562)
  %t564 = load i64, ptr %local.rc_0.184
  %t565 = call i64 @"sx_f64_add"(i64 %t563, i64 %t564)
  %t566 = call i64 @"sx_f64_mul"(i64 %t560, i64 %t565)
  %t567 = call i64 @"sx_f64_sub"(i64 %t559, i64 %t566)
  store i64 %t567, ptr %local.w0.159
  %t568 = load i64, ptr %local.w1.160
  %t569 = load i64, ptr %local.lr.188
  %t570 = load i64, ptr %local.ra_1.177
  %t571 = load i64, ptr %local.rb_1.181
  %t572 = call i64 @"sx_f64_add"(i64 %t570, i64 %t571)
  %t573 = load i64, ptr %local.rc_1.185
  %t574 = call i64 @"sx_f64_add"(i64 %t572, i64 %t573)
  %t575 = call i64 @"sx_f64_mul"(i64 %t569, i64 %t574)
  %t576 = call i64 @"sx_f64_sub"(i64 %t568, i64 %t575)
  store i64 %t576, ptr %local.w1.160
  %t577 = load i64, ptr %local.w2.161
  %t578 = load i64, ptr %local.lr.188
  %t579 = load i64, ptr %local.ra_2.178
  %t580 = load i64, ptr %local.rb_2.182
  %t581 = call i64 @"sx_f64_add"(i64 %t579, i64 %t580)
  %t582 = load i64, ptr %local.rc_2.186
  %t583 = call i64 @"sx_f64_add"(i64 %t581, i64 %t582)
  %t584 = call i64 @"sx_f64_mul"(i64 %t578, i64 %t583)
  %t585 = call i64 @"sx_f64_sub"(i64 %t577, i64 %t584)
  store i64 %t585, ptr %local.w2.161
  %t586 = load i64, ptr %local.w3.162
  %t587 = load i64, ptr %local.lr.188
  %t588 = load i64, ptr %local.ra_3.179
  %t589 = load i64, ptr %local.rb_3.183
  %t590 = call i64 @"sx_f64_add"(i64 %t588, i64 %t589)
  %t591 = load i64, ptr %local.rc_3.187
  %t592 = call i64 @"sx_f64_add"(i64 %t590, i64 %t591)
  %t593 = call i64 @"sx_f64_mul"(i64 %t587, i64 %t592)
  %t594 = call i64 @"sx_f64_sub"(i64 %t586, i64 %t593)
  store i64 %t594, ptr %local.w3.162
  %t595 = load i64, ptr %local.step.163
  %t596 = add i64 %t595, 1
  store i64 %t596, ptr %local.step.163
  br label %loop7
endloop7:
  %t597 = load i64, ptr %local.w0.159
  %t598 = load i64, ptr %local.ta0
  %t599 = call i64 @"sx_f64_sub"(i64 %t597, i64 %t598)
  %t600 = load i64, ptr %local.w0.159
  %t601 = load i64, ptr %local.ta0
  %t602 = call i64 @"sx_f64_sub"(i64 %t600, i64 %t601)
  %t603 = call i64 @"sx_f64_mul"(i64 %t599, i64 %t602)
  store i64 %t603, ptr %local.da0.189
  %t604 = load i64, ptr %local.w1.160
  %t605 = load i64, ptr %local.ta1
  %t606 = call i64 @"sx_f64_sub"(i64 %t604, i64 %t605)
  %t607 = load i64, ptr %local.w1.160
  %t608 = load i64, ptr %local.ta1
  %t609 = call i64 @"sx_f64_sub"(i64 %t607, i64 %t608)
  %t610 = call i64 @"sx_f64_mul"(i64 %t606, i64 %t609)
  store i64 %t610, ptr %local.da1.190
  %t611 = load i64, ptr %local.w2.161
  %t612 = load i64, ptr %local.ta2
  %t613 = call i64 @"sx_f64_sub"(i64 %t611, i64 %t612)
  %t614 = load i64, ptr %local.w2.161
  %t615 = load i64, ptr %local.ta2
  %t616 = call i64 @"sx_f64_sub"(i64 %t614, i64 %t615)
  %t617 = call i64 @"sx_f64_mul"(i64 %t613, i64 %t616)
  store i64 %t617, ptr %local.da2.191
  %t618 = load i64, ptr %local.w3.162
  %t619 = load i64, ptr %local.ta3
  %t620 = call i64 @"sx_f64_sub"(i64 %t618, i64 %t619)
  %t621 = load i64, ptr %local.w3.162
  %t622 = load i64, ptr %local.ta3
  %t623 = call i64 @"sx_f64_sub"(i64 %t621, i64 %t622)
  %t624 = call i64 @"sx_f64_mul"(i64 %t620, i64 %t623)
  store i64 %t624, ptr %local.da3.192
  %t625 = load i64, ptr %local.w0.159
  %t626 = load i64, ptr %local.tb0
  %t627 = call i64 @"sx_f64_sub"(i64 %t625, i64 %t626)
  %t628 = load i64, ptr %local.w0.159
  %t629 = load i64, ptr %local.tb0
  %t630 = call i64 @"sx_f64_sub"(i64 %t628, i64 %t629)
  %t631 = call i64 @"sx_f64_mul"(i64 %t627, i64 %t630)
  store i64 %t631, ptr %local.db0.193
  %t632 = load i64, ptr %local.w1.160
  %t633 = load i64, ptr %local.tb1
  %t634 = call i64 @"sx_f64_sub"(i64 %t632, i64 %t633)
  %t635 = load i64, ptr %local.w1.160
  %t636 = load i64, ptr %local.tb1
  %t637 = call i64 @"sx_f64_sub"(i64 %t635, i64 %t636)
  %t638 = call i64 @"sx_f64_mul"(i64 %t634, i64 %t637)
  store i64 %t638, ptr %local.db1.194
  %t639 = load i64, ptr %local.w2.161
  %t640 = load i64, ptr %local.tb2
  %t641 = call i64 @"sx_f64_sub"(i64 %t639, i64 %t640)
  %t642 = load i64, ptr %local.w2.161
  %t643 = load i64, ptr %local.tb2
  %t644 = call i64 @"sx_f64_sub"(i64 %t642, i64 %t643)
  %t645 = call i64 @"sx_f64_mul"(i64 %t641, i64 %t644)
  store i64 %t645, ptr %local.db2.195
  %t646 = load i64, ptr %local.w3.162
  %t647 = load i64, ptr %local.tb3
  %t648 = call i64 @"sx_f64_sub"(i64 %t646, i64 %t647)
  %t649 = load i64, ptr %local.w3.162
  %t650 = load i64, ptr %local.tb3
  %t651 = call i64 @"sx_f64_sub"(i64 %t649, i64 %t650)
  %t652 = call i64 @"sx_f64_mul"(i64 %t648, i64 %t651)
  store i64 %t652, ptr %local.db3.196
  %t653 = load i64, ptr %local.w0.159
  %t654 = load i64, ptr %local.tc0
  %t655 = call i64 @"sx_f64_sub"(i64 %t653, i64 %t654)
  %t656 = load i64, ptr %local.w0.159
  %t657 = load i64, ptr %local.tc0
  %t658 = call i64 @"sx_f64_sub"(i64 %t656, i64 %t657)
  %t659 = call i64 @"sx_f64_mul"(i64 %t655, i64 %t658)
  store i64 %t659, ptr %local.dc0.197
  %t660 = load i64, ptr %local.w1.160
  %t661 = load i64, ptr %local.tc1
  %t662 = call i64 @"sx_f64_sub"(i64 %t660, i64 %t661)
  %t663 = load i64, ptr %local.w1.160
  %t664 = load i64, ptr %local.tc1
  %t665 = call i64 @"sx_f64_sub"(i64 %t663, i64 %t664)
  %t666 = call i64 @"sx_f64_mul"(i64 %t662, i64 %t665)
  store i64 %t666, ptr %local.dc1.198
  %t667 = load i64, ptr %local.w2.161
  %t668 = load i64, ptr %local.tc2
  %t669 = call i64 @"sx_f64_sub"(i64 %t667, i64 %t668)
  %t670 = load i64, ptr %local.w2.161
  %t671 = load i64, ptr %local.tc2
  %t672 = call i64 @"sx_f64_sub"(i64 %t670, i64 %t671)
  %t673 = call i64 @"sx_f64_mul"(i64 %t669, i64 %t672)
  store i64 %t673, ptr %local.dc2.199
  %t674 = load i64, ptr %local.w3.162
  %t675 = load i64, ptr %local.tc3
  %t676 = call i64 @"sx_f64_sub"(i64 %t674, i64 %t675)
  %t677 = load i64, ptr %local.w3.162
  %t678 = load i64, ptr %local.tc3
  %t679 = call i64 @"sx_f64_sub"(i64 %t677, i64 %t678)
  %t680 = call i64 @"sx_f64_mul"(i64 %t676, i64 %t679)
  store i64 %t680, ptr %local.dc3.200
  %t681 = load i64, ptr %local.da0.189
  %t682 = load i64, ptr %local.da1.190
  %t683 = call i64 @"sx_f64_add"(i64 %t681, i64 %t682)
  %t684 = load i64, ptr %local.da2.191
  %t685 = call i64 @"sx_f64_add"(i64 %t683, i64 %t684)
  %t686 = load i64, ptr %local.da3.192
  %t687 = call i64 @"sx_f64_add"(i64 %t685, i64 %t686)
  %t688 = load i64, ptr %local.db0.193
  %t689 = call i64 @"sx_f64_add"(i64 %t687, i64 %t688)
  %t690 = load i64, ptr %local.db1.194
  %t691 = call i64 @"sx_f64_add"(i64 %t689, i64 %t690)
  %t692 = load i64, ptr %local.db2.195
  %t693 = call i64 @"sx_f64_add"(i64 %t691, i64 %t692)
  %t694 = load i64, ptr %local.db3.196
  %t695 = call i64 @"sx_f64_add"(i64 %t693, i64 %t694)
  %t696 = load i64, ptr %local.dc0.197
  %t697 = call i64 @"sx_f64_add"(i64 %t695, i64 %t696)
  %t698 = load i64, ptr %local.dc1.198
  %t699 = call i64 @"sx_f64_add"(i64 %t697, i64 %t698)
  %t700 = load i64, ptr %local.dc2.199
  %t701 = call i64 @"sx_f64_add"(i64 %t699, i64 %t700)
  %t702 = load i64, ptr %local.dc3.200
  %t703 = call i64 @"sx_f64_add"(i64 %t701, i64 %t702)
  ret i64 %t703
}

define i64 @"meta_grad_p"(i64 %base_ab, i64 %base_ac, i64 %base_ba, i64 %base_bc, i64 %base_ca, i64 %base_cb, i64 %which, i64 %steps, i64 %ta0, i64 %ta1, i64 %ta2, i64 %ta3, i64 %tb0, i64 %tb1, i64 %tb2, i64 %tb3, i64 %tc0, i64 %tc1, i64 %tc2, i64 %tc3) nounwind {
entry:
  %local.h.704 = alloca i64
  %local.ab_p.705 = alloca i64
  %local.ac_p.706 = alloca i64
  %local.ba_p.707 = alloca i64
  %local.bc_p.708 = alloca i64
  %local.ca_p.709 = alloca i64
  %local.cb_p.710 = alloca i64
  %local.ab_m.711 = alloca i64
  %local.ac_m.712 = alloca i64
  %local.ba_m.713 = alloca i64
  %local.bc_m.714 = alloca i64
  %local.ca_m.715 = alloca i64
  %local.cb_m.716 = alloca i64
  %local.lp.717 = alloca i64
  %local.lm.718 = alloca i64
  %local.base_ab = alloca i64
  store i64 %base_ab, ptr %local.base_ab
  %local.base_ac = alloca i64
  store i64 %base_ac, ptr %local.base_ac
  %local.base_ba = alloca i64
  store i64 %base_ba, ptr %local.base_ba
  %local.base_bc = alloca i64
  store i64 %base_bc, ptr %local.base_bc
  %local.base_ca = alloca i64
  store i64 %base_ca, ptr %local.base_ca
  %local.base_cb = alloca i64
  store i64 %base_cb, ptr %local.base_cb
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %local.ta0 = alloca i64
  store i64 %ta0, ptr %local.ta0
  %local.ta1 = alloca i64
  store i64 %ta1, ptr %local.ta1
  %local.ta2 = alloca i64
  store i64 %ta2, ptr %local.ta2
  %local.ta3 = alloca i64
  store i64 %ta3, ptr %local.ta3
  %local.tb0 = alloca i64
  store i64 %tb0, ptr %local.tb0
  %local.tb1 = alloca i64
  store i64 %tb1, ptr %local.tb1
  %local.tb2 = alloca i64
  store i64 %tb2, ptr %local.tb2
  %local.tb3 = alloca i64
  store i64 %tb3, ptr %local.tb3
  %local.tc0 = alloca i64
  store i64 %tc0, ptr %local.tc0
  %local.tc1 = alloca i64
  store i64 %tc1, ptr %local.tc1
  %local.tc2 = alloca i64
  store i64 %tc2, ptr %local.tc2
  %local.tc3 = alloca i64
  store i64 %tc3, ptr %local.tc3
  %t719 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.47)
  store i64 %t719, ptr %local.h.704
  %t720 = load i64, ptr %local.base_ab
  store i64 %t720, ptr %local.ab_p.705
  %t721 = load i64, ptr %local.base_ac
  store i64 %t721, ptr %local.ac_p.706
  %t722 = load i64, ptr %local.base_ba
  store i64 %t722, ptr %local.ba_p.707
  %t723 = load i64, ptr %local.base_bc
  store i64 %t723, ptr %local.bc_p.708
  %t724 = load i64, ptr %local.base_ca
  store i64 %t724, ptr %local.ca_p.709
  %t725 = load i64, ptr %local.base_cb
  store i64 %t725, ptr %local.cb_p.710
  %t726 = load i64, ptr %local.base_ab
  store i64 %t726, ptr %local.ab_m.711
  %t727 = load i64, ptr %local.base_ac
  store i64 %t727, ptr %local.ac_m.712
  %t728 = load i64, ptr %local.base_ba
  store i64 %t728, ptr %local.ba_m.713
  %t729 = load i64, ptr %local.base_bc
  store i64 %t729, ptr %local.bc_m.714
  %t730 = load i64, ptr %local.base_ca
  store i64 %t730, ptr %local.ca_m.715
  %t731 = load i64, ptr %local.base_cb
  store i64 %t731, ptr %local.cb_m.716
  %t732 = load i64, ptr %local.which
  %t733 = icmp eq i64 %t732, 0
  %t734 = zext i1 %t733 to i64
  %t735 = icmp ne i64 %t734, 0
  br i1 %t735, label %then8, label %else8
then8:
  %t736 = load i64, ptr %local.base_ab
  %t737 = load i64, ptr %local.h.704
  %t738 = call i64 @"sx_f64_add"(i64 %t736, i64 %t737)
  store i64 %t738, ptr %local.ab_p.705
  %t739 = load i64, ptr %local.base_ab
  %t740 = load i64, ptr %local.h.704
  %t741 = call i64 @"sx_f64_sub"(i64 %t739, i64 %t740)
  store i64 %t741, ptr %local.ab_m.711
  br label %then8_end
then8_end:
  br label %endif8
else8:
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t742 = phi i64 [ 0, %then8_end ], [ 0, %else8_end ]
  %t743 = load i64, ptr %local.which
  %t744 = icmp eq i64 %t743, 1
  %t745 = zext i1 %t744 to i64
  %t746 = icmp ne i64 %t745, 0
  br i1 %t746, label %then9, label %else9
then9:
  %t747 = load i64, ptr %local.base_ac
  %t748 = load i64, ptr %local.h.704
  %t749 = call i64 @"sx_f64_add"(i64 %t747, i64 %t748)
  store i64 %t749, ptr %local.ac_p.706
  %t750 = load i64, ptr %local.base_ac
  %t751 = load i64, ptr %local.h.704
  %t752 = call i64 @"sx_f64_sub"(i64 %t750, i64 %t751)
  store i64 %t752, ptr %local.ac_m.712
  br label %then9_end
then9_end:
  br label %endif9
else9:
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t753 = phi i64 [ 0, %then9_end ], [ 0, %else9_end ]
  %t754 = load i64, ptr %local.which
  %t755 = icmp eq i64 %t754, 2
  %t756 = zext i1 %t755 to i64
  %t757 = icmp ne i64 %t756, 0
  br i1 %t757, label %then10, label %else10
then10:
  %t758 = load i64, ptr %local.base_ba
  %t759 = load i64, ptr %local.h.704
  %t760 = call i64 @"sx_f64_add"(i64 %t758, i64 %t759)
  store i64 %t760, ptr %local.ba_p.707
  %t761 = load i64, ptr %local.base_ba
  %t762 = load i64, ptr %local.h.704
  %t763 = call i64 @"sx_f64_sub"(i64 %t761, i64 %t762)
  store i64 %t763, ptr %local.ba_m.713
  br label %then10_end
then10_end:
  br label %endif10
else10:
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t764 = phi i64 [ 0, %then10_end ], [ 0, %else10_end ]
  %t765 = load i64, ptr %local.which
  %t766 = icmp eq i64 %t765, 3
  %t767 = zext i1 %t766 to i64
  %t768 = icmp ne i64 %t767, 0
  br i1 %t768, label %then11, label %else11
then11:
  %t769 = load i64, ptr %local.base_bc
  %t770 = load i64, ptr %local.h.704
  %t771 = call i64 @"sx_f64_add"(i64 %t769, i64 %t770)
  store i64 %t771, ptr %local.bc_p.708
  %t772 = load i64, ptr %local.base_bc
  %t773 = load i64, ptr %local.h.704
  %t774 = call i64 @"sx_f64_sub"(i64 %t772, i64 %t773)
  store i64 %t774, ptr %local.bc_m.714
  br label %then11_end
then11_end:
  br label %endif11
else11:
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t775 = phi i64 [ 0, %then11_end ], [ 0, %else11_end ]
  %t776 = load i64, ptr %local.which
  %t777 = icmp eq i64 %t776, 4
  %t778 = zext i1 %t777 to i64
  %t779 = icmp ne i64 %t778, 0
  br i1 %t779, label %then12, label %else12
then12:
  %t780 = load i64, ptr %local.base_ca
  %t781 = load i64, ptr %local.h.704
  %t782 = call i64 @"sx_f64_add"(i64 %t780, i64 %t781)
  store i64 %t782, ptr %local.ca_p.709
  %t783 = load i64, ptr %local.base_ca
  %t784 = load i64, ptr %local.h.704
  %t785 = call i64 @"sx_f64_sub"(i64 %t783, i64 %t784)
  store i64 %t785, ptr %local.ca_m.715
  br label %then12_end
then12_end:
  br label %endif12
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t786 = phi i64 [ 0, %then12_end ], [ 0, %else12_end ]
  %t787 = load i64, ptr %local.which
  %t788 = icmp eq i64 %t787, 5
  %t789 = zext i1 %t788 to i64
  %t790 = icmp ne i64 %t789, 0
  br i1 %t790, label %then13, label %else13
then13:
  %t791 = load i64, ptr %local.base_cb
  %t792 = load i64, ptr %local.h.704
  %t793 = call i64 @"sx_f64_add"(i64 %t791, i64 %t792)
  store i64 %t793, ptr %local.cb_p.710
  %t794 = load i64, ptr %local.base_cb
  %t795 = load i64, ptr %local.h.704
  %t796 = call i64 @"sx_f64_sub"(i64 %t794, i64 %t795)
  store i64 %t796, ptr %local.cb_m.716
  br label %then13_end
then13_end:
  br label %endif13
else13:
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t797 = phi i64 [ 0, %then13_end ], [ 0, %else13_end ]
  %t798 = load i64, ptr %local.ab_p.705
  %t799 = load i64, ptr %local.ac_p.706
  %t800 = load i64, ptr %local.ba_p.707
  %t801 = load i64, ptr %local.bc_p.708
  %t802 = load i64, ptr %local.ca_p.709
  %t803 = load i64, ptr %local.cb_p.710
  %t804 = load i64, ptr %local.ta0
  %t805 = load i64, ptr %local.ta1
  %t806 = load i64, ptr %local.ta2
  %t807 = load i64, ptr %local.ta3
  %t808 = load i64, ptr %local.tb0
  %t809 = load i64, ptr %local.tb1
  %t810 = load i64, ptr %local.tb2
  %t811 = load i64, ptr %local.tb3
  %t812 = load i64, ptr %local.tc0
  %t813 = load i64, ptr %local.tc1
  %t814 = load i64, ptr %local.tc2
  %t815 = load i64, ptr %local.tc3
  %t816 = load i64, ptr %local.steps
  %t817 = call i64 @"run_cycle_p"(i64 %t798, i64 %t799, i64 %t800, i64 %t801, i64 %t802, i64 %t803, i64 %t804, i64 %t805, i64 %t806, i64 %t807, i64 %t808, i64 %t809, i64 %t810, i64 %t811, i64 %t812, i64 %t813, i64 %t814, i64 %t815, i64 %t816)
  store i64 %t817, ptr %local.lp.717
  %t818 = load i64, ptr %local.ab_m.711
  %t819 = load i64, ptr %local.ac_m.712
  %t820 = load i64, ptr %local.ba_m.713
  %t821 = load i64, ptr %local.bc_m.714
  %t822 = load i64, ptr %local.ca_m.715
  %t823 = load i64, ptr %local.cb_m.716
  %t824 = load i64, ptr %local.ta0
  %t825 = load i64, ptr %local.ta1
  %t826 = load i64, ptr %local.ta2
  %t827 = load i64, ptr %local.ta3
  %t828 = load i64, ptr %local.tb0
  %t829 = load i64, ptr %local.tb1
  %t830 = load i64, ptr %local.tb2
  %t831 = load i64, ptr %local.tb3
  %t832 = load i64, ptr %local.tc0
  %t833 = load i64, ptr %local.tc1
  %t834 = load i64, ptr %local.tc2
  %t835 = load i64, ptr %local.tc3
  %t836 = load i64, ptr %local.steps
  %t837 = call i64 @"run_cycle_p"(i64 %t818, i64 %t819, i64 %t820, i64 %t821, i64 %t822, i64 %t823, i64 %t824, i64 %t825, i64 %t826, i64 %t827, i64 %t828, i64 %t829, i64 %t830, i64 %t831, i64 %t832, i64 %t833, i64 %t834, i64 %t835, i64 %t836)
  store i64 %t837, ptr %local.lm.718
  %t838 = load i64, ptr %local.lp.717
  %t839 = load i64, ptr %local.lm.718
  %t840 = call i64 @"sx_f64_sub"(i64 %t838, i64 %t839)
  %t841 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.48)
  %t842 = load i64, ptr %local.h.704
  %t843 = call i64 @"sx_f64_mul"(i64 %t841, i64 %t842)
  %t844 = call i64 @"sx_f64_div"(i64 %t840, i64 %t843)
  ret i64 %t844
}

define i64 @"ln_approx"(i64 %x) nounwind {
entry:
  %local.val.845 = alloca i64
  %local.k.846 = alloca i64
  %local.u.847 = alloca i64
  %local.u2.848 = alloca i64
  %local.t1.849 = alloca i64
  %local.t3.850 = alloca i64
  %local.t5.851 = alloca i64
  %local.t7.852 = alloca i64
  %local.t9.853 = alloca i64
  %local.t11.854 = alloca i64
  %local.ln_val.855 = alloca i64
  %local.ln2.856 = alloca i64
  %local.kf.857 = alloca i64
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t858 = load i64, ptr %local.x
  %t859 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.49)
  %t860 = call i64 @"sx_f64_le"(i64 %t858, i64 %t859)
  %t861 = icmp ne i64 %t860, 0
  br i1 %t861, label %then14, label %else14
then14:
  %t862 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.50)
  %t863 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.51)
  %t864 = call i64 @"sx_f64_sub"(i64 %t862, i64 %t863)
  ret i64 %t864
else14:
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t865 = phi i64 [ 0, %else14_end ]
  %t866 = load i64, ptr %local.x
  store i64 %t866, ptr %local.val.845
  store i64 0, ptr %local.k.846
  br label %loop15
loop15:
  %t867 = load i64, ptr %local.val.845
  %t868 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.52)
  %t869 = call i64 @"sx_f64_gt"(i64 %t867, i64 %t868)
  %t870 = icmp ne i64 %t869, 0
  br i1 %t870, label %body15, label %endloop15
body15:
  %t871 = load i64, ptr %local.val.845
  %t872 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.53)
  %t873 = call i64 @"sx_f64_div"(i64 %t871, i64 %t872)
  store i64 %t873, ptr %local.val.845
  %t874 = load i64, ptr %local.k.846
  %t875 = add i64 %t874, 1
  store i64 %t875, ptr %local.k.846
  br label %loop15
endloop15:
  br label %loop16
loop16:
  %t876 = load i64, ptr %local.val.845
  %t877 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.54)
  %t878 = call i64 @"sx_f64_lt"(i64 %t876, i64 %t877)
  %t879 = icmp ne i64 %t878, 0
  br i1 %t879, label %body16, label %endloop16
body16:
  %t880 = load i64, ptr %local.val.845
  %t881 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.55)
  %t882 = call i64 @"sx_f64_mul"(i64 %t880, i64 %t881)
  store i64 %t882, ptr %local.val.845
  %t883 = load i64, ptr %local.k.846
  %t884 = sub i64 %t883, 1
  store i64 %t884, ptr %local.k.846
  br label %loop16
endloop16:
  %t885 = load i64, ptr %local.val.845
  %t886 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.56)
  %t887 = call i64 @"sx_f64_sub"(i64 %t885, i64 %t886)
  %t888 = load i64, ptr %local.val.845
  %t889 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.57)
  %t890 = call i64 @"sx_f64_add"(i64 %t888, i64 %t889)
  %t891 = call i64 @"sx_f64_div"(i64 %t887, i64 %t890)
  store i64 %t891, ptr %local.u.847
  %t892 = load i64, ptr %local.u.847
  %t893 = load i64, ptr %local.u.847
  %t894 = call i64 @"sx_f64_mul"(i64 %t892, i64 %t893)
  store i64 %t894, ptr %local.u2.848
  %t895 = load i64, ptr %local.u.847
  store i64 %t895, ptr %local.t1.849
  %t896 = load i64, ptr %local.u.847
  %t897 = load i64, ptr %local.u2.848
  %t898 = call i64 @"sx_f64_mul"(i64 %t896, i64 %t897)
  %t899 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.58)
  %t900 = call i64 @"sx_f64_div"(i64 %t898, i64 %t899)
  store i64 %t900, ptr %local.t3.850
  %t901 = load i64, ptr %local.u.847
  %t902 = load i64, ptr %local.u2.848
  %t903 = call i64 @"sx_f64_mul"(i64 %t901, i64 %t902)
  %t904 = load i64, ptr %local.u2.848
  %t905 = call i64 @"sx_f64_mul"(i64 %t903, i64 %t904)
  %t906 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.59)
  %t907 = call i64 @"sx_f64_div"(i64 %t905, i64 %t906)
  store i64 %t907, ptr %local.t5.851
  %t908 = load i64, ptr %local.u.847
  %t909 = load i64, ptr %local.u2.848
  %t910 = call i64 @"sx_f64_mul"(i64 %t908, i64 %t909)
  %t911 = load i64, ptr %local.u2.848
  %t912 = call i64 @"sx_f64_mul"(i64 %t910, i64 %t911)
  %t913 = load i64, ptr %local.u2.848
  %t914 = call i64 @"sx_f64_mul"(i64 %t912, i64 %t913)
  %t915 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.60)
  %t916 = call i64 @"sx_f64_div"(i64 %t914, i64 %t915)
  store i64 %t916, ptr %local.t7.852
  %t917 = load i64, ptr %local.u.847
  %t918 = load i64, ptr %local.u2.848
  %t919 = call i64 @"sx_f64_mul"(i64 %t917, i64 %t918)
  %t920 = load i64, ptr %local.u2.848
  %t921 = call i64 @"sx_f64_mul"(i64 %t919, i64 %t920)
  %t922 = load i64, ptr %local.u2.848
  %t923 = call i64 @"sx_f64_mul"(i64 %t921, i64 %t922)
  %t924 = load i64, ptr %local.u2.848
  %t925 = call i64 @"sx_f64_mul"(i64 %t923, i64 %t924)
  %t926 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.61)
  %t927 = call i64 @"sx_f64_div"(i64 %t925, i64 %t926)
  store i64 %t927, ptr %local.t9.853
  %t928 = load i64, ptr %local.u.847
  %t929 = load i64, ptr %local.u2.848
  %t930 = call i64 @"sx_f64_mul"(i64 %t928, i64 %t929)
  %t931 = load i64, ptr %local.u2.848
  %t932 = call i64 @"sx_f64_mul"(i64 %t930, i64 %t931)
  %t933 = load i64, ptr %local.u2.848
  %t934 = call i64 @"sx_f64_mul"(i64 %t932, i64 %t933)
  %t935 = load i64, ptr %local.u2.848
  %t936 = call i64 @"sx_f64_mul"(i64 %t934, i64 %t935)
  %t937 = load i64, ptr %local.u2.848
  %t938 = call i64 @"sx_f64_mul"(i64 %t936, i64 %t937)
  %t939 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.62)
  %t940 = call i64 @"sx_f64_div"(i64 %t938, i64 %t939)
  store i64 %t940, ptr %local.t11.854
  %t941 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.63)
  %t942 = load i64, ptr %local.t1.849
  %t943 = load i64, ptr %local.t3.850
  %t944 = call i64 @"sx_f64_add"(i64 %t942, i64 %t943)
  %t945 = load i64, ptr %local.t5.851
  %t946 = call i64 @"sx_f64_add"(i64 %t944, i64 %t945)
  %t947 = load i64, ptr %local.t7.852
  %t948 = call i64 @"sx_f64_add"(i64 %t946, i64 %t947)
  %t949 = load i64, ptr %local.t9.853
  %t950 = call i64 @"sx_f64_add"(i64 %t948, i64 %t949)
  %t951 = load i64, ptr %local.t11.854
  %t952 = call i64 @"sx_f64_add"(i64 %t950, i64 %t951)
  %t953 = call i64 @"sx_f64_mul"(i64 %t941, i64 %t952)
  store i64 %t953, ptr %local.ln_val.855
  %t954 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.64)
  store i64 %t954, ptr %local.ln2.856
  %t955 = load i64, ptr %local.k.846
  store i64 %t955, ptr %local.kf.857
  %t956 = load i64, ptr %local.ln_val.855
  %t957 = load i64, ptr %local.kf.857
  %t958 = load i64, ptr %local.ln2.856
  %t959 = call i64 @"sx_f64_mul"(i64 %t957, i64 %t958)
  %t960 = call i64 @"sx_f64_add"(i64 %t956, i64 %t959)
  ret i64 %t960
}

define i64 @"run_exp1"() nounwind {
entry:
  %local.alpha_ab.961 = alloca i64
  %local.alpha_ac.962 = alloca i64
  %local.alpha_ba.963 = alloca i64
  %local.alpha_bc.964 = alloca i64
  %local.alpha_ca.965 = alloca i64
  %local.alpha_cb.966 = alloca i64
  %local.prev_ab.967 = alloca i64
  %local.prev_ac.968 = alloca i64
  %local.prev_ba.969 = alloca i64
  %local.prev_bc.970 = alloca i64
  %local.prev_ca.971 = alloca i64
  %local.prev_cb.972 = alloca i64
  %local.mg.973 = alloca i64
  %local.drift.974 = alloca i64
  %local.prev_drift.975 = alloca i64
  %local.ratio.976 = alloca i64
  %local.ratio_sum_last20.977 = alloca i64
  %local.ratio_count_last20.978 = alloca i64
  %local.meta_lr.979 = alloca i64
  %local.inner_steps.980 = alloca i64
  %local.meta_cycles.981 = alloca i64
  %local.ta0.982 = alloca i64
  %local.ta1.983 = alloca i64
  %local.ta2.984 = alloca i64
  %local.ta3.985 = alloca i64
  %local.tb0.986 = alloca i64
  %local.tb1.987 = alloca i64
  %local.tb2.988 = alloca i64
  %local.tb3.989 = alloca i64
  %local.tc0.990 = alloca i64
  %local.tc1.991 = alloca i64
  %local.tc2.992 = alloca i64
  %local.tc3.993 = alloca i64
  %local.cycle.994 = alloca i64
  %local.rem.995 = alloca i64
  %local.avg_r.996 = alloca i64
  %local.phi.997 = alloca i64
  %local.inv_phi.998 = alloca i64
  %local.inv_e.999 = alloca i64
  %local.one_over_pi.1000 = alloca i64
  %t1001 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.65)
  %t1002 = ptrtoint ptr %t1001 to i64
  %t1003 = inttoptr i64 %t1002 to ptr
  call void @intrinsic_println(ptr %t1003)
  %t1004 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.66)
  %t1005 = ptrtoint ptr %t1004 to i64
  %t1006 = inttoptr i64 %t1005 to ptr
  call void @intrinsic_println(ptr %t1006)
  %t1007 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.67)
  %t1008 = ptrtoint ptr %t1007 to i64
  %t1009 = inttoptr i64 %t1008 to ptr
  call void @intrinsic_println(ptr %t1009)
  %t1010 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.68)
  %t1011 = ptrtoint ptr %t1010 to i64
  %t1012 = inttoptr i64 %t1011 to ptr
  call void @intrinsic_println(ptr %t1012)
  %t1013 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.69)
  %t1014 = ptrtoint ptr %t1013 to i64
  %t1015 = inttoptr i64 %t1014 to ptr
  call void @intrinsic_println(ptr %t1015)
  %t1016 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.70)
  %t1017 = ptrtoint ptr %t1016 to i64
  %t1018 = inttoptr i64 %t1017 to ptr
  call void @intrinsic_println(ptr %t1018)
  %t1019 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.71)
  store i64 %t1019, ptr %local.alpha_ab.961
  %t1020 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.72)
  store i64 %t1020, ptr %local.alpha_ac.962
  %t1021 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.73)
  store i64 %t1021, ptr %local.alpha_ba.963
  %t1022 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.74)
  store i64 %t1022, ptr %local.alpha_bc.964
  %t1023 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.75)
  store i64 %t1023, ptr %local.alpha_ca.965
  %t1024 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.76)
  store i64 %t1024, ptr %local.alpha_cb.966
  %t1025 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.77)
  store i64 %t1025, ptr %local.prev_ab.967
  %t1026 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.78)
  store i64 %t1026, ptr %local.prev_ac.968
  %t1027 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.79)
  store i64 %t1027, ptr %local.prev_ba.969
  %t1028 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.80)
  store i64 %t1028, ptr %local.prev_bc.970
  %t1029 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.81)
  store i64 %t1029, ptr %local.prev_ca.971
  %t1030 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.82)
  store i64 %t1030, ptr %local.prev_cb.972
  %t1031 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.83)
  store i64 %t1031, ptr %local.mg.973
  %t1032 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.84)
  store i64 %t1032, ptr %local.drift.974
  %t1033 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.85)
  store i64 %t1033, ptr %local.prev_drift.975
  %t1034 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.86)
  store i64 %t1034, ptr %local.ratio.976
  %t1035 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.87)
  store i64 %t1035, ptr %local.ratio_sum_last20.977
  store i64 0, ptr %local.ratio_count_last20.978
  %t1036 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.88)
  store i64 %t1036, ptr %local.meta_lr.979
  store i64 200, ptr %local.inner_steps.980
  store i64 100, ptr %local.meta_cycles.981
  %t1037 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.89)
  store i64 %t1037, ptr %local.ta0.982
  %t1038 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.90)
  store i64 %t1038, ptr %local.ta1.983
  %t1039 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.91)
  %t1040 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.92)
  %t1041 = call i64 @"sx_f64_sub"(i64 %t1039, i64 %t1040)
  store i64 %t1041, ptr %local.ta2.984
  %t1042 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.93)
  store i64 %t1042, ptr %local.ta3.985
  %t1043 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.94)
  %t1044 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.95)
  %t1045 = call i64 @"sx_f64_sub"(i64 %t1043, i64 %t1044)
  store i64 %t1045, ptr %local.tb0.986
  %t1046 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.96)
  store i64 %t1046, ptr %local.tb1.987
  %t1047 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.97)
  store i64 %t1047, ptr %local.tb2.988
  %t1048 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.98)
  %t1049 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.99)
  %t1050 = call i64 @"sx_f64_sub"(i64 %t1048, i64 %t1049)
  store i64 %t1050, ptr %local.tb3.989
  %t1051 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.100)
  store i64 %t1051, ptr %local.tc0.990
  %t1052 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.101)
  %t1053 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.102)
  %t1054 = call i64 @"sx_f64_sub"(i64 %t1052, i64 %t1053)
  store i64 %t1054, ptr %local.tc1.991
  %t1055 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.103)
  store i64 %t1055, ptr %local.tc2.992
  %t1056 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.104)
  store i64 %t1056, ptr %local.tc3.993
  %t1057 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.105)
  %t1058 = ptrtoint ptr %t1057 to i64
  %t1059 = inttoptr i64 %t1058 to ptr
  call void @intrinsic_println(ptr %t1059)
  %t1060 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.106)
  %t1061 = ptrtoint ptr %t1060 to i64
  %t1062 = inttoptr i64 %t1061 to ptr
  call void @intrinsic_println(ptr %t1062)
  store i64 0, ptr %local.cycle.994
  br label %loop17
loop17:
  %t1063 = load i64, ptr %local.cycle.994
  %t1064 = load i64, ptr %local.meta_cycles.981
  %t1065 = icmp slt i64 %t1063, %t1064
  %t1066 = zext i1 %t1065 to i64
  %t1067 = icmp ne i64 %t1066, 0
  br i1 %t1067, label %body17, label %endloop17
body17:
  %t1068 = load i64, ptr %local.alpha_ab.961
  store i64 %t1068, ptr %local.prev_ab.967
  %t1069 = load i64, ptr %local.alpha_ac.962
  store i64 %t1069, ptr %local.prev_ac.968
  %t1070 = load i64, ptr %local.alpha_ba.963
  store i64 %t1070, ptr %local.prev_ba.969
  %t1071 = load i64, ptr %local.alpha_bc.964
  store i64 %t1071, ptr %local.prev_bc.970
  %t1072 = load i64, ptr %local.alpha_ca.965
  store i64 %t1072, ptr %local.prev_ca.971
  %t1073 = load i64, ptr %local.alpha_cb.966
  store i64 %t1073, ptr %local.prev_cb.972
  %t1074 = load i64, ptr %local.alpha_ab.961
  %t1075 = load i64, ptr %local.alpha_ac.962
  %t1076 = load i64, ptr %local.alpha_ba.963
  %t1077 = load i64, ptr %local.alpha_bc.964
  %t1078 = load i64, ptr %local.alpha_ca.965
  %t1079 = load i64, ptr %local.alpha_cb.966
  %t1080 = load i64, ptr %local.inner_steps.980
  %t1081 = load i64, ptr %local.ta0.982
  %t1082 = load i64, ptr %local.ta1.983
  %t1083 = load i64, ptr %local.ta2.984
  %t1084 = load i64, ptr %local.ta3.985
  %t1085 = load i64, ptr %local.tb0.986
  %t1086 = load i64, ptr %local.tb1.987
  %t1087 = load i64, ptr %local.tb2.988
  %t1088 = load i64, ptr %local.tb3.989
  %t1089 = load i64, ptr %local.tc0.990
  %t1090 = load i64, ptr %local.tc1.991
  %t1091 = load i64, ptr %local.tc2.992
  %t1092 = load i64, ptr %local.tc3.993
  %t1093 = call i64 @"meta_grad_p"(i64 %t1074, i64 %t1075, i64 %t1076, i64 %t1077, i64 %t1078, i64 %t1079, i64 0, i64 %t1080, i64 %t1081, i64 %t1082, i64 %t1083, i64 %t1084, i64 %t1085, i64 %t1086, i64 %t1087, i64 %t1088, i64 %t1089, i64 %t1090, i64 %t1091, i64 %t1092)
  store i64 %t1093, ptr %local.mg.973
  %t1094 = load i64, ptr %local.alpha_ab.961
  %t1095 = load i64, ptr %local.meta_lr.979
  %t1096 = load i64, ptr %local.mg.973
  %t1097 = call i64 @"sx_f64_mul"(i64 %t1095, i64 %t1096)
  %t1098 = call i64 @"sx_f64_sub"(i64 %t1094, i64 %t1097)
  %t1099 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.107)
  %t1100 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.108)
  %t1101 = call i64 @"clamp"(i64 %t1098, i64 %t1099, i64 %t1100)
  store i64 %t1101, ptr %local.alpha_ab.961
  %t1102 = load i64, ptr %local.alpha_ab.961
  %t1103 = load i64, ptr %local.alpha_ac.962
  %t1104 = load i64, ptr %local.alpha_ba.963
  %t1105 = load i64, ptr %local.alpha_bc.964
  %t1106 = load i64, ptr %local.alpha_ca.965
  %t1107 = load i64, ptr %local.alpha_cb.966
  %t1108 = load i64, ptr %local.inner_steps.980
  %t1109 = load i64, ptr %local.ta0.982
  %t1110 = load i64, ptr %local.ta1.983
  %t1111 = load i64, ptr %local.ta2.984
  %t1112 = load i64, ptr %local.ta3.985
  %t1113 = load i64, ptr %local.tb0.986
  %t1114 = load i64, ptr %local.tb1.987
  %t1115 = load i64, ptr %local.tb2.988
  %t1116 = load i64, ptr %local.tb3.989
  %t1117 = load i64, ptr %local.tc0.990
  %t1118 = load i64, ptr %local.tc1.991
  %t1119 = load i64, ptr %local.tc2.992
  %t1120 = load i64, ptr %local.tc3.993
  %t1121 = call i64 @"meta_grad_p"(i64 %t1102, i64 %t1103, i64 %t1104, i64 %t1105, i64 %t1106, i64 %t1107, i64 1, i64 %t1108, i64 %t1109, i64 %t1110, i64 %t1111, i64 %t1112, i64 %t1113, i64 %t1114, i64 %t1115, i64 %t1116, i64 %t1117, i64 %t1118, i64 %t1119, i64 %t1120)
  store i64 %t1121, ptr %local.mg.973
  %t1122 = load i64, ptr %local.alpha_ac.962
  %t1123 = load i64, ptr %local.meta_lr.979
  %t1124 = load i64, ptr %local.mg.973
  %t1125 = call i64 @"sx_f64_mul"(i64 %t1123, i64 %t1124)
  %t1126 = call i64 @"sx_f64_sub"(i64 %t1122, i64 %t1125)
  %t1127 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.109)
  %t1128 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.110)
  %t1129 = call i64 @"clamp"(i64 %t1126, i64 %t1127, i64 %t1128)
  store i64 %t1129, ptr %local.alpha_ac.962
  %t1130 = load i64, ptr %local.alpha_ab.961
  %t1131 = load i64, ptr %local.alpha_ac.962
  %t1132 = load i64, ptr %local.alpha_ba.963
  %t1133 = load i64, ptr %local.alpha_bc.964
  %t1134 = load i64, ptr %local.alpha_ca.965
  %t1135 = load i64, ptr %local.alpha_cb.966
  %t1136 = load i64, ptr %local.inner_steps.980
  %t1137 = load i64, ptr %local.ta0.982
  %t1138 = load i64, ptr %local.ta1.983
  %t1139 = load i64, ptr %local.ta2.984
  %t1140 = load i64, ptr %local.ta3.985
  %t1141 = load i64, ptr %local.tb0.986
  %t1142 = load i64, ptr %local.tb1.987
  %t1143 = load i64, ptr %local.tb2.988
  %t1144 = load i64, ptr %local.tb3.989
  %t1145 = load i64, ptr %local.tc0.990
  %t1146 = load i64, ptr %local.tc1.991
  %t1147 = load i64, ptr %local.tc2.992
  %t1148 = load i64, ptr %local.tc3.993
  %t1149 = call i64 @"meta_grad_p"(i64 %t1130, i64 %t1131, i64 %t1132, i64 %t1133, i64 %t1134, i64 %t1135, i64 2, i64 %t1136, i64 %t1137, i64 %t1138, i64 %t1139, i64 %t1140, i64 %t1141, i64 %t1142, i64 %t1143, i64 %t1144, i64 %t1145, i64 %t1146, i64 %t1147, i64 %t1148)
  store i64 %t1149, ptr %local.mg.973
  %t1150 = load i64, ptr %local.alpha_ba.963
  %t1151 = load i64, ptr %local.meta_lr.979
  %t1152 = load i64, ptr %local.mg.973
  %t1153 = call i64 @"sx_f64_mul"(i64 %t1151, i64 %t1152)
  %t1154 = call i64 @"sx_f64_sub"(i64 %t1150, i64 %t1153)
  %t1155 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.111)
  %t1156 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.112)
  %t1157 = call i64 @"clamp"(i64 %t1154, i64 %t1155, i64 %t1156)
  store i64 %t1157, ptr %local.alpha_ba.963
  %t1158 = load i64, ptr %local.alpha_ab.961
  %t1159 = load i64, ptr %local.alpha_ac.962
  %t1160 = load i64, ptr %local.alpha_ba.963
  %t1161 = load i64, ptr %local.alpha_bc.964
  %t1162 = load i64, ptr %local.alpha_ca.965
  %t1163 = load i64, ptr %local.alpha_cb.966
  %t1164 = load i64, ptr %local.inner_steps.980
  %t1165 = load i64, ptr %local.ta0.982
  %t1166 = load i64, ptr %local.ta1.983
  %t1167 = load i64, ptr %local.ta2.984
  %t1168 = load i64, ptr %local.ta3.985
  %t1169 = load i64, ptr %local.tb0.986
  %t1170 = load i64, ptr %local.tb1.987
  %t1171 = load i64, ptr %local.tb2.988
  %t1172 = load i64, ptr %local.tb3.989
  %t1173 = load i64, ptr %local.tc0.990
  %t1174 = load i64, ptr %local.tc1.991
  %t1175 = load i64, ptr %local.tc2.992
  %t1176 = load i64, ptr %local.tc3.993
  %t1177 = call i64 @"meta_grad_p"(i64 %t1158, i64 %t1159, i64 %t1160, i64 %t1161, i64 %t1162, i64 %t1163, i64 3, i64 %t1164, i64 %t1165, i64 %t1166, i64 %t1167, i64 %t1168, i64 %t1169, i64 %t1170, i64 %t1171, i64 %t1172, i64 %t1173, i64 %t1174, i64 %t1175, i64 %t1176)
  store i64 %t1177, ptr %local.mg.973
  %t1178 = load i64, ptr %local.alpha_bc.964
  %t1179 = load i64, ptr %local.meta_lr.979
  %t1180 = load i64, ptr %local.mg.973
  %t1181 = call i64 @"sx_f64_mul"(i64 %t1179, i64 %t1180)
  %t1182 = call i64 @"sx_f64_sub"(i64 %t1178, i64 %t1181)
  %t1183 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.113)
  %t1184 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.114)
  %t1185 = call i64 @"clamp"(i64 %t1182, i64 %t1183, i64 %t1184)
  store i64 %t1185, ptr %local.alpha_bc.964
  %t1186 = load i64, ptr %local.alpha_ab.961
  %t1187 = load i64, ptr %local.alpha_ac.962
  %t1188 = load i64, ptr %local.alpha_ba.963
  %t1189 = load i64, ptr %local.alpha_bc.964
  %t1190 = load i64, ptr %local.alpha_ca.965
  %t1191 = load i64, ptr %local.alpha_cb.966
  %t1192 = load i64, ptr %local.inner_steps.980
  %t1193 = load i64, ptr %local.ta0.982
  %t1194 = load i64, ptr %local.ta1.983
  %t1195 = load i64, ptr %local.ta2.984
  %t1196 = load i64, ptr %local.ta3.985
  %t1197 = load i64, ptr %local.tb0.986
  %t1198 = load i64, ptr %local.tb1.987
  %t1199 = load i64, ptr %local.tb2.988
  %t1200 = load i64, ptr %local.tb3.989
  %t1201 = load i64, ptr %local.tc0.990
  %t1202 = load i64, ptr %local.tc1.991
  %t1203 = load i64, ptr %local.tc2.992
  %t1204 = load i64, ptr %local.tc3.993
  %t1205 = call i64 @"meta_grad_p"(i64 %t1186, i64 %t1187, i64 %t1188, i64 %t1189, i64 %t1190, i64 %t1191, i64 4, i64 %t1192, i64 %t1193, i64 %t1194, i64 %t1195, i64 %t1196, i64 %t1197, i64 %t1198, i64 %t1199, i64 %t1200, i64 %t1201, i64 %t1202, i64 %t1203, i64 %t1204)
  store i64 %t1205, ptr %local.mg.973
  %t1206 = load i64, ptr %local.alpha_ca.965
  %t1207 = load i64, ptr %local.meta_lr.979
  %t1208 = load i64, ptr %local.mg.973
  %t1209 = call i64 @"sx_f64_mul"(i64 %t1207, i64 %t1208)
  %t1210 = call i64 @"sx_f64_sub"(i64 %t1206, i64 %t1209)
  %t1211 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.115)
  %t1212 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.116)
  %t1213 = call i64 @"clamp"(i64 %t1210, i64 %t1211, i64 %t1212)
  store i64 %t1213, ptr %local.alpha_ca.965
  %t1214 = load i64, ptr %local.alpha_ab.961
  %t1215 = load i64, ptr %local.alpha_ac.962
  %t1216 = load i64, ptr %local.alpha_ba.963
  %t1217 = load i64, ptr %local.alpha_bc.964
  %t1218 = load i64, ptr %local.alpha_ca.965
  %t1219 = load i64, ptr %local.alpha_cb.966
  %t1220 = load i64, ptr %local.inner_steps.980
  %t1221 = load i64, ptr %local.ta0.982
  %t1222 = load i64, ptr %local.ta1.983
  %t1223 = load i64, ptr %local.ta2.984
  %t1224 = load i64, ptr %local.ta3.985
  %t1225 = load i64, ptr %local.tb0.986
  %t1226 = load i64, ptr %local.tb1.987
  %t1227 = load i64, ptr %local.tb2.988
  %t1228 = load i64, ptr %local.tb3.989
  %t1229 = load i64, ptr %local.tc0.990
  %t1230 = load i64, ptr %local.tc1.991
  %t1231 = load i64, ptr %local.tc2.992
  %t1232 = load i64, ptr %local.tc3.993
  %t1233 = call i64 @"meta_grad_p"(i64 %t1214, i64 %t1215, i64 %t1216, i64 %t1217, i64 %t1218, i64 %t1219, i64 5, i64 %t1220, i64 %t1221, i64 %t1222, i64 %t1223, i64 %t1224, i64 %t1225, i64 %t1226, i64 %t1227, i64 %t1228, i64 %t1229, i64 %t1230, i64 %t1231, i64 %t1232)
  store i64 %t1233, ptr %local.mg.973
  %t1234 = load i64, ptr %local.alpha_cb.966
  %t1235 = load i64, ptr %local.meta_lr.979
  %t1236 = load i64, ptr %local.mg.973
  %t1237 = call i64 @"sx_f64_mul"(i64 %t1235, i64 %t1236)
  %t1238 = call i64 @"sx_f64_sub"(i64 %t1234, i64 %t1237)
  %t1239 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.117)
  %t1240 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.118)
  %t1241 = call i64 @"clamp"(i64 %t1238, i64 %t1239, i64 %t1240)
  store i64 %t1241, ptr %local.alpha_cb.966
  %t1242 = load i64, ptr %local.alpha_ab.961
  %t1243 = load i64, ptr %local.prev_ab.967
  %t1244 = call i64 @"sx_f64_sub"(i64 %t1242, i64 %t1243)
  %t1245 = call i64 @"abs_f64"(i64 %t1244)
  %t1246 = load i64, ptr %local.alpha_ac.962
  %t1247 = load i64, ptr %local.prev_ac.968
  %t1248 = call i64 @"sx_f64_sub"(i64 %t1246, i64 %t1247)
  %t1249 = call i64 @"abs_f64"(i64 %t1248)
  %t1250 = call i64 @"sx_f64_add"(i64 %t1245, i64 %t1249)
  %t1251 = load i64, ptr %local.alpha_ba.963
  %t1252 = load i64, ptr %local.prev_ba.969
  %t1253 = call i64 @"sx_f64_sub"(i64 %t1251, i64 %t1252)
  %t1254 = call i64 @"abs_f64"(i64 %t1253)
  %t1255 = call i64 @"sx_f64_add"(i64 %t1250, i64 %t1254)
  %t1256 = load i64, ptr %local.alpha_bc.964
  %t1257 = load i64, ptr %local.prev_bc.970
  %t1258 = call i64 @"sx_f64_sub"(i64 %t1256, i64 %t1257)
  %t1259 = call i64 @"abs_f64"(i64 %t1258)
  %t1260 = call i64 @"sx_f64_add"(i64 %t1255, i64 %t1259)
  %t1261 = load i64, ptr %local.alpha_ca.965
  %t1262 = load i64, ptr %local.prev_ca.971
  %t1263 = call i64 @"sx_f64_sub"(i64 %t1261, i64 %t1262)
  %t1264 = call i64 @"abs_f64"(i64 %t1263)
  %t1265 = call i64 @"sx_f64_add"(i64 %t1260, i64 %t1264)
  %t1266 = load i64, ptr %local.alpha_cb.966
  %t1267 = load i64, ptr %local.prev_cb.972
  %t1268 = call i64 @"sx_f64_sub"(i64 %t1266, i64 %t1267)
  %t1269 = call i64 @"abs_f64"(i64 %t1268)
  %t1270 = call i64 @"sx_f64_add"(i64 %t1265, i64 %t1269)
  store i64 %t1270, ptr %local.drift.974
  %t1271 = load i64, ptr %local.cycle.994
  %t1272 = icmp sgt i64 %t1271, 0
  %t1273 = zext i1 %t1272 to i64
  %t1274 = icmp ne i64 %t1273, 0
  br i1 %t1274, label %then18, label %else18
then18:
  %t1275 = load i64, ptr %local.prev_drift.975
  %t1276 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.119)
  %t1277 = call i64 @"sx_f64_gt"(i64 %t1275, i64 %t1276)
  %t1278 = icmp ne i64 %t1277, 0
  br i1 %t1278, label %then19, label %else19
then19:
  %t1279 = load i64, ptr %local.drift.974
  %t1280 = load i64, ptr %local.prev_drift.975
  %t1281 = call i64 @"sx_f64_div"(i64 %t1279, i64 %t1280)
  store i64 %t1281, ptr %local.ratio.976
  br label %then19_end
then19_end:
  br label %endif19
else19:
  %t1282 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.120)
  store i64 %t1282, ptr %local.ratio.976
  br label %else19_end
else19_end:
  br label %endif19
endif19:
  %t1283 = phi i64 [ 0, %then19_end ], [ 0, %else19_end ]
  br label %then18_end
then18_end:
  br label %endif18
else18:
  %t1284 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.121)
  store i64 %t1284, ptr %local.ratio.976
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t1285 = phi i64 [ %t1283, %then18_end ], [ 0, %else18_end ]
  %t1286 = load i64, ptr %local.cycle.994
  %t1287 = icmp sge i64 %t1286, 80
  %t1288 = zext i1 %t1287 to i64
  %t1289 = icmp ne i64 %t1288, 0
  br i1 %t1289, label %then20, label %else20
then20:
  %t1290 = load i64, ptr %local.ratio_sum_last20.977
  %t1291 = load i64, ptr %local.ratio.976
  %t1292 = call i64 @"sx_f64_add"(i64 %t1290, i64 %t1291)
  store i64 %t1292, ptr %local.ratio_sum_last20.977
  %t1293 = load i64, ptr %local.ratio_count_last20.978
  %t1294 = add i64 %t1293, 1
  store i64 %t1294, ptr %local.ratio_count_last20.978
  br label %then20_end
then20_end:
  br label %endif20
else20:
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t1295 = phi i64 [ 0, %then20_end ], [ 0, %else20_end ]
  %t1296 = load i64, ptr %local.cycle.994
  %t1297 = icmp slt i64 %t1296, 5
  %t1298 = zext i1 %t1297 to i64
  %t1299 = icmp ne i64 %t1298, 0
  br i1 %t1299, label %then21, label %else21
then21:
  %t1300 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.122)
  %t1301 = ptrtoint ptr %t1300 to i64
  %t1302 = inttoptr i64 %t1301 to ptr
  call void @intrinsic_print(ptr %t1302)
  %t1303 = load i64, ptr %local.cycle.994
  call void @print_i64(i64 %t1303)
  %t1304 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.123)
  %t1305 = ptrtoint ptr %t1304 to i64
  %t1306 = inttoptr i64 %t1305 to ptr
  call void @intrinsic_print(ptr %t1306)
  %t1307 = load i64, ptr %local.drift.974
  %t1308 = call i64 @"print_f64"(i64 %t1307)
  %t1309 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.124)
  %t1310 = ptrtoint ptr %t1309 to i64
  %t1311 = inttoptr i64 %t1310 to ptr
  call void @intrinsic_print(ptr %t1311)
  %t1312 = load i64, ptr %local.ratio.976
  %t1313 = call i64 @"print_f64"(i64 %t1312)
  %t1314 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.125)
  %t1315 = ptrtoint ptr %t1314 to i64
  %t1316 = inttoptr i64 %t1315 to ptr
  call void @intrinsic_println(ptr %t1316)
  br label %then21_end
then21_end:
  br label %endif21
else21:
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t1317 = phi i64 [ 0, %then21_end ], [ 0, %else21_end ]
  %t1318 = load i64, ptr %local.cycle.994
  %t1319 = icmp sge i64 %t1318, 5
  %t1320 = zext i1 %t1319 to i64
  %t1321 = icmp ne i64 %t1320, 0
  br i1 %t1321, label %then22, label %else22
then22:
  %t1322 = load i64, ptr %local.cycle.994
  %t1323 = load i64, ptr %local.cycle.994
  %t1324 = sdiv i64 %t1323, 5
  %t1325 = mul i64 %t1324, 5
  %t1326 = sub i64 %t1322, %t1325
  store i64 %t1326, ptr %local.rem.995
  %t1327 = load i64, ptr %local.rem.995
  %t1328 = icmp eq i64 %t1327, 0
  %t1329 = zext i1 %t1328 to i64
  %t1330 = icmp ne i64 %t1329, 0
  br i1 %t1330, label %then23, label %else23
then23:
  %t1331 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.126)
  %t1332 = ptrtoint ptr %t1331 to i64
  %t1333 = inttoptr i64 %t1332 to ptr
  call void @intrinsic_print(ptr %t1333)
  %t1334 = load i64, ptr %local.cycle.994
  call void @print_i64(i64 %t1334)
  %t1335 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.127)
  %t1336 = ptrtoint ptr %t1335 to i64
  %t1337 = inttoptr i64 %t1336 to ptr
  call void @intrinsic_print(ptr %t1337)
  %t1338 = load i64, ptr %local.drift.974
  %t1339 = call i64 @"print_f64"(i64 %t1338)
  %t1340 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.128)
  %t1341 = ptrtoint ptr %t1340 to i64
  %t1342 = inttoptr i64 %t1341 to ptr
  call void @intrinsic_print(ptr %t1342)
  %t1343 = load i64, ptr %local.ratio.976
  %t1344 = call i64 @"print_f64"(i64 %t1343)
  %t1345 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.129)
  %t1346 = ptrtoint ptr %t1345 to i64
  %t1347 = inttoptr i64 %t1346 to ptr
  call void @intrinsic_println(ptr %t1347)
  br label %then23_end
then23_end:
  br label %endif23
else23:
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t1348 = phi i64 [ 0, %then23_end ], [ 0, %else23_end ]
  br label %then22_end
then22_end:
  br label %endif22
else22:
  br label %else22_end
else22_end:
  br label %endif22
endif22:
  %t1349 = phi i64 [ %t1348, %then22_end ], [ 0, %else22_end ]
  %t1350 = load i64, ptr %local.drift.974
  store i64 %t1350, ptr %local.prev_drift.975
  %t1351 = load i64, ptr %local.cycle.994
  %t1352 = add i64 %t1351, 1
  store i64 %t1352, ptr %local.cycle.994
  br label %loop17
endloop17:
  %t1353 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.130)
  %t1354 = ptrtoint ptr %t1353 to i64
  %t1355 = inttoptr i64 %t1354 to ptr
  call void @intrinsic_println(ptr %t1355)
  %t1356 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.131)
  %t1357 = ptrtoint ptr %t1356 to i64
  %t1358 = inttoptr i64 %t1357 to ptr
  call void @intrinsic_print(ptr %t1358)
  %t1359 = load i64, ptr %local.ratio_count_last20.978
  %t1360 = icmp sgt i64 %t1359, 0
  %t1361 = zext i1 %t1360 to i64
  %t1362 = icmp ne i64 %t1361, 0
  br i1 %t1362, label %then24, label %else24
then24:
  %t1363 = load i64, ptr %local.ratio_sum_last20.977
  %t1364 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.132)
  %t1365 = call i64 @"sx_f64_div"(i64 %t1363, i64 %t1364)
  store i64 %t1365, ptr %local.avg_r.996
  %t1366 = load i64, ptr %local.avg_r.996
  %t1367 = call i64 @"print_f64"(i64 %t1366)
  %t1368 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.133)
  %t1369 = ptrtoint ptr %t1368 to i64
  %t1370 = inttoptr i64 %t1369 to ptr
  call void @intrinsic_println(ptr %t1370)
  %t1371 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.134)
  store i64 %t1371, ptr %local.phi.997
  %t1372 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.135)
  store i64 %t1372, ptr %local.inv_phi.998
  %t1373 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.136)
  store i64 %t1373, ptr %local.inv_e.999
  %t1374 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.137)
  store i64 %t1374, ptr %local.one_over_pi.1000
  %t1375 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.138)
  %t1376 = ptrtoint ptr %t1375 to i64
  %t1377 = inttoptr i64 %t1376 to ptr
  call void @intrinsic_println(ptr %t1377)
  %t1378 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.139)
  %t1379 = ptrtoint ptr %t1378 to i64
  %t1380 = inttoptr i64 %t1379 to ptr
  call void @intrinsic_println(ptr %t1380)
  %t1381 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.140)
  %t1382 = ptrtoint ptr %t1381 to i64
  %t1383 = inttoptr i64 %t1382 to ptr
  call void @intrinsic_print(ptr %t1383)
  %t1384 = load i64, ptr %local.avg_r.996
  %t1385 = call i64 @"print_f64"(i64 %t1384)
  %t1386 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.141)
  %t1387 = ptrtoint ptr %t1386 to i64
  %t1388 = inttoptr i64 %t1387 to ptr
  call void @intrinsic_println(ptr %t1388)
  %t1389 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.142)
  %t1390 = ptrtoint ptr %t1389 to i64
  %t1391 = inttoptr i64 %t1390 to ptr
  call void @intrinsic_print(ptr %t1391)
  %t1392 = load i64, ptr %local.inv_phi.998
  %t1393 = call i64 @"print_f64"(i64 %t1392)
  %t1394 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.143)
  %t1395 = ptrtoint ptr %t1394 to i64
  %t1396 = inttoptr i64 %t1395 to ptr
  call void @intrinsic_println(ptr %t1396)
  %t1397 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.144)
  %t1398 = ptrtoint ptr %t1397 to i64
  %t1399 = inttoptr i64 %t1398 to ptr
  call void @intrinsic_print(ptr %t1399)
  %t1400 = load i64, ptr %local.inv_e.999
  %t1401 = call i64 @"print_f64"(i64 %t1400)
  %t1402 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.145)
  %t1403 = ptrtoint ptr %t1402 to i64
  %t1404 = inttoptr i64 %t1403 to ptr
  call void @intrinsic_println(ptr %t1404)
  %t1405 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.146)
  %t1406 = ptrtoint ptr %t1405 to i64
  %t1407 = inttoptr i64 %t1406 to ptr
  call void @intrinsic_print(ptr %t1407)
  %t1408 = load i64, ptr %local.one_over_pi.1000
  %t1409 = call i64 @"print_f64"(i64 %t1408)
  %t1410 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.147)
  %t1411 = ptrtoint ptr %t1410 to i64
  %t1412 = inttoptr i64 %t1411 to ptr
  call void @intrinsic_println(ptr %t1412)
  %t1413 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.148)
  %t1414 = ptrtoint ptr %t1413 to i64
  %t1415 = inttoptr i64 %t1414 to ptr
  call void @intrinsic_print(ptr %t1415)
  %t1416 = load i64, ptr %local.avg_r.996
  %t1417 = load i64, ptr %local.inv_phi.998
  %t1418 = call i64 @"sx_f64_sub"(i64 %t1416, i64 %t1417)
  %t1419 = call i64 @"abs_f64"(i64 %t1418)
  %t1420 = call i64 @"print_f64"(i64 %t1419)
  %t1421 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.149)
  %t1422 = ptrtoint ptr %t1421 to i64
  %t1423 = inttoptr i64 %t1422 to ptr
  call void @intrinsic_println(ptr %t1423)
  %t1424 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.150)
  %t1425 = ptrtoint ptr %t1424 to i64
  %t1426 = inttoptr i64 %t1425 to ptr
  call void @intrinsic_print(ptr %t1426)
  %t1427 = load i64, ptr %local.avg_r.996
  %t1428 = load i64, ptr %local.inv_e.999
  %t1429 = call i64 @"sx_f64_sub"(i64 %t1427, i64 %t1428)
  %t1430 = call i64 @"abs_f64"(i64 %t1429)
  %t1431 = call i64 @"print_f64"(i64 %t1430)
  %t1432 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.151)
  %t1433 = ptrtoint ptr %t1432 to i64
  %t1434 = inttoptr i64 %t1433 to ptr
  call void @intrinsic_println(ptr %t1434)
  %t1435 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.152)
  %t1436 = ptrtoint ptr %t1435 to i64
  %t1437 = inttoptr i64 %t1436 to ptr
  call void @intrinsic_print(ptr %t1437)
  %t1438 = load i64, ptr %local.avg_r.996
  %t1439 = load i64, ptr %local.one_over_pi.1000
  %t1440 = call i64 @"sx_f64_sub"(i64 %t1438, i64 %t1439)
  %t1441 = call i64 @"abs_f64"(i64 %t1440)
  %t1442 = call i64 @"print_f64"(i64 %t1441)
  %t1443 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.153)
  %t1444 = ptrtoint ptr %t1443 to i64
  %t1445 = inttoptr i64 %t1444 to ptr
  call void @intrinsic_println(ptr %t1445)
  br label %then24_end
then24_end:
  br label %endif24
else24:
  %t1446 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.154)
  %t1447 = ptrtoint ptr %t1446 to i64
  %t1448 = inttoptr i64 %t1447 to ptr
  call void @intrinsic_println(ptr %t1448)
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t1449 = phi i64 [ 0, %then24_end ], [ 0, %else24_end ]
  %t1450 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.155)
  %t1451 = ptrtoint ptr %t1450 to i64
  %t1452 = inttoptr i64 %t1451 to ptr
  call void @intrinsic_println(ptr %t1452)
  %t1453 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.156)
  %t1454 = ptrtoint ptr %t1453 to i64
  %t1455 = inttoptr i64 %t1454 to ptr
  call void @intrinsic_println(ptr %t1455)
  %t1456 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.157)
  %t1457 = ptrtoint ptr %t1456 to i64
  %t1458 = inttoptr i64 %t1457 to ptr
  call void @intrinsic_print(ptr %t1458)
  %t1459 = load i64, ptr %local.alpha_ab.961
  %t1460 = call i64 @"print_f64"(i64 %t1459)
  %t1461 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.158)
  %t1462 = ptrtoint ptr %t1461 to i64
  %t1463 = inttoptr i64 %t1462 to ptr
  call void @intrinsic_print(ptr %t1463)
  %t1464 = load i64, ptr %local.alpha_ac.962
  %t1465 = call i64 @"print_f64"(i64 %t1464)
  %t1466 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.159)
  %t1467 = ptrtoint ptr %t1466 to i64
  %t1468 = inttoptr i64 %t1467 to ptr
  call void @intrinsic_println(ptr %t1468)
  %t1469 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.160)
  %t1470 = ptrtoint ptr %t1469 to i64
  %t1471 = inttoptr i64 %t1470 to ptr
  call void @intrinsic_print(ptr %t1471)
  %t1472 = load i64, ptr %local.alpha_ba.963
  %t1473 = call i64 @"print_f64"(i64 %t1472)
  %t1474 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.161)
  %t1475 = ptrtoint ptr %t1474 to i64
  %t1476 = inttoptr i64 %t1475 to ptr
  call void @intrinsic_print(ptr %t1476)
  %t1477 = load i64, ptr %local.alpha_bc.964
  %t1478 = call i64 @"print_f64"(i64 %t1477)
  %t1479 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.162)
  %t1480 = ptrtoint ptr %t1479 to i64
  %t1481 = inttoptr i64 %t1480 to ptr
  call void @intrinsic_println(ptr %t1481)
  %t1482 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.163)
  %t1483 = ptrtoint ptr %t1482 to i64
  %t1484 = inttoptr i64 %t1483 to ptr
  call void @intrinsic_print(ptr %t1484)
  %t1485 = load i64, ptr %local.alpha_ca.965
  %t1486 = call i64 @"print_f64"(i64 %t1485)
  %t1487 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.164)
  %t1488 = ptrtoint ptr %t1487 to i64
  %t1489 = inttoptr i64 %t1488 to ptr
  call void @intrinsic_print(ptr %t1489)
  %t1490 = load i64, ptr %local.alpha_cb.966
  %t1491 = call i64 @"print_f64"(i64 %t1490)
  %t1492 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.165)
  %t1493 = ptrtoint ptr %t1492 to i64
  %t1494 = inttoptr i64 %t1493 to ptr
  call void @intrinsic_println(ptr %t1494)
  ret i64 0
}

define i64 @"compute_avg_ratio"(i64 %ta0, i64 %ta1, i64 %ta2, i64 %ta3, i64 %tb0, i64 %tb1, i64 %tb2, i64 %tb3, i64 %tc0, i64 %tc1, i64 %tc2, i64 %tc3, i64 %num_cycles) nounwind {
entry:
  %local.alpha_ab.1495 = alloca i64
  %local.alpha_ac.1496 = alloca i64
  %local.alpha_ba.1497 = alloca i64
  %local.alpha_bc.1498 = alloca i64
  %local.alpha_ca.1499 = alloca i64
  %local.alpha_cb.1500 = alloca i64
  %local.prev_ab.1501 = alloca i64
  %local.prev_ac.1502 = alloca i64
  %local.prev_ba.1503 = alloca i64
  %local.prev_bc.1504 = alloca i64
  %local.prev_ca.1505 = alloca i64
  %local.prev_cb.1506 = alloca i64
  %local.mg.1507 = alloca i64
  %local.drift.1508 = alloca i64
  %local.prev_drift.1509 = alloca i64
  %local.ratio.1510 = alloca i64
  %local.ratio_sum.1511 = alloca i64
  %local.ratio_count.1512 = alloca i64
  %local.meta_lr.1513 = alloca i64
  %local.inner_steps.1514 = alloca i64
  %local.tail.1515 = alloca i64
  %local.cycle.1516 = alloca i64
  %local.rc_f.1517 = alloca i64
  %local.ta0 = alloca i64
  store i64 %ta0, ptr %local.ta0
  %local.ta1 = alloca i64
  store i64 %ta1, ptr %local.ta1
  %local.ta2 = alloca i64
  store i64 %ta2, ptr %local.ta2
  %local.ta3 = alloca i64
  store i64 %ta3, ptr %local.ta3
  %local.tb0 = alloca i64
  store i64 %tb0, ptr %local.tb0
  %local.tb1 = alloca i64
  store i64 %tb1, ptr %local.tb1
  %local.tb2 = alloca i64
  store i64 %tb2, ptr %local.tb2
  %local.tb3 = alloca i64
  store i64 %tb3, ptr %local.tb3
  %local.tc0 = alloca i64
  store i64 %tc0, ptr %local.tc0
  %local.tc1 = alloca i64
  store i64 %tc1, ptr %local.tc1
  %local.tc2 = alloca i64
  store i64 %tc2, ptr %local.tc2
  %local.tc3 = alloca i64
  store i64 %tc3, ptr %local.tc3
  %local.num_cycles = alloca i64
  store i64 %num_cycles, ptr %local.num_cycles
  %t1518 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.166)
  store i64 %t1518, ptr %local.alpha_ab.1495
  %t1519 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.167)
  store i64 %t1519, ptr %local.alpha_ac.1496
  %t1520 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.168)
  store i64 %t1520, ptr %local.alpha_ba.1497
  %t1521 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.169)
  store i64 %t1521, ptr %local.alpha_bc.1498
  %t1522 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.170)
  store i64 %t1522, ptr %local.alpha_ca.1499
  %t1523 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.171)
  store i64 %t1523, ptr %local.alpha_cb.1500
  %t1524 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.172)
  store i64 %t1524, ptr %local.prev_ab.1501
  %t1525 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.173)
  store i64 %t1525, ptr %local.prev_ac.1502
  %t1526 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.174)
  store i64 %t1526, ptr %local.prev_ba.1503
  %t1527 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.175)
  store i64 %t1527, ptr %local.prev_bc.1504
  %t1528 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.176)
  store i64 %t1528, ptr %local.prev_ca.1505
  %t1529 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.177)
  store i64 %t1529, ptr %local.prev_cb.1506
  %t1530 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.178)
  store i64 %t1530, ptr %local.mg.1507
  %t1531 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.179)
  store i64 %t1531, ptr %local.drift.1508
  %t1532 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.180)
  store i64 %t1532, ptr %local.prev_drift.1509
  %t1533 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.181)
  store i64 %t1533, ptr %local.ratio.1510
  %t1534 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.182)
  store i64 %t1534, ptr %local.ratio_sum.1511
  store i64 0, ptr %local.ratio_count.1512
  %t1535 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.183)
  store i64 %t1535, ptr %local.meta_lr.1513
  store i64 200, ptr %local.inner_steps.1514
  %t1536 = load i64, ptr %local.num_cycles
  %t1537 = sub i64 %t1536, 20
  store i64 %t1537, ptr %local.tail.1515
  store i64 0, ptr %local.cycle.1516
  br label %loop25
loop25:
  %t1538 = load i64, ptr %local.cycle.1516
  %t1539 = load i64, ptr %local.num_cycles
  %t1540 = icmp slt i64 %t1538, %t1539
  %t1541 = zext i1 %t1540 to i64
  %t1542 = icmp ne i64 %t1541, 0
  br i1 %t1542, label %body25, label %endloop25
body25:
  %t1543 = load i64, ptr %local.alpha_ab.1495
  store i64 %t1543, ptr %local.prev_ab.1501
  %t1544 = load i64, ptr %local.alpha_ac.1496
  store i64 %t1544, ptr %local.prev_ac.1502
  %t1545 = load i64, ptr %local.alpha_ba.1497
  store i64 %t1545, ptr %local.prev_ba.1503
  %t1546 = load i64, ptr %local.alpha_bc.1498
  store i64 %t1546, ptr %local.prev_bc.1504
  %t1547 = load i64, ptr %local.alpha_ca.1499
  store i64 %t1547, ptr %local.prev_ca.1505
  %t1548 = load i64, ptr %local.alpha_cb.1500
  store i64 %t1548, ptr %local.prev_cb.1506
  %t1549 = load i64, ptr %local.alpha_ab.1495
  %t1550 = load i64, ptr %local.alpha_ac.1496
  %t1551 = load i64, ptr %local.alpha_ba.1497
  %t1552 = load i64, ptr %local.alpha_bc.1498
  %t1553 = load i64, ptr %local.alpha_ca.1499
  %t1554 = load i64, ptr %local.alpha_cb.1500
  %t1555 = load i64, ptr %local.inner_steps.1514
  %t1556 = load i64, ptr %local.ta0
  %t1557 = load i64, ptr %local.ta1
  %t1558 = load i64, ptr %local.ta2
  %t1559 = load i64, ptr %local.ta3
  %t1560 = load i64, ptr %local.tb0
  %t1561 = load i64, ptr %local.tb1
  %t1562 = load i64, ptr %local.tb2
  %t1563 = load i64, ptr %local.tb3
  %t1564 = load i64, ptr %local.tc0
  %t1565 = load i64, ptr %local.tc1
  %t1566 = load i64, ptr %local.tc2
  %t1567 = load i64, ptr %local.tc3
  %t1568 = call i64 @"meta_grad_p"(i64 %t1549, i64 %t1550, i64 %t1551, i64 %t1552, i64 %t1553, i64 %t1554, i64 0, i64 %t1555, i64 %t1556, i64 %t1557, i64 %t1558, i64 %t1559, i64 %t1560, i64 %t1561, i64 %t1562, i64 %t1563, i64 %t1564, i64 %t1565, i64 %t1566, i64 %t1567)
  store i64 %t1568, ptr %local.mg.1507
  %t1569 = load i64, ptr %local.alpha_ab.1495
  %t1570 = load i64, ptr %local.meta_lr.1513
  %t1571 = load i64, ptr %local.mg.1507
  %t1572 = call i64 @"sx_f64_mul"(i64 %t1570, i64 %t1571)
  %t1573 = call i64 @"sx_f64_sub"(i64 %t1569, i64 %t1572)
  %t1574 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.184)
  %t1575 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.185)
  %t1576 = call i64 @"clamp"(i64 %t1573, i64 %t1574, i64 %t1575)
  store i64 %t1576, ptr %local.alpha_ab.1495
  %t1577 = load i64, ptr %local.alpha_ab.1495
  %t1578 = load i64, ptr %local.alpha_ac.1496
  %t1579 = load i64, ptr %local.alpha_ba.1497
  %t1580 = load i64, ptr %local.alpha_bc.1498
  %t1581 = load i64, ptr %local.alpha_ca.1499
  %t1582 = load i64, ptr %local.alpha_cb.1500
  %t1583 = load i64, ptr %local.inner_steps.1514
  %t1584 = load i64, ptr %local.ta0
  %t1585 = load i64, ptr %local.ta1
  %t1586 = load i64, ptr %local.ta2
  %t1587 = load i64, ptr %local.ta3
  %t1588 = load i64, ptr %local.tb0
  %t1589 = load i64, ptr %local.tb1
  %t1590 = load i64, ptr %local.tb2
  %t1591 = load i64, ptr %local.tb3
  %t1592 = load i64, ptr %local.tc0
  %t1593 = load i64, ptr %local.tc1
  %t1594 = load i64, ptr %local.tc2
  %t1595 = load i64, ptr %local.tc3
  %t1596 = call i64 @"meta_grad_p"(i64 %t1577, i64 %t1578, i64 %t1579, i64 %t1580, i64 %t1581, i64 %t1582, i64 1, i64 %t1583, i64 %t1584, i64 %t1585, i64 %t1586, i64 %t1587, i64 %t1588, i64 %t1589, i64 %t1590, i64 %t1591, i64 %t1592, i64 %t1593, i64 %t1594, i64 %t1595)
  store i64 %t1596, ptr %local.mg.1507
  %t1597 = load i64, ptr %local.alpha_ac.1496
  %t1598 = load i64, ptr %local.meta_lr.1513
  %t1599 = load i64, ptr %local.mg.1507
  %t1600 = call i64 @"sx_f64_mul"(i64 %t1598, i64 %t1599)
  %t1601 = call i64 @"sx_f64_sub"(i64 %t1597, i64 %t1600)
  %t1602 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.186)
  %t1603 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.187)
  %t1604 = call i64 @"clamp"(i64 %t1601, i64 %t1602, i64 %t1603)
  store i64 %t1604, ptr %local.alpha_ac.1496
  %t1605 = load i64, ptr %local.alpha_ab.1495
  %t1606 = load i64, ptr %local.alpha_ac.1496
  %t1607 = load i64, ptr %local.alpha_ba.1497
  %t1608 = load i64, ptr %local.alpha_bc.1498
  %t1609 = load i64, ptr %local.alpha_ca.1499
  %t1610 = load i64, ptr %local.alpha_cb.1500
  %t1611 = load i64, ptr %local.inner_steps.1514
  %t1612 = load i64, ptr %local.ta0
  %t1613 = load i64, ptr %local.ta1
  %t1614 = load i64, ptr %local.ta2
  %t1615 = load i64, ptr %local.ta3
  %t1616 = load i64, ptr %local.tb0
  %t1617 = load i64, ptr %local.tb1
  %t1618 = load i64, ptr %local.tb2
  %t1619 = load i64, ptr %local.tb3
  %t1620 = load i64, ptr %local.tc0
  %t1621 = load i64, ptr %local.tc1
  %t1622 = load i64, ptr %local.tc2
  %t1623 = load i64, ptr %local.tc3
  %t1624 = call i64 @"meta_grad_p"(i64 %t1605, i64 %t1606, i64 %t1607, i64 %t1608, i64 %t1609, i64 %t1610, i64 2, i64 %t1611, i64 %t1612, i64 %t1613, i64 %t1614, i64 %t1615, i64 %t1616, i64 %t1617, i64 %t1618, i64 %t1619, i64 %t1620, i64 %t1621, i64 %t1622, i64 %t1623)
  store i64 %t1624, ptr %local.mg.1507
  %t1625 = load i64, ptr %local.alpha_ba.1497
  %t1626 = load i64, ptr %local.meta_lr.1513
  %t1627 = load i64, ptr %local.mg.1507
  %t1628 = call i64 @"sx_f64_mul"(i64 %t1626, i64 %t1627)
  %t1629 = call i64 @"sx_f64_sub"(i64 %t1625, i64 %t1628)
  %t1630 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.188)
  %t1631 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.189)
  %t1632 = call i64 @"clamp"(i64 %t1629, i64 %t1630, i64 %t1631)
  store i64 %t1632, ptr %local.alpha_ba.1497
  %t1633 = load i64, ptr %local.alpha_ab.1495
  %t1634 = load i64, ptr %local.alpha_ac.1496
  %t1635 = load i64, ptr %local.alpha_ba.1497
  %t1636 = load i64, ptr %local.alpha_bc.1498
  %t1637 = load i64, ptr %local.alpha_ca.1499
  %t1638 = load i64, ptr %local.alpha_cb.1500
  %t1639 = load i64, ptr %local.inner_steps.1514
  %t1640 = load i64, ptr %local.ta0
  %t1641 = load i64, ptr %local.ta1
  %t1642 = load i64, ptr %local.ta2
  %t1643 = load i64, ptr %local.ta3
  %t1644 = load i64, ptr %local.tb0
  %t1645 = load i64, ptr %local.tb1
  %t1646 = load i64, ptr %local.tb2
  %t1647 = load i64, ptr %local.tb3
  %t1648 = load i64, ptr %local.tc0
  %t1649 = load i64, ptr %local.tc1
  %t1650 = load i64, ptr %local.tc2
  %t1651 = load i64, ptr %local.tc3
  %t1652 = call i64 @"meta_grad_p"(i64 %t1633, i64 %t1634, i64 %t1635, i64 %t1636, i64 %t1637, i64 %t1638, i64 3, i64 %t1639, i64 %t1640, i64 %t1641, i64 %t1642, i64 %t1643, i64 %t1644, i64 %t1645, i64 %t1646, i64 %t1647, i64 %t1648, i64 %t1649, i64 %t1650, i64 %t1651)
  store i64 %t1652, ptr %local.mg.1507
  %t1653 = load i64, ptr %local.alpha_bc.1498
  %t1654 = load i64, ptr %local.meta_lr.1513
  %t1655 = load i64, ptr %local.mg.1507
  %t1656 = call i64 @"sx_f64_mul"(i64 %t1654, i64 %t1655)
  %t1657 = call i64 @"sx_f64_sub"(i64 %t1653, i64 %t1656)
  %t1658 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.190)
  %t1659 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.191)
  %t1660 = call i64 @"clamp"(i64 %t1657, i64 %t1658, i64 %t1659)
  store i64 %t1660, ptr %local.alpha_bc.1498
  %t1661 = load i64, ptr %local.alpha_ab.1495
  %t1662 = load i64, ptr %local.alpha_ac.1496
  %t1663 = load i64, ptr %local.alpha_ba.1497
  %t1664 = load i64, ptr %local.alpha_bc.1498
  %t1665 = load i64, ptr %local.alpha_ca.1499
  %t1666 = load i64, ptr %local.alpha_cb.1500
  %t1667 = load i64, ptr %local.inner_steps.1514
  %t1668 = load i64, ptr %local.ta0
  %t1669 = load i64, ptr %local.ta1
  %t1670 = load i64, ptr %local.ta2
  %t1671 = load i64, ptr %local.ta3
  %t1672 = load i64, ptr %local.tb0
  %t1673 = load i64, ptr %local.tb1
  %t1674 = load i64, ptr %local.tb2
  %t1675 = load i64, ptr %local.tb3
  %t1676 = load i64, ptr %local.tc0
  %t1677 = load i64, ptr %local.tc1
  %t1678 = load i64, ptr %local.tc2
  %t1679 = load i64, ptr %local.tc3
  %t1680 = call i64 @"meta_grad_p"(i64 %t1661, i64 %t1662, i64 %t1663, i64 %t1664, i64 %t1665, i64 %t1666, i64 4, i64 %t1667, i64 %t1668, i64 %t1669, i64 %t1670, i64 %t1671, i64 %t1672, i64 %t1673, i64 %t1674, i64 %t1675, i64 %t1676, i64 %t1677, i64 %t1678, i64 %t1679)
  store i64 %t1680, ptr %local.mg.1507
  %t1681 = load i64, ptr %local.alpha_ca.1499
  %t1682 = load i64, ptr %local.meta_lr.1513
  %t1683 = load i64, ptr %local.mg.1507
  %t1684 = call i64 @"sx_f64_mul"(i64 %t1682, i64 %t1683)
  %t1685 = call i64 @"sx_f64_sub"(i64 %t1681, i64 %t1684)
  %t1686 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.192)
  %t1687 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.193)
  %t1688 = call i64 @"clamp"(i64 %t1685, i64 %t1686, i64 %t1687)
  store i64 %t1688, ptr %local.alpha_ca.1499
  %t1689 = load i64, ptr %local.alpha_ab.1495
  %t1690 = load i64, ptr %local.alpha_ac.1496
  %t1691 = load i64, ptr %local.alpha_ba.1497
  %t1692 = load i64, ptr %local.alpha_bc.1498
  %t1693 = load i64, ptr %local.alpha_ca.1499
  %t1694 = load i64, ptr %local.alpha_cb.1500
  %t1695 = load i64, ptr %local.inner_steps.1514
  %t1696 = load i64, ptr %local.ta0
  %t1697 = load i64, ptr %local.ta1
  %t1698 = load i64, ptr %local.ta2
  %t1699 = load i64, ptr %local.ta3
  %t1700 = load i64, ptr %local.tb0
  %t1701 = load i64, ptr %local.tb1
  %t1702 = load i64, ptr %local.tb2
  %t1703 = load i64, ptr %local.tb3
  %t1704 = load i64, ptr %local.tc0
  %t1705 = load i64, ptr %local.tc1
  %t1706 = load i64, ptr %local.tc2
  %t1707 = load i64, ptr %local.tc3
  %t1708 = call i64 @"meta_grad_p"(i64 %t1689, i64 %t1690, i64 %t1691, i64 %t1692, i64 %t1693, i64 %t1694, i64 5, i64 %t1695, i64 %t1696, i64 %t1697, i64 %t1698, i64 %t1699, i64 %t1700, i64 %t1701, i64 %t1702, i64 %t1703, i64 %t1704, i64 %t1705, i64 %t1706, i64 %t1707)
  store i64 %t1708, ptr %local.mg.1507
  %t1709 = load i64, ptr %local.alpha_cb.1500
  %t1710 = load i64, ptr %local.meta_lr.1513
  %t1711 = load i64, ptr %local.mg.1507
  %t1712 = call i64 @"sx_f64_mul"(i64 %t1710, i64 %t1711)
  %t1713 = call i64 @"sx_f64_sub"(i64 %t1709, i64 %t1712)
  %t1714 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.194)
  %t1715 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.195)
  %t1716 = call i64 @"clamp"(i64 %t1713, i64 %t1714, i64 %t1715)
  store i64 %t1716, ptr %local.alpha_cb.1500
  %t1717 = load i64, ptr %local.alpha_ab.1495
  %t1718 = load i64, ptr %local.prev_ab.1501
  %t1719 = call i64 @"sx_f64_sub"(i64 %t1717, i64 %t1718)
  %t1720 = call i64 @"abs_f64"(i64 %t1719)
  %t1721 = load i64, ptr %local.alpha_ac.1496
  %t1722 = load i64, ptr %local.prev_ac.1502
  %t1723 = call i64 @"sx_f64_sub"(i64 %t1721, i64 %t1722)
  %t1724 = call i64 @"abs_f64"(i64 %t1723)
  %t1725 = call i64 @"sx_f64_add"(i64 %t1720, i64 %t1724)
  %t1726 = load i64, ptr %local.alpha_ba.1497
  %t1727 = load i64, ptr %local.prev_ba.1503
  %t1728 = call i64 @"sx_f64_sub"(i64 %t1726, i64 %t1727)
  %t1729 = call i64 @"abs_f64"(i64 %t1728)
  %t1730 = call i64 @"sx_f64_add"(i64 %t1725, i64 %t1729)
  %t1731 = load i64, ptr %local.alpha_bc.1498
  %t1732 = load i64, ptr %local.prev_bc.1504
  %t1733 = call i64 @"sx_f64_sub"(i64 %t1731, i64 %t1732)
  %t1734 = call i64 @"abs_f64"(i64 %t1733)
  %t1735 = call i64 @"sx_f64_add"(i64 %t1730, i64 %t1734)
  %t1736 = load i64, ptr %local.alpha_ca.1499
  %t1737 = load i64, ptr %local.prev_ca.1505
  %t1738 = call i64 @"sx_f64_sub"(i64 %t1736, i64 %t1737)
  %t1739 = call i64 @"abs_f64"(i64 %t1738)
  %t1740 = call i64 @"sx_f64_add"(i64 %t1735, i64 %t1739)
  %t1741 = load i64, ptr %local.alpha_cb.1500
  %t1742 = load i64, ptr %local.prev_cb.1506
  %t1743 = call i64 @"sx_f64_sub"(i64 %t1741, i64 %t1742)
  %t1744 = call i64 @"abs_f64"(i64 %t1743)
  %t1745 = call i64 @"sx_f64_add"(i64 %t1740, i64 %t1744)
  store i64 %t1745, ptr %local.drift.1508
  %t1746 = load i64, ptr %local.cycle.1516
  %t1747 = icmp sgt i64 %t1746, 0
  %t1748 = zext i1 %t1747 to i64
  %t1749 = icmp ne i64 %t1748, 0
  br i1 %t1749, label %then26, label %else26
then26:
  %t1750 = load i64, ptr %local.prev_drift.1509
  %t1751 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.196)
  %t1752 = call i64 @"sx_f64_gt"(i64 %t1750, i64 %t1751)
  %t1753 = icmp ne i64 %t1752, 0
  br i1 %t1753, label %then27, label %else27
then27:
  %t1754 = load i64, ptr %local.drift.1508
  %t1755 = load i64, ptr %local.prev_drift.1509
  %t1756 = call i64 @"sx_f64_div"(i64 %t1754, i64 %t1755)
  store i64 %t1756, ptr %local.ratio.1510
  %t1757 = load i64, ptr %local.cycle.1516
  %t1758 = load i64, ptr %local.tail.1515
  %t1759 = icmp sge i64 %t1757, %t1758
  %t1760 = zext i1 %t1759 to i64
  %t1761 = icmp ne i64 %t1760, 0
  br i1 %t1761, label %then28, label %else28
then28:
  %t1762 = load i64, ptr %local.ratio_sum.1511
  %t1763 = load i64, ptr %local.ratio.1510
  %t1764 = call i64 @"sx_f64_add"(i64 %t1762, i64 %t1763)
  store i64 %t1764, ptr %local.ratio_sum.1511
  %t1765 = load i64, ptr %local.ratio_count.1512
  %t1766 = add i64 %t1765, 1
  store i64 %t1766, ptr %local.ratio_count.1512
  br label %then28_end
then28_end:
  br label %endif28
else28:
  br label %else28_end
else28_end:
  br label %endif28
endif28:
  %t1767 = phi i64 [ 0, %then28_end ], [ 0, %else28_end ]
  br label %then27_end
then27_end:
  br label %endif27
else27:
  br label %else27_end
else27_end:
  br label %endif27
endif27:
  %t1768 = phi i64 [ %t1767, %then27_end ], [ 0, %else27_end ]
  br label %then26_end
then26_end:
  br label %endif26
else26:
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t1769 = phi i64 [ %t1768, %then26_end ], [ 0, %else26_end ]
  %t1770 = load i64, ptr %local.drift.1508
  store i64 %t1770, ptr %local.prev_drift.1509
  %t1771 = load i64, ptr %local.cycle.1516
  %t1772 = add i64 %t1771, 1
  store i64 %t1772, ptr %local.cycle.1516
  br label %loop25
endloop25:
  %t1773 = load i64, ptr %local.ratio_count.1512
  %t1774 = icmp sgt i64 %t1773, 0
  %t1775 = zext i1 %t1774 to i64
  %t1776 = icmp ne i64 %t1775, 0
  br i1 %t1776, label %then29, label %else29
then29:
  %t1777 = load i64, ptr %local.ratio_count.1512
  store i64 %t1777, ptr %local.rc_f.1517
  %t1778 = load i64, ptr %local.ratio_sum.1511
  %t1779 = load i64, ptr %local.rc_f.1517
  %t1780 = call i64 @"sx_f64_div"(i64 %t1778, i64 %t1779)
  br label %then29_end
then29_end:
  br label %endif29
else29:
  %t1781 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.197)
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t1782 = phi i64 [ %t1780, %then29_end ], [ %t1781, %else29_end ]
  ret i64 %t1782
}

define i64 @"run_exp2"() nounwind {
entry:
  %local.num_cycles.1783 = alloca i64
  %local.r1.1784 = alloca i64
  %local.r2.1785 = alloca i64
  %local.r3.1786 = alloca i64
  %local.spread.1787 = alloca i64
  %t1788 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.198)
  %t1789 = ptrtoint ptr %t1788 to i64
  %t1790 = inttoptr i64 %t1789 to ptr
  call void @intrinsic_println(ptr %t1790)
  %t1791 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.199)
  %t1792 = ptrtoint ptr %t1791 to i64
  %t1793 = inttoptr i64 %t1792 to ptr
  call void @intrinsic_println(ptr %t1793)
  %t1794 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.200)
  %t1795 = ptrtoint ptr %t1794 to i64
  %t1796 = inttoptr i64 %t1795 to ptr
  call void @intrinsic_println(ptr %t1796)
  %t1797 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.201)
  %t1798 = ptrtoint ptr %t1797 to i64
  %t1799 = inttoptr i64 %t1798 to ptr
  call void @intrinsic_println(ptr %t1799)
  %t1800 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.202)
  %t1801 = ptrtoint ptr %t1800 to i64
  %t1802 = inttoptr i64 %t1801 to ptr
  call void @intrinsic_println(ptr %t1802)
  %t1803 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.203)
  %t1804 = ptrtoint ptr %t1803 to i64
  %t1805 = inttoptr i64 %t1804 to ptr
  call void @intrinsic_println(ptr %t1805)
  store i64 60, ptr %local.num_cycles.1783
  %t1806 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.204)
  %t1807 = ptrtoint ptr %t1806 to i64
  %t1808 = inttoptr i64 %t1807 to ptr
  call void @intrinsic_println(ptr %t1808)
  %t1809 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.205)
  %t1810 = ptrtoint ptr %t1809 to i64
  %t1811 = inttoptr i64 %t1810 to ptr
  call void @intrinsic_print(ptr %t1811)
  %t1812 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.206)
  %t1813 = ptrtoint ptr %t1812 to i64
  %t1814 = inttoptr i64 %t1813 to ptr
  call void @intrinsic_println(ptr %t1814)
  %t1815 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.207)
  %t1816 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.208)
  %t1817 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.209)
  %t1818 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.210)
  %t1819 = call i64 @"sx_f64_sub"(i64 %t1817, i64 %t1818)
  %t1820 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.211)
  %t1821 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.212)
  %t1822 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.213)
  %t1823 = call i64 @"sx_f64_sub"(i64 %t1821, i64 %t1822)
  %t1824 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.214)
  %t1825 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.215)
  %t1826 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.216)
  %t1827 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.217)
  %t1828 = call i64 @"sx_f64_sub"(i64 %t1826, i64 %t1827)
  %t1829 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.218)
  %t1830 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.219)
  %t1831 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.220)
  %t1832 = call i64 @"sx_f64_sub"(i64 %t1830, i64 %t1831)
  %t1833 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.221)
  %t1834 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.222)
  %t1835 = load i64, ptr %local.num_cycles.1783
  %t1836 = call i64 @"compute_avg_ratio"(i64 %t1815, i64 %t1816, i64 %t1819, i64 %t1820, i64 %t1823, i64 %t1824, i64 %t1825, i64 %t1828, i64 %t1829, i64 %t1832, i64 %t1833, i64 %t1834, i64 %t1835)
  store i64 %t1836, ptr %local.r1.1784
  %t1837 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.223)
  %t1838 = ptrtoint ptr %t1837 to i64
  %t1839 = inttoptr i64 %t1838 to ptr
  call void @intrinsic_print(ptr %t1839)
  %t1840 = load i64, ptr %local.r1.1784
  %t1841 = call i64 @"print_f64"(i64 %t1840)
  %t1842 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.224)
  %t1843 = ptrtoint ptr %t1842 to i64
  %t1844 = inttoptr i64 %t1843 to ptr
  call void @intrinsic_println(ptr %t1844)
  %t1845 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.225)
  %t1846 = ptrtoint ptr %t1845 to i64
  %t1847 = inttoptr i64 %t1846 to ptr
  call void @intrinsic_println(ptr %t1847)
  %t1848 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.226)
  %t1849 = ptrtoint ptr %t1848 to i64
  %t1850 = inttoptr i64 %t1849 to ptr
  call void @intrinsic_println(ptr %t1850)
  %t1851 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.227)
  %t1852 = ptrtoint ptr %t1851 to i64
  %t1853 = inttoptr i64 %t1852 to ptr
  call void @intrinsic_print(ptr %t1853)
  %t1854 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.228)
  %t1855 = ptrtoint ptr %t1854 to i64
  %t1856 = inttoptr i64 %t1855 to ptr
  call void @intrinsic_println(ptr %t1856)
  %t1857 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.229)
  %t1858 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.230)
  %t1859 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.231)
  %t1860 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.232)
  %t1861 = call i64 @"sx_f64_sub"(i64 %t1859, i64 %t1860)
  %t1862 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.233)
  %t1863 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.234)
  %t1864 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.235)
  %t1865 = call i64 @"sx_f64_sub"(i64 %t1863, i64 %t1864)
  %t1866 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.236)
  %t1867 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.237)
  %t1868 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.238)
  %t1869 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.239)
  %t1870 = call i64 @"sx_f64_sub"(i64 %t1868, i64 %t1869)
  %t1871 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.240)
  %t1872 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.241)
  %t1873 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.242)
  %t1874 = call i64 @"sx_f64_sub"(i64 %t1872, i64 %t1873)
  %t1875 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.243)
  %t1876 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.244)
  %t1877 = load i64, ptr %local.num_cycles.1783
  %t1878 = call i64 @"compute_avg_ratio"(i64 %t1857, i64 %t1858, i64 %t1861, i64 %t1862, i64 %t1865, i64 %t1866, i64 %t1867, i64 %t1870, i64 %t1871, i64 %t1874, i64 %t1875, i64 %t1876, i64 %t1877)
  store i64 %t1878, ptr %local.r2.1785
  %t1879 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.245)
  %t1880 = ptrtoint ptr %t1879 to i64
  %t1881 = inttoptr i64 %t1880 to ptr
  call void @intrinsic_print(ptr %t1881)
  %t1882 = load i64, ptr %local.r2.1785
  %t1883 = call i64 @"print_f64"(i64 %t1882)
  %t1884 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.246)
  %t1885 = ptrtoint ptr %t1884 to i64
  %t1886 = inttoptr i64 %t1885 to ptr
  call void @intrinsic_println(ptr %t1886)
  %t1887 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.247)
  %t1888 = ptrtoint ptr %t1887 to i64
  %t1889 = inttoptr i64 %t1888 to ptr
  call void @intrinsic_println(ptr %t1889)
  %t1890 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.248)
  %t1891 = ptrtoint ptr %t1890 to i64
  %t1892 = inttoptr i64 %t1891 to ptr
  call void @intrinsic_println(ptr %t1892)
  %t1893 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.249)
  %t1894 = ptrtoint ptr %t1893 to i64
  %t1895 = inttoptr i64 %t1894 to ptr
  call void @intrinsic_print(ptr %t1895)
  %t1896 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.250)
  %t1897 = ptrtoint ptr %t1896 to i64
  %t1898 = inttoptr i64 %t1897 to ptr
  call void @intrinsic_println(ptr %t1898)
  %t1899 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.251)
  %t1900 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.252)
  %t1901 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.253)
  %t1902 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.254)
  %t1903 = call i64 @"sx_f64_sub"(i64 %t1901, i64 %t1902)
  %t1904 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.255)
  %t1905 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.256)
  %t1906 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.257)
  %t1907 = call i64 @"sx_f64_sub"(i64 %t1905, i64 %t1906)
  %t1908 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.258)
  %t1909 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.259)
  %t1910 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.260)
  %t1911 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.261)
  %t1912 = call i64 @"sx_f64_sub"(i64 %t1910, i64 %t1911)
  %t1913 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.262)
  %t1914 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.263)
  %t1915 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.264)
  %t1916 = call i64 @"sx_f64_sub"(i64 %t1914, i64 %t1915)
  %t1917 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.265)
  %t1918 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.266)
  %t1919 = load i64, ptr %local.num_cycles.1783
  %t1920 = call i64 @"compute_avg_ratio"(i64 %t1899, i64 %t1900, i64 %t1903, i64 %t1904, i64 %t1907, i64 %t1908, i64 %t1909, i64 %t1912, i64 %t1913, i64 %t1916, i64 %t1917, i64 %t1918, i64 %t1919)
  store i64 %t1920, ptr %local.r3.1786
  %t1921 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.267)
  %t1922 = ptrtoint ptr %t1921 to i64
  %t1923 = inttoptr i64 %t1922 to ptr
  call void @intrinsic_print(ptr %t1923)
  %t1924 = load i64, ptr %local.r3.1786
  %t1925 = call i64 @"print_f64"(i64 %t1924)
  %t1926 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.268)
  %t1927 = ptrtoint ptr %t1926 to i64
  %t1928 = inttoptr i64 %t1927 to ptr
  call void @intrinsic_println(ptr %t1928)
  %t1929 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.269)
  %t1930 = ptrtoint ptr %t1929 to i64
  %t1931 = inttoptr i64 %t1930 to ptr
  call void @intrinsic_println(ptr %t1931)
  %t1932 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.270)
  %t1933 = ptrtoint ptr %t1932 to i64
  %t1934 = inttoptr i64 %t1933 to ptr
  call void @intrinsic_println(ptr %t1934)
  %t1935 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.271)
  %t1936 = ptrtoint ptr %t1935 to i64
  %t1937 = inttoptr i64 %t1936 to ptr
  call void @intrinsic_print(ptr %t1937)
  %t1938 = load i64, ptr %local.r1.1784
  %t1939 = load i64, ptr %local.r2.1785
  %t1940 = call i64 @"sx_f64_sub"(i64 %t1938, i64 %t1939)
  %t1941 = call i64 @"abs_f64"(i64 %t1940)
  %t1942 = call i64 @"print_f64"(i64 %t1941)
  %t1943 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.272)
  %t1944 = ptrtoint ptr %t1943 to i64
  %t1945 = inttoptr i64 %t1944 to ptr
  call void @intrinsic_println(ptr %t1945)
  %t1946 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.273)
  %t1947 = ptrtoint ptr %t1946 to i64
  %t1948 = inttoptr i64 %t1947 to ptr
  call void @intrinsic_print(ptr %t1948)
  %t1949 = load i64, ptr %local.r1.1784
  %t1950 = load i64, ptr %local.r3.1786
  %t1951 = call i64 @"sx_f64_sub"(i64 %t1949, i64 %t1950)
  %t1952 = call i64 @"abs_f64"(i64 %t1951)
  %t1953 = call i64 @"print_f64"(i64 %t1952)
  %t1954 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.274)
  %t1955 = ptrtoint ptr %t1954 to i64
  %t1956 = inttoptr i64 %t1955 to ptr
  call void @intrinsic_println(ptr %t1956)
  %t1957 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.275)
  %t1958 = ptrtoint ptr %t1957 to i64
  %t1959 = inttoptr i64 %t1958 to ptr
  call void @intrinsic_print(ptr %t1959)
  %t1960 = load i64, ptr %local.r2.1785
  %t1961 = load i64, ptr %local.r3.1786
  %t1962 = call i64 @"sx_f64_sub"(i64 %t1960, i64 %t1961)
  %t1963 = call i64 @"abs_f64"(i64 %t1962)
  %t1964 = call i64 @"print_f64"(i64 %t1963)
  %t1965 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.276)
  %t1966 = ptrtoint ptr %t1965 to i64
  %t1967 = inttoptr i64 %t1966 to ptr
  call void @intrinsic_println(ptr %t1967)
  %t1968 = load i64, ptr %local.r1.1784
  %t1969 = load i64, ptr %local.r2.1785
  %t1970 = call i64 @"sx_f64_sub"(i64 %t1968, i64 %t1969)
  %t1971 = call i64 @"abs_f64"(i64 %t1970)
  %t1972 = load i64, ptr %local.r1.1784
  %t1973 = load i64, ptr %local.r3.1786
  %t1974 = call i64 @"sx_f64_sub"(i64 %t1972, i64 %t1973)
  %t1975 = call i64 @"abs_f64"(i64 %t1974)
  %t1976 = call i64 @"sx_f64_add"(i64 %t1971, i64 %t1975)
  %t1977 = load i64, ptr %local.r2.1785
  %t1978 = load i64, ptr %local.r3.1786
  %t1979 = call i64 @"sx_f64_sub"(i64 %t1977, i64 %t1978)
  %t1980 = call i64 @"abs_f64"(i64 %t1979)
  %t1981 = call i64 @"sx_f64_add"(i64 %t1976, i64 %t1980)
  store i64 %t1981, ptr %local.spread.1787
  %t1982 = load i64, ptr %local.spread.1787
  %t1983 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.277)
  %t1984 = call i64 @"sx_f64_lt"(i64 %t1982, i64 %t1983)
  %t1985 = icmp ne i64 %t1984, 0
  br i1 %t1985, label %then30, label %else30
then30:
  %t1986 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.278)
  %t1987 = ptrtoint ptr %t1986 to i64
  %t1988 = inttoptr i64 %t1987 to ptr
  call void @intrinsic_println(ptr %t1988)
  br label %then30_end
then30_end:
  br label %endif30
else30:
  %t1989 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.279)
  %t1990 = ptrtoint ptr %t1989 to i64
  %t1991 = inttoptr i64 %t1990 to ptr
  call void @intrinsic_println(ptr %t1991)
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t1992 = phi i64 [ 0, %then30_end ], [ 0, %else30_end ]
  ret i64 0
}

define i64 @"run_exp3"() nounwind {
entry:
  %local.alpha_ab.1993 = alloca i64
  %local.alpha_ac.1994 = alloca i64
  %local.alpha_ba.1995 = alloca i64
  %local.alpha_bc.1996 = alloca i64
  %local.alpha_ca.1997 = alloca i64
  %local.alpha_cb.1998 = alloca i64
  %local.prev_ab.1999 = alloca i64
  %local.prev_ac.2000 = alloca i64
  %local.prev_ba.2001 = alloca i64
  %local.prev_bc.2002 = alloca i64
  %local.prev_ca.2003 = alloca i64
  %local.prev_cb.2004 = alloca i64
  %local.mg.2005 = alloca i64
  %local.drift.2006 = alloca i64
  %local.entropy.2007 = alloca i64
  %local.total_alpha.2008 = alloca i64
  %local.p.2009 = alloca i64
  %local.prev_entropy.2010 = alloca i64
  %local.entropy_decreasing.2011 = alloca i64
  %local.entropy_checks.2012 = alloca i64
  %local.meta_lr.2013 = alloca i64
  %local.inner_steps.2014 = alloca i64
  %local.meta_cycles.2015 = alloca i64
  %local.ta0.2016 = alloca i64
  %local.ta1.2017 = alloca i64
  %local.ta2.2018 = alloca i64
  %local.ta3.2019 = alloca i64
  %local.tb0.2020 = alloca i64
  %local.tb1.2021 = alloca i64
  %local.tb2.2022 = alloca i64
  %local.tb3.2023 = alloca i64
  %local.tc0.2024 = alloca i64
  %local.tc1.2025 = alloca i64
  %local.tc2.2026 = alloca i64
  %local.tc3.2027 = alloca i64
  %local.cycle.2028 = alloca i64
  %local.rem.2029 = alloca i64
  %local.max_entropy.2030 = alloca i64
  %t2031 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.280)
  %t2032 = ptrtoint ptr %t2031 to i64
  %t2033 = inttoptr i64 %t2032 to ptr
  call void @intrinsic_println(ptr %t2033)
  %t2034 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.281)
  %t2035 = ptrtoint ptr %t2034 to i64
  %t2036 = inttoptr i64 %t2035 to ptr
  call void @intrinsic_println(ptr %t2036)
  %t2037 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.282)
  %t2038 = ptrtoint ptr %t2037 to i64
  %t2039 = inttoptr i64 %t2038 to ptr
  call void @intrinsic_println(ptr %t2039)
  %t2040 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.283)
  %t2041 = ptrtoint ptr %t2040 to i64
  %t2042 = inttoptr i64 %t2041 to ptr
  call void @intrinsic_println(ptr %t2042)
  %t2043 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.284)
  %t2044 = ptrtoint ptr %t2043 to i64
  %t2045 = inttoptr i64 %t2044 to ptr
  call void @intrinsic_println(ptr %t2045)
  %t2046 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.285)
  %t2047 = ptrtoint ptr %t2046 to i64
  %t2048 = inttoptr i64 %t2047 to ptr
  call void @intrinsic_println(ptr %t2048)
  %t2049 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.286)
  store i64 %t2049, ptr %local.alpha_ab.1993
  %t2050 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.287)
  store i64 %t2050, ptr %local.alpha_ac.1994
  %t2051 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.288)
  store i64 %t2051, ptr %local.alpha_ba.1995
  %t2052 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.289)
  store i64 %t2052, ptr %local.alpha_bc.1996
  %t2053 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.290)
  store i64 %t2053, ptr %local.alpha_ca.1997
  %t2054 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.291)
  store i64 %t2054, ptr %local.alpha_cb.1998
  %t2055 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.292)
  store i64 %t2055, ptr %local.prev_ab.1999
  %t2056 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.293)
  store i64 %t2056, ptr %local.prev_ac.2000
  %t2057 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.294)
  store i64 %t2057, ptr %local.prev_ba.2001
  %t2058 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.295)
  store i64 %t2058, ptr %local.prev_bc.2002
  %t2059 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.296)
  store i64 %t2059, ptr %local.prev_ca.2003
  %t2060 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.297)
  store i64 %t2060, ptr %local.prev_cb.2004
  %t2061 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.298)
  store i64 %t2061, ptr %local.mg.2005
  %t2062 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.299)
  store i64 %t2062, ptr %local.drift.2006
  %t2063 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.300)
  store i64 %t2063, ptr %local.entropy.2007
  %t2064 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.301)
  store i64 %t2064, ptr %local.total_alpha.2008
  %t2065 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.302)
  store i64 %t2065, ptr %local.p.2009
  %t2066 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.303)
  store i64 %t2066, ptr %local.prev_entropy.2010
  store i64 0, ptr %local.entropy_decreasing.2011
  store i64 0, ptr %local.entropy_checks.2012
  %t2067 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.304)
  store i64 %t2067, ptr %local.meta_lr.2013
  store i64 200, ptr %local.inner_steps.2014
  store i64 60, ptr %local.meta_cycles.2015
  %t2068 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.305)
  store i64 %t2068, ptr %local.ta0.2016
  %t2069 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.306)
  store i64 %t2069, ptr %local.ta1.2017
  %t2070 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.307)
  %t2071 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.308)
  %t2072 = call i64 @"sx_f64_sub"(i64 %t2070, i64 %t2071)
  store i64 %t2072, ptr %local.ta2.2018
  %t2073 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.309)
  store i64 %t2073, ptr %local.ta3.2019
  %t2074 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.310)
  %t2075 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.311)
  %t2076 = call i64 @"sx_f64_sub"(i64 %t2074, i64 %t2075)
  store i64 %t2076, ptr %local.tb0.2020
  %t2077 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.312)
  store i64 %t2077, ptr %local.tb1.2021
  %t2078 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.313)
  store i64 %t2078, ptr %local.tb2.2022
  %t2079 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.314)
  %t2080 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.315)
  %t2081 = call i64 @"sx_f64_sub"(i64 %t2079, i64 %t2080)
  store i64 %t2081, ptr %local.tb3.2023
  %t2082 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.316)
  store i64 %t2082, ptr %local.tc0.2024
  %t2083 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.317)
  %t2084 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.318)
  %t2085 = call i64 @"sx_f64_sub"(i64 %t2083, i64 %t2084)
  store i64 %t2085, ptr %local.tc1.2025
  %t2086 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.319)
  store i64 %t2086, ptr %local.tc2.2026
  %t2087 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.320)
  store i64 %t2087, ptr %local.tc3.2027
  %t2088 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.321)
  %t2089 = ptrtoint ptr %t2088 to i64
  %t2090 = inttoptr i64 %t2089 to ptr
  call void @intrinsic_println(ptr %t2090)
  %t2091 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.322)
  %t2092 = ptrtoint ptr %t2091 to i64
  %t2093 = inttoptr i64 %t2092 to ptr
  call void @intrinsic_println(ptr %t2093)
  store i64 0, ptr %local.cycle.2028
  br label %loop31
loop31:
  %t2094 = load i64, ptr %local.cycle.2028
  %t2095 = load i64, ptr %local.meta_cycles.2015
  %t2096 = icmp slt i64 %t2094, %t2095
  %t2097 = zext i1 %t2096 to i64
  %t2098 = icmp ne i64 %t2097, 0
  br i1 %t2098, label %body31, label %endloop31
body31:
  %t2099 = load i64, ptr %local.alpha_ab.1993
  store i64 %t2099, ptr %local.prev_ab.1999
  %t2100 = load i64, ptr %local.alpha_ac.1994
  store i64 %t2100, ptr %local.prev_ac.2000
  %t2101 = load i64, ptr %local.alpha_ba.1995
  store i64 %t2101, ptr %local.prev_ba.2001
  %t2102 = load i64, ptr %local.alpha_bc.1996
  store i64 %t2102, ptr %local.prev_bc.2002
  %t2103 = load i64, ptr %local.alpha_ca.1997
  store i64 %t2103, ptr %local.prev_ca.2003
  %t2104 = load i64, ptr %local.alpha_cb.1998
  store i64 %t2104, ptr %local.prev_cb.2004
  %t2105 = load i64, ptr %local.alpha_ab.1993
  %t2106 = load i64, ptr %local.alpha_ac.1994
  %t2107 = load i64, ptr %local.alpha_ba.1995
  %t2108 = load i64, ptr %local.alpha_bc.1996
  %t2109 = load i64, ptr %local.alpha_ca.1997
  %t2110 = load i64, ptr %local.alpha_cb.1998
  %t2111 = load i64, ptr %local.inner_steps.2014
  %t2112 = load i64, ptr %local.ta0.2016
  %t2113 = load i64, ptr %local.ta1.2017
  %t2114 = load i64, ptr %local.ta2.2018
  %t2115 = load i64, ptr %local.ta3.2019
  %t2116 = load i64, ptr %local.tb0.2020
  %t2117 = load i64, ptr %local.tb1.2021
  %t2118 = load i64, ptr %local.tb2.2022
  %t2119 = load i64, ptr %local.tb3.2023
  %t2120 = load i64, ptr %local.tc0.2024
  %t2121 = load i64, ptr %local.tc1.2025
  %t2122 = load i64, ptr %local.tc2.2026
  %t2123 = load i64, ptr %local.tc3.2027
  %t2124 = call i64 @"meta_grad_p"(i64 %t2105, i64 %t2106, i64 %t2107, i64 %t2108, i64 %t2109, i64 %t2110, i64 0, i64 %t2111, i64 %t2112, i64 %t2113, i64 %t2114, i64 %t2115, i64 %t2116, i64 %t2117, i64 %t2118, i64 %t2119, i64 %t2120, i64 %t2121, i64 %t2122, i64 %t2123)
  store i64 %t2124, ptr %local.mg.2005
  %t2125 = load i64, ptr %local.alpha_ab.1993
  %t2126 = load i64, ptr %local.meta_lr.2013
  %t2127 = load i64, ptr %local.mg.2005
  %t2128 = call i64 @"sx_f64_mul"(i64 %t2126, i64 %t2127)
  %t2129 = call i64 @"sx_f64_sub"(i64 %t2125, i64 %t2128)
  %t2130 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.323)
  %t2131 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.324)
  %t2132 = call i64 @"clamp"(i64 %t2129, i64 %t2130, i64 %t2131)
  store i64 %t2132, ptr %local.alpha_ab.1993
  %t2133 = load i64, ptr %local.alpha_ab.1993
  %t2134 = load i64, ptr %local.alpha_ac.1994
  %t2135 = load i64, ptr %local.alpha_ba.1995
  %t2136 = load i64, ptr %local.alpha_bc.1996
  %t2137 = load i64, ptr %local.alpha_ca.1997
  %t2138 = load i64, ptr %local.alpha_cb.1998
  %t2139 = load i64, ptr %local.inner_steps.2014
  %t2140 = load i64, ptr %local.ta0.2016
  %t2141 = load i64, ptr %local.ta1.2017
  %t2142 = load i64, ptr %local.ta2.2018
  %t2143 = load i64, ptr %local.ta3.2019
  %t2144 = load i64, ptr %local.tb0.2020
  %t2145 = load i64, ptr %local.tb1.2021
  %t2146 = load i64, ptr %local.tb2.2022
  %t2147 = load i64, ptr %local.tb3.2023
  %t2148 = load i64, ptr %local.tc0.2024
  %t2149 = load i64, ptr %local.tc1.2025
  %t2150 = load i64, ptr %local.tc2.2026
  %t2151 = load i64, ptr %local.tc3.2027
  %t2152 = call i64 @"meta_grad_p"(i64 %t2133, i64 %t2134, i64 %t2135, i64 %t2136, i64 %t2137, i64 %t2138, i64 1, i64 %t2139, i64 %t2140, i64 %t2141, i64 %t2142, i64 %t2143, i64 %t2144, i64 %t2145, i64 %t2146, i64 %t2147, i64 %t2148, i64 %t2149, i64 %t2150, i64 %t2151)
  store i64 %t2152, ptr %local.mg.2005
  %t2153 = load i64, ptr %local.alpha_ac.1994
  %t2154 = load i64, ptr %local.meta_lr.2013
  %t2155 = load i64, ptr %local.mg.2005
  %t2156 = call i64 @"sx_f64_mul"(i64 %t2154, i64 %t2155)
  %t2157 = call i64 @"sx_f64_sub"(i64 %t2153, i64 %t2156)
  %t2158 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.325)
  %t2159 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.326)
  %t2160 = call i64 @"clamp"(i64 %t2157, i64 %t2158, i64 %t2159)
  store i64 %t2160, ptr %local.alpha_ac.1994
  %t2161 = load i64, ptr %local.alpha_ab.1993
  %t2162 = load i64, ptr %local.alpha_ac.1994
  %t2163 = load i64, ptr %local.alpha_ba.1995
  %t2164 = load i64, ptr %local.alpha_bc.1996
  %t2165 = load i64, ptr %local.alpha_ca.1997
  %t2166 = load i64, ptr %local.alpha_cb.1998
  %t2167 = load i64, ptr %local.inner_steps.2014
  %t2168 = load i64, ptr %local.ta0.2016
  %t2169 = load i64, ptr %local.ta1.2017
  %t2170 = load i64, ptr %local.ta2.2018
  %t2171 = load i64, ptr %local.ta3.2019
  %t2172 = load i64, ptr %local.tb0.2020
  %t2173 = load i64, ptr %local.tb1.2021
  %t2174 = load i64, ptr %local.tb2.2022
  %t2175 = load i64, ptr %local.tb3.2023
  %t2176 = load i64, ptr %local.tc0.2024
  %t2177 = load i64, ptr %local.tc1.2025
  %t2178 = load i64, ptr %local.tc2.2026
  %t2179 = load i64, ptr %local.tc3.2027
  %t2180 = call i64 @"meta_grad_p"(i64 %t2161, i64 %t2162, i64 %t2163, i64 %t2164, i64 %t2165, i64 %t2166, i64 2, i64 %t2167, i64 %t2168, i64 %t2169, i64 %t2170, i64 %t2171, i64 %t2172, i64 %t2173, i64 %t2174, i64 %t2175, i64 %t2176, i64 %t2177, i64 %t2178, i64 %t2179)
  store i64 %t2180, ptr %local.mg.2005
  %t2181 = load i64, ptr %local.alpha_ba.1995
  %t2182 = load i64, ptr %local.meta_lr.2013
  %t2183 = load i64, ptr %local.mg.2005
  %t2184 = call i64 @"sx_f64_mul"(i64 %t2182, i64 %t2183)
  %t2185 = call i64 @"sx_f64_sub"(i64 %t2181, i64 %t2184)
  %t2186 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.327)
  %t2187 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.328)
  %t2188 = call i64 @"clamp"(i64 %t2185, i64 %t2186, i64 %t2187)
  store i64 %t2188, ptr %local.alpha_ba.1995
  %t2189 = load i64, ptr %local.alpha_ab.1993
  %t2190 = load i64, ptr %local.alpha_ac.1994
  %t2191 = load i64, ptr %local.alpha_ba.1995
  %t2192 = load i64, ptr %local.alpha_bc.1996
  %t2193 = load i64, ptr %local.alpha_ca.1997
  %t2194 = load i64, ptr %local.alpha_cb.1998
  %t2195 = load i64, ptr %local.inner_steps.2014
  %t2196 = load i64, ptr %local.ta0.2016
  %t2197 = load i64, ptr %local.ta1.2017
  %t2198 = load i64, ptr %local.ta2.2018
  %t2199 = load i64, ptr %local.ta3.2019
  %t2200 = load i64, ptr %local.tb0.2020
  %t2201 = load i64, ptr %local.tb1.2021
  %t2202 = load i64, ptr %local.tb2.2022
  %t2203 = load i64, ptr %local.tb3.2023
  %t2204 = load i64, ptr %local.tc0.2024
  %t2205 = load i64, ptr %local.tc1.2025
  %t2206 = load i64, ptr %local.tc2.2026
  %t2207 = load i64, ptr %local.tc3.2027
  %t2208 = call i64 @"meta_grad_p"(i64 %t2189, i64 %t2190, i64 %t2191, i64 %t2192, i64 %t2193, i64 %t2194, i64 3, i64 %t2195, i64 %t2196, i64 %t2197, i64 %t2198, i64 %t2199, i64 %t2200, i64 %t2201, i64 %t2202, i64 %t2203, i64 %t2204, i64 %t2205, i64 %t2206, i64 %t2207)
  store i64 %t2208, ptr %local.mg.2005
  %t2209 = load i64, ptr %local.alpha_bc.1996
  %t2210 = load i64, ptr %local.meta_lr.2013
  %t2211 = load i64, ptr %local.mg.2005
  %t2212 = call i64 @"sx_f64_mul"(i64 %t2210, i64 %t2211)
  %t2213 = call i64 @"sx_f64_sub"(i64 %t2209, i64 %t2212)
  %t2214 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.329)
  %t2215 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.330)
  %t2216 = call i64 @"clamp"(i64 %t2213, i64 %t2214, i64 %t2215)
  store i64 %t2216, ptr %local.alpha_bc.1996
  %t2217 = load i64, ptr %local.alpha_ab.1993
  %t2218 = load i64, ptr %local.alpha_ac.1994
  %t2219 = load i64, ptr %local.alpha_ba.1995
  %t2220 = load i64, ptr %local.alpha_bc.1996
  %t2221 = load i64, ptr %local.alpha_ca.1997
  %t2222 = load i64, ptr %local.alpha_cb.1998
  %t2223 = load i64, ptr %local.inner_steps.2014
  %t2224 = load i64, ptr %local.ta0.2016
  %t2225 = load i64, ptr %local.ta1.2017
  %t2226 = load i64, ptr %local.ta2.2018
  %t2227 = load i64, ptr %local.ta3.2019
  %t2228 = load i64, ptr %local.tb0.2020
  %t2229 = load i64, ptr %local.tb1.2021
  %t2230 = load i64, ptr %local.tb2.2022
  %t2231 = load i64, ptr %local.tb3.2023
  %t2232 = load i64, ptr %local.tc0.2024
  %t2233 = load i64, ptr %local.tc1.2025
  %t2234 = load i64, ptr %local.tc2.2026
  %t2235 = load i64, ptr %local.tc3.2027
  %t2236 = call i64 @"meta_grad_p"(i64 %t2217, i64 %t2218, i64 %t2219, i64 %t2220, i64 %t2221, i64 %t2222, i64 4, i64 %t2223, i64 %t2224, i64 %t2225, i64 %t2226, i64 %t2227, i64 %t2228, i64 %t2229, i64 %t2230, i64 %t2231, i64 %t2232, i64 %t2233, i64 %t2234, i64 %t2235)
  store i64 %t2236, ptr %local.mg.2005
  %t2237 = load i64, ptr %local.alpha_ca.1997
  %t2238 = load i64, ptr %local.meta_lr.2013
  %t2239 = load i64, ptr %local.mg.2005
  %t2240 = call i64 @"sx_f64_mul"(i64 %t2238, i64 %t2239)
  %t2241 = call i64 @"sx_f64_sub"(i64 %t2237, i64 %t2240)
  %t2242 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.331)
  %t2243 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.332)
  %t2244 = call i64 @"clamp"(i64 %t2241, i64 %t2242, i64 %t2243)
  store i64 %t2244, ptr %local.alpha_ca.1997
  %t2245 = load i64, ptr %local.alpha_ab.1993
  %t2246 = load i64, ptr %local.alpha_ac.1994
  %t2247 = load i64, ptr %local.alpha_ba.1995
  %t2248 = load i64, ptr %local.alpha_bc.1996
  %t2249 = load i64, ptr %local.alpha_ca.1997
  %t2250 = load i64, ptr %local.alpha_cb.1998
  %t2251 = load i64, ptr %local.inner_steps.2014
  %t2252 = load i64, ptr %local.ta0.2016
  %t2253 = load i64, ptr %local.ta1.2017
  %t2254 = load i64, ptr %local.ta2.2018
  %t2255 = load i64, ptr %local.ta3.2019
  %t2256 = load i64, ptr %local.tb0.2020
  %t2257 = load i64, ptr %local.tb1.2021
  %t2258 = load i64, ptr %local.tb2.2022
  %t2259 = load i64, ptr %local.tb3.2023
  %t2260 = load i64, ptr %local.tc0.2024
  %t2261 = load i64, ptr %local.tc1.2025
  %t2262 = load i64, ptr %local.tc2.2026
  %t2263 = load i64, ptr %local.tc3.2027
  %t2264 = call i64 @"meta_grad_p"(i64 %t2245, i64 %t2246, i64 %t2247, i64 %t2248, i64 %t2249, i64 %t2250, i64 5, i64 %t2251, i64 %t2252, i64 %t2253, i64 %t2254, i64 %t2255, i64 %t2256, i64 %t2257, i64 %t2258, i64 %t2259, i64 %t2260, i64 %t2261, i64 %t2262, i64 %t2263)
  store i64 %t2264, ptr %local.mg.2005
  %t2265 = load i64, ptr %local.alpha_cb.1998
  %t2266 = load i64, ptr %local.meta_lr.2013
  %t2267 = load i64, ptr %local.mg.2005
  %t2268 = call i64 @"sx_f64_mul"(i64 %t2266, i64 %t2267)
  %t2269 = call i64 @"sx_f64_sub"(i64 %t2265, i64 %t2268)
  %t2270 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.333)
  %t2271 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.334)
  %t2272 = call i64 @"clamp"(i64 %t2269, i64 %t2270, i64 %t2271)
  store i64 %t2272, ptr %local.alpha_cb.1998
  %t2273 = load i64, ptr %local.alpha_ab.1993
  %t2274 = load i64, ptr %local.prev_ab.1999
  %t2275 = call i64 @"sx_f64_sub"(i64 %t2273, i64 %t2274)
  %t2276 = call i64 @"abs_f64"(i64 %t2275)
  %t2277 = load i64, ptr %local.alpha_ac.1994
  %t2278 = load i64, ptr %local.prev_ac.2000
  %t2279 = call i64 @"sx_f64_sub"(i64 %t2277, i64 %t2278)
  %t2280 = call i64 @"abs_f64"(i64 %t2279)
  %t2281 = call i64 @"sx_f64_add"(i64 %t2276, i64 %t2280)
  %t2282 = load i64, ptr %local.alpha_ba.1995
  %t2283 = load i64, ptr %local.prev_ba.2001
  %t2284 = call i64 @"sx_f64_sub"(i64 %t2282, i64 %t2283)
  %t2285 = call i64 @"abs_f64"(i64 %t2284)
  %t2286 = call i64 @"sx_f64_add"(i64 %t2281, i64 %t2285)
  %t2287 = load i64, ptr %local.alpha_bc.1996
  %t2288 = load i64, ptr %local.prev_bc.2002
  %t2289 = call i64 @"sx_f64_sub"(i64 %t2287, i64 %t2288)
  %t2290 = call i64 @"abs_f64"(i64 %t2289)
  %t2291 = call i64 @"sx_f64_add"(i64 %t2286, i64 %t2290)
  %t2292 = load i64, ptr %local.alpha_ca.1997
  %t2293 = load i64, ptr %local.prev_ca.2003
  %t2294 = call i64 @"sx_f64_sub"(i64 %t2292, i64 %t2293)
  %t2295 = call i64 @"abs_f64"(i64 %t2294)
  %t2296 = call i64 @"sx_f64_add"(i64 %t2291, i64 %t2295)
  %t2297 = load i64, ptr %local.alpha_cb.1998
  %t2298 = load i64, ptr %local.prev_cb.2004
  %t2299 = call i64 @"sx_f64_sub"(i64 %t2297, i64 %t2298)
  %t2300 = call i64 @"abs_f64"(i64 %t2299)
  %t2301 = call i64 @"sx_f64_add"(i64 %t2296, i64 %t2300)
  store i64 %t2301, ptr %local.drift.2006
  %t2302 = load i64, ptr %local.alpha_ab.1993
  %t2303 = call i64 @"abs_f64"(i64 %t2302)
  %t2304 = load i64, ptr %local.alpha_ac.1994
  %t2305 = call i64 @"abs_f64"(i64 %t2304)
  %t2306 = call i64 @"sx_f64_add"(i64 %t2303, i64 %t2305)
  %t2307 = load i64, ptr %local.alpha_ba.1995
  %t2308 = call i64 @"abs_f64"(i64 %t2307)
  %t2309 = call i64 @"sx_f64_add"(i64 %t2306, i64 %t2308)
  %t2310 = load i64, ptr %local.alpha_bc.1996
  %t2311 = call i64 @"abs_f64"(i64 %t2310)
  %t2312 = call i64 @"sx_f64_add"(i64 %t2309, i64 %t2311)
  %t2313 = load i64, ptr %local.alpha_ca.1997
  %t2314 = call i64 @"abs_f64"(i64 %t2313)
  %t2315 = call i64 @"sx_f64_add"(i64 %t2312, i64 %t2314)
  %t2316 = load i64, ptr %local.alpha_cb.1998
  %t2317 = call i64 @"abs_f64"(i64 %t2316)
  %t2318 = call i64 @"sx_f64_add"(i64 %t2315, i64 %t2317)
  %t2319 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.335)
  %t2320 = call i64 @"sx_f64_add"(i64 %t2318, i64 %t2319)
  store i64 %t2320, ptr %local.total_alpha.2008
  %t2321 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.336)
  store i64 %t2321, ptr %local.entropy.2007
  %t2322 = load i64, ptr %local.alpha_ab.1993
  %t2323 = call i64 @"abs_f64"(i64 %t2322)
  %t2324 = load i64, ptr %local.total_alpha.2008
  %t2325 = call i64 @"sx_f64_div"(i64 %t2323, i64 %t2324)
  store i64 %t2325, ptr %local.p.2009
  %t2326 = load i64, ptr %local.p.2009
  %t2327 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.337)
  %t2328 = call i64 @"sx_f64_gt"(i64 %t2326, i64 %t2327)
  %t2329 = icmp ne i64 %t2328, 0
  br i1 %t2329, label %then32, label %else32
then32:
  %t2330 = load i64, ptr %local.entropy.2007
  %t2331 = load i64, ptr %local.p.2009
  %t2332 = load i64, ptr %local.p.2009
  %t2333 = call i64 @"ln_approx"(i64 %t2332)
  %t2334 = call i64 @"sx_f64_mul"(i64 %t2331, i64 %t2333)
  %t2335 = call i64 @"sx_f64_sub"(i64 %t2330, i64 %t2334)
  store i64 %t2335, ptr %local.entropy.2007
  br label %then32_end
then32_end:
  br label %endif32
else32:
  br label %else32_end
else32_end:
  br label %endif32
endif32:
  %t2336 = phi i64 [ 0, %then32_end ], [ 0, %else32_end ]
  %t2337 = load i64, ptr %local.alpha_ac.1994
  %t2338 = call i64 @"abs_f64"(i64 %t2337)
  %t2339 = load i64, ptr %local.total_alpha.2008
  %t2340 = call i64 @"sx_f64_div"(i64 %t2338, i64 %t2339)
  store i64 %t2340, ptr %local.p.2009
  %t2341 = load i64, ptr %local.p.2009
  %t2342 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.338)
  %t2343 = call i64 @"sx_f64_gt"(i64 %t2341, i64 %t2342)
  %t2344 = icmp ne i64 %t2343, 0
  br i1 %t2344, label %then33, label %else33
then33:
  %t2345 = load i64, ptr %local.entropy.2007
  %t2346 = load i64, ptr %local.p.2009
  %t2347 = load i64, ptr %local.p.2009
  %t2348 = call i64 @"ln_approx"(i64 %t2347)
  %t2349 = call i64 @"sx_f64_mul"(i64 %t2346, i64 %t2348)
  %t2350 = call i64 @"sx_f64_sub"(i64 %t2345, i64 %t2349)
  store i64 %t2350, ptr %local.entropy.2007
  br label %then33_end
then33_end:
  br label %endif33
else33:
  br label %else33_end
else33_end:
  br label %endif33
endif33:
  %t2351 = phi i64 [ 0, %then33_end ], [ 0, %else33_end ]
  %t2352 = load i64, ptr %local.alpha_ba.1995
  %t2353 = call i64 @"abs_f64"(i64 %t2352)
  %t2354 = load i64, ptr %local.total_alpha.2008
  %t2355 = call i64 @"sx_f64_div"(i64 %t2353, i64 %t2354)
  store i64 %t2355, ptr %local.p.2009
  %t2356 = load i64, ptr %local.p.2009
  %t2357 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.339)
  %t2358 = call i64 @"sx_f64_gt"(i64 %t2356, i64 %t2357)
  %t2359 = icmp ne i64 %t2358, 0
  br i1 %t2359, label %then34, label %else34
then34:
  %t2360 = load i64, ptr %local.entropy.2007
  %t2361 = load i64, ptr %local.p.2009
  %t2362 = load i64, ptr %local.p.2009
  %t2363 = call i64 @"ln_approx"(i64 %t2362)
  %t2364 = call i64 @"sx_f64_mul"(i64 %t2361, i64 %t2363)
  %t2365 = call i64 @"sx_f64_sub"(i64 %t2360, i64 %t2364)
  store i64 %t2365, ptr %local.entropy.2007
  br label %then34_end
then34_end:
  br label %endif34
else34:
  br label %else34_end
else34_end:
  br label %endif34
endif34:
  %t2366 = phi i64 [ 0, %then34_end ], [ 0, %else34_end ]
  %t2367 = load i64, ptr %local.alpha_bc.1996
  %t2368 = call i64 @"abs_f64"(i64 %t2367)
  %t2369 = load i64, ptr %local.total_alpha.2008
  %t2370 = call i64 @"sx_f64_div"(i64 %t2368, i64 %t2369)
  store i64 %t2370, ptr %local.p.2009
  %t2371 = load i64, ptr %local.p.2009
  %t2372 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.340)
  %t2373 = call i64 @"sx_f64_gt"(i64 %t2371, i64 %t2372)
  %t2374 = icmp ne i64 %t2373, 0
  br i1 %t2374, label %then35, label %else35
then35:
  %t2375 = load i64, ptr %local.entropy.2007
  %t2376 = load i64, ptr %local.p.2009
  %t2377 = load i64, ptr %local.p.2009
  %t2378 = call i64 @"ln_approx"(i64 %t2377)
  %t2379 = call i64 @"sx_f64_mul"(i64 %t2376, i64 %t2378)
  %t2380 = call i64 @"sx_f64_sub"(i64 %t2375, i64 %t2379)
  store i64 %t2380, ptr %local.entropy.2007
  br label %then35_end
then35_end:
  br label %endif35
else35:
  br label %else35_end
else35_end:
  br label %endif35
endif35:
  %t2381 = phi i64 [ 0, %then35_end ], [ 0, %else35_end ]
  %t2382 = load i64, ptr %local.alpha_ca.1997
  %t2383 = call i64 @"abs_f64"(i64 %t2382)
  %t2384 = load i64, ptr %local.total_alpha.2008
  %t2385 = call i64 @"sx_f64_div"(i64 %t2383, i64 %t2384)
  store i64 %t2385, ptr %local.p.2009
  %t2386 = load i64, ptr %local.p.2009
  %t2387 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.341)
  %t2388 = call i64 @"sx_f64_gt"(i64 %t2386, i64 %t2387)
  %t2389 = icmp ne i64 %t2388, 0
  br i1 %t2389, label %then36, label %else36
then36:
  %t2390 = load i64, ptr %local.entropy.2007
  %t2391 = load i64, ptr %local.p.2009
  %t2392 = load i64, ptr %local.p.2009
  %t2393 = call i64 @"ln_approx"(i64 %t2392)
  %t2394 = call i64 @"sx_f64_mul"(i64 %t2391, i64 %t2393)
  %t2395 = call i64 @"sx_f64_sub"(i64 %t2390, i64 %t2394)
  store i64 %t2395, ptr %local.entropy.2007
  br label %then36_end
then36_end:
  br label %endif36
else36:
  br label %else36_end
else36_end:
  br label %endif36
endif36:
  %t2396 = phi i64 [ 0, %then36_end ], [ 0, %else36_end ]
  %t2397 = load i64, ptr %local.alpha_cb.1998
  %t2398 = call i64 @"abs_f64"(i64 %t2397)
  %t2399 = load i64, ptr %local.total_alpha.2008
  %t2400 = call i64 @"sx_f64_div"(i64 %t2398, i64 %t2399)
  store i64 %t2400, ptr %local.p.2009
  %t2401 = load i64, ptr %local.p.2009
  %t2402 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.342)
  %t2403 = call i64 @"sx_f64_gt"(i64 %t2401, i64 %t2402)
  %t2404 = icmp ne i64 %t2403, 0
  br i1 %t2404, label %then37, label %else37
then37:
  %t2405 = load i64, ptr %local.entropy.2007
  %t2406 = load i64, ptr %local.p.2009
  %t2407 = load i64, ptr %local.p.2009
  %t2408 = call i64 @"ln_approx"(i64 %t2407)
  %t2409 = call i64 @"sx_f64_mul"(i64 %t2406, i64 %t2408)
  %t2410 = call i64 @"sx_f64_sub"(i64 %t2405, i64 %t2409)
  store i64 %t2410, ptr %local.entropy.2007
  br label %then37_end
then37_end:
  br label %endif37
else37:
  br label %else37_end
else37_end:
  br label %endif37
endif37:
  %t2411 = phi i64 [ 0, %then37_end ], [ 0, %else37_end ]
  %t2412 = load i64, ptr %local.cycle.2028
  %t2413 = icmp sgt i64 %t2412, 0
  %t2414 = zext i1 %t2413 to i64
  %t2415 = icmp ne i64 %t2414, 0
  br i1 %t2415, label %then38, label %else38
then38:
  %t2416 = load i64, ptr %local.entropy_checks.2012
  %t2417 = add i64 %t2416, 1
  store i64 %t2417, ptr %local.entropy_checks.2012
  %t2418 = load i64, ptr %local.entropy.2007
  %t2419 = load i64, ptr %local.prev_entropy.2010
  %t2420 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.343)
  %t2421 = call i64 @"sx_f64_add"(i64 %t2419, i64 %t2420)
  %t2422 = call i64 @"sx_f64_le"(i64 %t2418, i64 %t2421)
  %t2423 = icmp ne i64 %t2422, 0
  br i1 %t2423, label %then39, label %else39
then39:
  %t2424 = load i64, ptr %local.entropy_decreasing.2011
  %t2425 = add i64 %t2424, 1
  store i64 %t2425, ptr %local.entropy_decreasing.2011
  br label %then39_end
then39_end:
  br label %endif39
else39:
  br label %else39_end
else39_end:
  br label %endif39
endif39:
  %t2426 = phi i64 [ 0, %then39_end ], [ 0, %else39_end ]
  br label %then38_end
then38_end:
  br label %endif38
else38:
  br label %else38_end
else38_end:
  br label %endif38
endif38:
  %t2427 = phi i64 [ %t2426, %then38_end ], [ 0, %else38_end ]
  %t2428 = load i64, ptr %local.cycle.2028
  %t2429 = load i64, ptr %local.cycle.2028
  %t2430 = sdiv i64 %t2429, 5
  %t2431 = mul i64 %t2430, 5
  %t2432 = sub i64 %t2428, %t2431
  store i64 %t2432, ptr %local.rem.2029
  %t2433 = load i64, ptr %local.rem.2029
  %t2434 = icmp eq i64 %t2433, 0
  %t2435 = zext i1 %t2434 to i64
  %t2436 = icmp ne i64 %t2435, 0
  br i1 %t2436, label %then40, label %else40
then40:
  %t2437 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.344)
  %t2438 = ptrtoint ptr %t2437 to i64
  %t2439 = inttoptr i64 %t2438 to ptr
  call void @intrinsic_print(ptr %t2439)
  %t2440 = load i64, ptr %local.cycle.2028
  call void @print_i64(i64 %t2440)
  %t2441 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.345)
  %t2442 = ptrtoint ptr %t2441 to i64
  %t2443 = inttoptr i64 %t2442 to ptr
  call void @intrinsic_print(ptr %t2443)
  %t2444 = load i64, ptr %local.drift.2006
  %t2445 = call i64 @"print_f64"(i64 %t2444)
  %t2446 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.346)
  %t2447 = ptrtoint ptr %t2446 to i64
  %t2448 = inttoptr i64 %t2447 to ptr
  call void @intrinsic_print(ptr %t2448)
  %t2449 = load i64, ptr %local.entropy.2007
  %t2450 = call i64 @"print_f64"(i64 %t2449)
  %t2451 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.347)
  %t2452 = ptrtoint ptr %t2451 to i64
  %t2453 = inttoptr i64 %t2452 to ptr
  call void @intrinsic_print(ptr %t2453)
  %t2454 = load i64, ptr %local.cycle.2028
  %t2455 = icmp sgt i64 %t2454, 0
  %t2456 = zext i1 %t2455 to i64
  %t2457 = icmp ne i64 %t2456, 0
  br i1 %t2457, label %then41, label %else41
then41:
  %t2458 = load i64, ptr %local.entropy.2007
  %t2459 = load i64, ptr %local.prev_entropy.2010
  %t2460 = call i64 @"sx_f64_sub"(i64 %t2458, i64 %t2459)
  %t2461 = call i64 @"print_f64"(i64 %t2460)
  br label %then41_end
then41_end:
  br label %endif41
else41:
  %t2462 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.348)
  %t2463 = ptrtoint ptr %t2462 to i64
  %t2464 = inttoptr i64 %t2463 to ptr
  call void @intrinsic_print(ptr %t2464)
  br label %else41_end
else41_end:
  br label %endif41
endif41:
  %t2465 = phi i64 [ 0, %then41_end ], [ 0, %else41_end ]
  %t2466 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.349)
  %t2467 = ptrtoint ptr %t2466 to i64
  %t2468 = inttoptr i64 %t2467 to ptr
  call void @intrinsic_println(ptr %t2468)
  br label %then40_end
then40_end:
  br label %endif40
else40:
  br label %else40_end
else40_end:
  br label %endif40
endif40:
  %t2469 = phi i64 [ 0, %then40_end ], [ 0, %else40_end ]
  %t2470 = load i64, ptr %local.entropy.2007
  store i64 %t2470, ptr %local.prev_entropy.2010
  %t2471 = load i64, ptr %local.cycle.2028
  %t2472 = add i64 %t2471, 1
  store i64 %t2472, ptr %local.cycle.2028
  br label %loop31
endloop31:
  %t2473 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.350)
  %t2474 = ptrtoint ptr %t2473 to i64
  %t2475 = inttoptr i64 %t2474 to ptr
  call void @intrinsic_println(ptr %t2475)
  %t2476 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.351)
  %t2477 = ptrtoint ptr %t2476 to i64
  %t2478 = inttoptr i64 %t2477 to ptr
  call void @intrinsic_print(ptr %t2478)
  %t2479 = load i64, ptr %local.entropy_decreasing.2011
  call void @print_i64(i64 %t2479)
  %t2480 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.352)
  %t2481 = ptrtoint ptr %t2480 to i64
  %t2482 = inttoptr i64 %t2481 to ptr
  call void @intrinsic_print(ptr %t2482)
  %t2483 = load i64, ptr %local.entropy_checks.2012
  call void @print_i64(i64 %t2483)
  %t2484 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.353)
  %t2485 = ptrtoint ptr %t2484 to i64
  %t2486 = inttoptr i64 %t2485 to ptr
  call void @intrinsic_print(ptr %t2486)
  %t2487 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.354)
  %t2488 = ptrtoint ptr %t2487 to i64
  %t2489 = inttoptr i64 %t2488 to ptr
  call void @intrinsic_println(ptr %t2489)
  %t2490 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.355)
  %t2491 = call i64 @"ln_approx"(i64 %t2490)
  store i64 %t2491, ptr %local.max_entropy.2030
  %t2492 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.356)
  %t2493 = ptrtoint ptr %t2492 to i64
  %t2494 = inttoptr i64 %t2493 to ptr
  call void @intrinsic_print(ptr %t2494)
  %t2495 = load i64, ptr %local.max_entropy.2030
  %t2496 = call i64 @"print_f64"(i64 %t2495)
  %t2497 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.357)
  %t2498 = ptrtoint ptr %t2497 to i64
  %t2499 = inttoptr i64 %t2498 to ptr
  call void @intrinsic_println(ptr %t2499)
  %t2500 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.358)
  %t2501 = ptrtoint ptr %t2500 to i64
  %t2502 = inttoptr i64 %t2501 to ptr
  call void @intrinsic_print(ptr %t2502)
  %t2503 = load i64, ptr %local.entropy.2007
  %t2504 = call i64 @"print_f64"(i64 %t2503)
  %t2505 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.359)
  %t2506 = ptrtoint ptr %t2505 to i64
  %t2507 = inttoptr i64 %t2506 to ptr
  call void @intrinsic_println(ptr %t2507)
  %t2508 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.360)
  %t2509 = ptrtoint ptr %t2508 to i64
  %t2510 = inttoptr i64 %t2509 to ptr
  call void @intrinsic_print(ptr %t2510)
  %t2511 = load i64, ptr %local.drift.2006
  %t2512 = call i64 @"print_f64"(i64 %t2511)
  %t2513 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.361)
  %t2514 = ptrtoint ptr %t2513 to i64
  %t2515 = inttoptr i64 %t2514 to ptr
  call void @intrinsic_println(ptr %t2515)
  %t2516 = load i64, ptr %local.drift.2006
  %t2517 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.362)
  %t2518 = call i64 @"sx_f64_lt"(i64 %t2516, i64 %t2517)
  %t2519 = icmp ne i64 %t2518, 0
  br i1 %t2519, label %then42, label %else42
then42:
  %t2520 = load i64, ptr %local.entropy.2007
  %t2521 = load i64, ptr %local.max_entropy.2030
  %t2522 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.363)
  %t2523 = call i64 @"sx_f64_mul"(i64 %t2521, i64 %t2522)
  %t2524 = call i64 @"sx_f64_lt"(i64 %t2520, i64 %t2523)
  %t2525 = icmp ne i64 %t2524, 0
  br i1 %t2525, label %then43, label %else43
then43:
  %t2526 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.364)
  %t2527 = ptrtoint ptr %t2526 to i64
  %t2528 = inttoptr i64 %t2527 to ptr
  call void @intrinsic_println(ptr %t2528)
  br label %then43_end
then43_end:
  br label %endif43
else43:
  %t2529 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.365)
  %t2530 = ptrtoint ptr %t2529 to i64
  %t2531 = inttoptr i64 %t2530 to ptr
  call void @intrinsic_println(ptr %t2531)
  br label %else43_end
else43_end:
  br label %endif43
endif43:
  %t2532 = phi i64 [ 0, %then43_end ], [ 0, %else43_end ]
  br label %then42_end
then42_end:
  br label %endif42
else42:
  %t2533 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.366)
  %t2534 = ptrtoint ptr %t2533 to i64
  %t2535 = inttoptr i64 %t2534 to ptr
  call void @intrinsic_println(ptr %t2535)
  br label %else42_end
else42_end:
  br label %endif42
endif42:
  %t2536 = phi i64 [ %t2532, %then42_end ], [ 0, %else42_end ]
  ret i64 0
}

define i64 @"run_exp4"() nounwind {
entry:
  %local.alpha_ab.2537 = alloca i64
  %local.alpha_ac.2538 = alloca i64
  %local.alpha_ba.2539 = alloca i64
  %local.alpha_bc.2540 = alloca i64
  %local.alpha_ca.2541 = alloca i64
  %local.alpha_cb.2542 = alloca i64
  %local.prev_ab.2543 = alloca i64
  %local.prev_ac.2544 = alloca i64
  %local.prev_ba.2545 = alloca i64
  %local.prev_bc.2546 = alloca i64
  %local.prev_ca.2547 = alloca i64
  %local.prev_cb.2548 = alloca i64
  %local.mg.2549 = alloca i64
  %local.max_alpha.2550 = alloca i64
  %local.dominant.2551 = alloca i64
  %local.prev_dominant.2552 = alloca i64
  %local.changes.2553 = alloca i64
  %local.stable_from.2554 = alloca i64
  %local.found_stable.2555 = alloca i64
  %local.meta_lr.2556 = alloca i64
  %local.inner_steps.2557 = alloca i64
  %local.meta_cycles.2558 = alloca i64
  %local.ta0.2559 = alloca i64
  %local.ta1.2560 = alloca i64
  %local.ta2.2561 = alloca i64
  %local.ta3.2562 = alloca i64
  %local.tb0.2563 = alloca i64
  %local.tb1.2564 = alloca i64
  %local.tb2.2565 = alloca i64
  %local.tb3.2566 = alloca i64
  %local.tc0.2567 = alloca i64
  %local.tc1.2568 = alloca i64
  %local.tc2.2569 = alloca i64
  %local.tc3.2570 = alloca i64
  %local.cycle.2571 = alloca i64
  %local.rem.2572 = alloca i64
  %local.min_alpha.2573 = alloca i64
  %local.min_pair.2574 = alloca i64
  %local.ratio_dom.2575 = alloca i64
  %t2576 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.367)
  %t2577 = ptrtoint ptr %t2576 to i64
  %t2578 = inttoptr i64 %t2577 to ptr
  call void @intrinsic_println(ptr %t2578)
  %t2579 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.368)
  %t2580 = ptrtoint ptr %t2579 to i64
  %t2581 = inttoptr i64 %t2580 to ptr
  call void @intrinsic_println(ptr %t2581)
  %t2582 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.369)
  %t2583 = ptrtoint ptr %t2582 to i64
  %t2584 = inttoptr i64 %t2583 to ptr
  call void @intrinsic_println(ptr %t2584)
  %t2585 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.370)
  %t2586 = ptrtoint ptr %t2585 to i64
  %t2587 = inttoptr i64 %t2586 to ptr
  call void @intrinsic_println(ptr %t2587)
  %t2588 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.371)
  %t2589 = ptrtoint ptr %t2588 to i64
  %t2590 = inttoptr i64 %t2589 to ptr
  call void @intrinsic_println(ptr %t2590)
  %t2591 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.372)
  %t2592 = ptrtoint ptr %t2591 to i64
  %t2593 = inttoptr i64 %t2592 to ptr
  call void @intrinsic_println(ptr %t2593)
  %t2594 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.373)
  %t2595 = ptrtoint ptr %t2594 to i64
  %t2596 = inttoptr i64 %t2595 to ptr
  call void @intrinsic_println(ptr %t2596)
  %t2597 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.374)
  store i64 %t2597, ptr %local.alpha_ab.2537
  %t2598 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.375)
  store i64 %t2598, ptr %local.alpha_ac.2538
  %t2599 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.376)
  store i64 %t2599, ptr %local.alpha_ba.2539
  %t2600 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.377)
  store i64 %t2600, ptr %local.alpha_bc.2540
  %t2601 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.378)
  store i64 %t2601, ptr %local.alpha_ca.2541
  %t2602 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.379)
  store i64 %t2602, ptr %local.alpha_cb.2542
  %t2603 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.380)
  store i64 %t2603, ptr %local.prev_ab.2543
  %t2604 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.381)
  store i64 %t2604, ptr %local.prev_ac.2544
  %t2605 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.382)
  store i64 %t2605, ptr %local.prev_ba.2545
  %t2606 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.383)
  store i64 %t2606, ptr %local.prev_bc.2546
  %t2607 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.384)
  store i64 %t2607, ptr %local.prev_ca.2547
  %t2608 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.385)
  store i64 %t2608, ptr %local.prev_cb.2548
  %t2609 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.386)
  store i64 %t2609, ptr %local.mg.2549
  %t2610 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.387)
  store i64 %t2610, ptr %local.max_alpha.2550
  store i64 0, ptr %local.dominant.2551
  store i64 0, ptr %local.prev_dominant.2552
  store i64 0, ptr %local.changes.2553
  store i64 0, ptr %local.stable_from.2554
  store i64 0, ptr %local.found_stable.2555
  %t2611 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.388)
  store i64 %t2611, ptr %local.meta_lr.2556
  store i64 200, ptr %local.inner_steps.2557
  store i64 60, ptr %local.meta_cycles.2558
  %t2612 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.389)
  store i64 %t2612, ptr %local.ta0.2559
  %t2613 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.390)
  store i64 %t2613, ptr %local.ta1.2560
  %t2614 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.391)
  %t2615 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.392)
  %t2616 = call i64 @"sx_f64_sub"(i64 %t2614, i64 %t2615)
  store i64 %t2616, ptr %local.ta2.2561
  %t2617 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.393)
  store i64 %t2617, ptr %local.ta3.2562
  %t2618 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.394)
  %t2619 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.395)
  %t2620 = call i64 @"sx_f64_sub"(i64 %t2618, i64 %t2619)
  store i64 %t2620, ptr %local.tb0.2563
  %t2621 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.396)
  store i64 %t2621, ptr %local.tb1.2564
  %t2622 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.397)
  store i64 %t2622, ptr %local.tb2.2565
  %t2623 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.398)
  %t2624 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.399)
  %t2625 = call i64 @"sx_f64_sub"(i64 %t2623, i64 %t2624)
  store i64 %t2625, ptr %local.tb3.2566
  %t2626 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.400)
  store i64 %t2626, ptr %local.tc0.2567
  %t2627 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.401)
  %t2628 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.402)
  %t2629 = call i64 @"sx_f64_sub"(i64 %t2627, i64 %t2628)
  store i64 %t2629, ptr %local.tc1.2568
  %t2630 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.403)
  store i64 %t2630, ptr %local.tc2.2569
  %t2631 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.404)
  store i64 %t2631, ptr %local.tc3.2570
  %t2632 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.405)
  %t2633 = ptrtoint ptr %t2632 to i64
  %t2634 = inttoptr i64 %t2633 to ptr
  call void @intrinsic_println(ptr %t2634)
  %t2635 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.406)
  %t2636 = ptrtoint ptr %t2635 to i64
  %t2637 = inttoptr i64 %t2636 to ptr
  call void @intrinsic_println(ptr %t2637)
  store i64 0, ptr %local.cycle.2571
  br label %loop44
loop44:
  %t2638 = load i64, ptr %local.cycle.2571
  %t2639 = load i64, ptr %local.meta_cycles.2558
  %t2640 = icmp slt i64 %t2638, %t2639
  %t2641 = zext i1 %t2640 to i64
  %t2642 = icmp ne i64 %t2641, 0
  br i1 %t2642, label %body44, label %endloop44
body44:
  %t2643 = load i64, ptr %local.alpha_ab.2537
  store i64 %t2643, ptr %local.prev_ab.2543
  %t2644 = load i64, ptr %local.alpha_ac.2538
  store i64 %t2644, ptr %local.prev_ac.2544
  %t2645 = load i64, ptr %local.alpha_ba.2539
  store i64 %t2645, ptr %local.prev_ba.2545
  %t2646 = load i64, ptr %local.alpha_bc.2540
  store i64 %t2646, ptr %local.prev_bc.2546
  %t2647 = load i64, ptr %local.alpha_ca.2541
  store i64 %t2647, ptr %local.prev_ca.2547
  %t2648 = load i64, ptr %local.alpha_cb.2542
  store i64 %t2648, ptr %local.prev_cb.2548
  %t2649 = load i64, ptr %local.alpha_ab.2537
  %t2650 = load i64, ptr %local.alpha_ac.2538
  %t2651 = load i64, ptr %local.alpha_ba.2539
  %t2652 = load i64, ptr %local.alpha_bc.2540
  %t2653 = load i64, ptr %local.alpha_ca.2541
  %t2654 = load i64, ptr %local.alpha_cb.2542
  %t2655 = load i64, ptr %local.inner_steps.2557
  %t2656 = load i64, ptr %local.ta0.2559
  %t2657 = load i64, ptr %local.ta1.2560
  %t2658 = load i64, ptr %local.ta2.2561
  %t2659 = load i64, ptr %local.ta3.2562
  %t2660 = load i64, ptr %local.tb0.2563
  %t2661 = load i64, ptr %local.tb1.2564
  %t2662 = load i64, ptr %local.tb2.2565
  %t2663 = load i64, ptr %local.tb3.2566
  %t2664 = load i64, ptr %local.tc0.2567
  %t2665 = load i64, ptr %local.tc1.2568
  %t2666 = load i64, ptr %local.tc2.2569
  %t2667 = load i64, ptr %local.tc3.2570
  %t2668 = call i64 @"meta_grad_p"(i64 %t2649, i64 %t2650, i64 %t2651, i64 %t2652, i64 %t2653, i64 %t2654, i64 0, i64 %t2655, i64 %t2656, i64 %t2657, i64 %t2658, i64 %t2659, i64 %t2660, i64 %t2661, i64 %t2662, i64 %t2663, i64 %t2664, i64 %t2665, i64 %t2666, i64 %t2667)
  store i64 %t2668, ptr %local.mg.2549
  %t2669 = load i64, ptr %local.alpha_ab.2537
  %t2670 = load i64, ptr %local.meta_lr.2556
  %t2671 = load i64, ptr %local.mg.2549
  %t2672 = call i64 @"sx_f64_mul"(i64 %t2670, i64 %t2671)
  %t2673 = call i64 @"sx_f64_sub"(i64 %t2669, i64 %t2672)
  %t2674 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.407)
  %t2675 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.408)
  %t2676 = call i64 @"clamp"(i64 %t2673, i64 %t2674, i64 %t2675)
  store i64 %t2676, ptr %local.alpha_ab.2537
  %t2677 = load i64, ptr %local.alpha_ab.2537
  %t2678 = load i64, ptr %local.alpha_ac.2538
  %t2679 = load i64, ptr %local.alpha_ba.2539
  %t2680 = load i64, ptr %local.alpha_bc.2540
  %t2681 = load i64, ptr %local.alpha_ca.2541
  %t2682 = load i64, ptr %local.alpha_cb.2542
  %t2683 = load i64, ptr %local.inner_steps.2557
  %t2684 = load i64, ptr %local.ta0.2559
  %t2685 = load i64, ptr %local.ta1.2560
  %t2686 = load i64, ptr %local.ta2.2561
  %t2687 = load i64, ptr %local.ta3.2562
  %t2688 = load i64, ptr %local.tb0.2563
  %t2689 = load i64, ptr %local.tb1.2564
  %t2690 = load i64, ptr %local.tb2.2565
  %t2691 = load i64, ptr %local.tb3.2566
  %t2692 = load i64, ptr %local.tc0.2567
  %t2693 = load i64, ptr %local.tc1.2568
  %t2694 = load i64, ptr %local.tc2.2569
  %t2695 = load i64, ptr %local.tc3.2570
  %t2696 = call i64 @"meta_grad_p"(i64 %t2677, i64 %t2678, i64 %t2679, i64 %t2680, i64 %t2681, i64 %t2682, i64 1, i64 %t2683, i64 %t2684, i64 %t2685, i64 %t2686, i64 %t2687, i64 %t2688, i64 %t2689, i64 %t2690, i64 %t2691, i64 %t2692, i64 %t2693, i64 %t2694, i64 %t2695)
  store i64 %t2696, ptr %local.mg.2549
  %t2697 = load i64, ptr %local.alpha_ac.2538
  %t2698 = load i64, ptr %local.meta_lr.2556
  %t2699 = load i64, ptr %local.mg.2549
  %t2700 = call i64 @"sx_f64_mul"(i64 %t2698, i64 %t2699)
  %t2701 = call i64 @"sx_f64_sub"(i64 %t2697, i64 %t2700)
  %t2702 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.409)
  %t2703 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.410)
  %t2704 = call i64 @"clamp"(i64 %t2701, i64 %t2702, i64 %t2703)
  store i64 %t2704, ptr %local.alpha_ac.2538
  %t2705 = load i64, ptr %local.alpha_ab.2537
  %t2706 = load i64, ptr %local.alpha_ac.2538
  %t2707 = load i64, ptr %local.alpha_ba.2539
  %t2708 = load i64, ptr %local.alpha_bc.2540
  %t2709 = load i64, ptr %local.alpha_ca.2541
  %t2710 = load i64, ptr %local.alpha_cb.2542
  %t2711 = load i64, ptr %local.inner_steps.2557
  %t2712 = load i64, ptr %local.ta0.2559
  %t2713 = load i64, ptr %local.ta1.2560
  %t2714 = load i64, ptr %local.ta2.2561
  %t2715 = load i64, ptr %local.ta3.2562
  %t2716 = load i64, ptr %local.tb0.2563
  %t2717 = load i64, ptr %local.tb1.2564
  %t2718 = load i64, ptr %local.tb2.2565
  %t2719 = load i64, ptr %local.tb3.2566
  %t2720 = load i64, ptr %local.tc0.2567
  %t2721 = load i64, ptr %local.tc1.2568
  %t2722 = load i64, ptr %local.tc2.2569
  %t2723 = load i64, ptr %local.tc3.2570
  %t2724 = call i64 @"meta_grad_p"(i64 %t2705, i64 %t2706, i64 %t2707, i64 %t2708, i64 %t2709, i64 %t2710, i64 2, i64 %t2711, i64 %t2712, i64 %t2713, i64 %t2714, i64 %t2715, i64 %t2716, i64 %t2717, i64 %t2718, i64 %t2719, i64 %t2720, i64 %t2721, i64 %t2722, i64 %t2723)
  store i64 %t2724, ptr %local.mg.2549
  %t2725 = load i64, ptr %local.alpha_ba.2539
  %t2726 = load i64, ptr %local.meta_lr.2556
  %t2727 = load i64, ptr %local.mg.2549
  %t2728 = call i64 @"sx_f64_mul"(i64 %t2726, i64 %t2727)
  %t2729 = call i64 @"sx_f64_sub"(i64 %t2725, i64 %t2728)
  %t2730 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.411)
  %t2731 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.412)
  %t2732 = call i64 @"clamp"(i64 %t2729, i64 %t2730, i64 %t2731)
  store i64 %t2732, ptr %local.alpha_ba.2539
  %t2733 = load i64, ptr %local.alpha_ab.2537
  %t2734 = load i64, ptr %local.alpha_ac.2538
  %t2735 = load i64, ptr %local.alpha_ba.2539
  %t2736 = load i64, ptr %local.alpha_bc.2540
  %t2737 = load i64, ptr %local.alpha_ca.2541
  %t2738 = load i64, ptr %local.alpha_cb.2542
  %t2739 = load i64, ptr %local.inner_steps.2557
  %t2740 = load i64, ptr %local.ta0.2559
  %t2741 = load i64, ptr %local.ta1.2560
  %t2742 = load i64, ptr %local.ta2.2561
  %t2743 = load i64, ptr %local.ta3.2562
  %t2744 = load i64, ptr %local.tb0.2563
  %t2745 = load i64, ptr %local.tb1.2564
  %t2746 = load i64, ptr %local.tb2.2565
  %t2747 = load i64, ptr %local.tb3.2566
  %t2748 = load i64, ptr %local.tc0.2567
  %t2749 = load i64, ptr %local.tc1.2568
  %t2750 = load i64, ptr %local.tc2.2569
  %t2751 = load i64, ptr %local.tc3.2570
  %t2752 = call i64 @"meta_grad_p"(i64 %t2733, i64 %t2734, i64 %t2735, i64 %t2736, i64 %t2737, i64 %t2738, i64 3, i64 %t2739, i64 %t2740, i64 %t2741, i64 %t2742, i64 %t2743, i64 %t2744, i64 %t2745, i64 %t2746, i64 %t2747, i64 %t2748, i64 %t2749, i64 %t2750, i64 %t2751)
  store i64 %t2752, ptr %local.mg.2549
  %t2753 = load i64, ptr %local.alpha_bc.2540
  %t2754 = load i64, ptr %local.meta_lr.2556
  %t2755 = load i64, ptr %local.mg.2549
  %t2756 = call i64 @"sx_f64_mul"(i64 %t2754, i64 %t2755)
  %t2757 = call i64 @"sx_f64_sub"(i64 %t2753, i64 %t2756)
  %t2758 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.413)
  %t2759 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.414)
  %t2760 = call i64 @"clamp"(i64 %t2757, i64 %t2758, i64 %t2759)
  store i64 %t2760, ptr %local.alpha_bc.2540
  %t2761 = load i64, ptr %local.alpha_ab.2537
  %t2762 = load i64, ptr %local.alpha_ac.2538
  %t2763 = load i64, ptr %local.alpha_ba.2539
  %t2764 = load i64, ptr %local.alpha_bc.2540
  %t2765 = load i64, ptr %local.alpha_ca.2541
  %t2766 = load i64, ptr %local.alpha_cb.2542
  %t2767 = load i64, ptr %local.inner_steps.2557
  %t2768 = load i64, ptr %local.ta0.2559
  %t2769 = load i64, ptr %local.ta1.2560
  %t2770 = load i64, ptr %local.ta2.2561
  %t2771 = load i64, ptr %local.ta3.2562
  %t2772 = load i64, ptr %local.tb0.2563
  %t2773 = load i64, ptr %local.tb1.2564
  %t2774 = load i64, ptr %local.tb2.2565
  %t2775 = load i64, ptr %local.tb3.2566
  %t2776 = load i64, ptr %local.tc0.2567
  %t2777 = load i64, ptr %local.tc1.2568
  %t2778 = load i64, ptr %local.tc2.2569
  %t2779 = load i64, ptr %local.tc3.2570
  %t2780 = call i64 @"meta_grad_p"(i64 %t2761, i64 %t2762, i64 %t2763, i64 %t2764, i64 %t2765, i64 %t2766, i64 4, i64 %t2767, i64 %t2768, i64 %t2769, i64 %t2770, i64 %t2771, i64 %t2772, i64 %t2773, i64 %t2774, i64 %t2775, i64 %t2776, i64 %t2777, i64 %t2778, i64 %t2779)
  store i64 %t2780, ptr %local.mg.2549
  %t2781 = load i64, ptr %local.alpha_ca.2541
  %t2782 = load i64, ptr %local.meta_lr.2556
  %t2783 = load i64, ptr %local.mg.2549
  %t2784 = call i64 @"sx_f64_mul"(i64 %t2782, i64 %t2783)
  %t2785 = call i64 @"sx_f64_sub"(i64 %t2781, i64 %t2784)
  %t2786 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.415)
  %t2787 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.416)
  %t2788 = call i64 @"clamp"(i64 %t2785, i64 %t2786, i64 %t2787)
  store i64 %t2788, ptr %local.alpha_ca.2541
  %t2789 = load i64, ptr %local.alpha_ab.2537
  %t2790 = load i64, ptr %local.alpha_ac.2538
  %t2791 = load i64, ptr %local.alpha_ba.2539
  %t2792 = load i64, ptr %local.alpha_bc.2540
  %t2793 = load i64, ptr %local.alpha_ca.2541
  %t2794 = load i64, ptr %local.alpha_cb.2542
  %t2795 = load i64, ptr %local.inner_steps.2557
  %t2796 = load i64, ptr %local.ta0.2559
  %t2797 = load i64, ptr %local.ta1.2560
  %t2798 = load i64, ptr %local.ta2.2561
  %t2799 = load i64, ptr %local.ta3.2562
  %t2800 = load i64, ptr %local.tb0.2563
  %t2801 = load i64, ptr %local.tb1.2564
  %t2802 = load i64, ptr %local.tb2.2565
  %t2803 = load i64, ptr %local.tb3.2566
  %t2804 = load i64, ptr %local.tc0.2567
  %t2805 = load i64, ptr %local.tc1.2568
  %t2806 = load i64, ptr %local.tc2.2569
  %t2807 = load i64, ptr %local.tc3.2570
  %t2808 = call i64 @"meta_grad_p"(i64 %t2789, i64 %t2790, i64 %t2791, i64 %t2792, i64 %t2793, i64 %t2794, i64 5, i64 %t2795, i64 %t2796, i64 %t2797, i64 %t2798, i64 %t2799, i64 %t2800, i64 %t2801, i64 %t2802, i64 %t2803, i64 %t2804, i64 %t2805, i64 %t2806, i64 %t2807)
  store i64 %t2808, ptr %local.mg.2549
  %t2809 = load i64, ptr %local.alpha_cb.2542
  %t2810 = load i64, ptr %local.meta_lr.2556
  %t2811 = load i64, ptr %local.mg.2549
  %t2812 = call i64 @"sx_f64_mul"(i64 %t2810, i64 %t2811)
  %t2813 = call i64 @"sx_f64_sub"(i64 %t2809, i64 %t2812)
  %t2814 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.417)
  %t2815 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.418)
  %t2816 = call i64 @"clamp"(i64 %t2813, i64 %t2814, i64 %t2815)
  store i64 %t2816, ptr %local.alpha_cb.2542
  %t2817 = load i64, ptr %local.alpha_ab.2537
  store i64 %t2817, ptr %local.max_alpha.2550
  store i64 0, ptr %local.dominant.2551
  %t2818 = load i64, ptr %local.alpha_ac.2538
  %t2819 = load i64, ptr %local.max_alpha.2550
  %t2820 = call i64 @"sx_f64_gt"(i64 %t2818, i64 %t2819)
  %t2821 = icmp ne i64 %t2820, 0
  br i1 %t2821, label %then45, label %else45
then45:
  %t2822 = load i64, ptr %local.alpha_ac.2538
  store i64 %t2822, ptr %local.max_alpha.2550
  store i64 1, ptr %local.dominant.2551
  br label %then45_end
then45_end:
  br label %endif45
else45:
  br label %else45_end
else45_end:
  br label %endif45
endif45:
  %t2823 = phi i64 [ 0, %then45_end ], [ 0, %else45_end ]
  %t2824 = load i64, ptr %local.alpha_ba.2539
  %t2825 = load i64, ptr %local.max_alpha.2550
  %t2826 = call i64 @"sx_f64_gt"(i64 %t2824, i64 %t2825)
  %t2827 = icmp ne i64 %t2826, 0
  br i1 %t2827, label %then46, label %else46
then46:
  %t2828 = load i64, ptr %local.alpha_ba.2539
  store i64 %t2828, ptr %local.max_alpha.2550
  store i64 2, ptr %local.dominant.2551
  br label %then46_end
then46_end:
  br label %endif46
else46:
  br label %else46_end
else46_end:
  br label %endif46
endif46:
  %t2829 = phi i64 [ 0, %then46_end ], [ 0, %else46_end ]
  %t2830 = load i64, ptr %local.alpha_bc.2540
  %t2831 = load i64, ptr %local.max_alpha.2550
  %t2832 = call i64 @"sx_f64_gt"(i64 %t2830, i64 %t2831)
  %t2833 = icmp ne i64 %t2832, 0
  br i1 %t2833, label %then47, label %else47
then47:
  %t2834 = load i64, ptr %local.alpha_bc.2540
  store i64 %t2834, ptr %local.max_alpha.2550
  store i64 3, ptr %local.dominant.2551
  br label %then47_end
then47_end:
  br label %endif47
else47:
  br label %else47_end
else47_end:
  br label %endif47
endif47:
  %t2835 = phi i64 [ 0, %then47_end ], [ 0, %else47_end ]
  %t2836 = load i64, ptr %local.alpha_ca.2541
  %t2837 = load i64, ptr %local.max_alpha.2550
  %t2838 = call i64 @"sx_f64_gt"(i64 %t2836, i64 %t2837)
  %t2839 = icmp ne i64 %t2838, 0
  br i1 %t2839, label %then48, label %else48
then48:
  %t2840 = load i64, ptr %local.alpha_ca.2541
  store i64 %t2840, ptr %local.max_alpha.2550
  store i64 4, ptr %local.dominant.2551
  br label %then48_end
then48_end:
  br label %endif48
else48:
  br label %else48_end
else48_end:
  br label %endif48
endif48:
  %t2841 = phi i64 [ 0, %then48_end ], [ 0, %else48_end ]
  %t2842 = load i64, ptr %local.alpha_cb.2542
  %t2843 = load i64, ptr %local.max_alpha.2550
  %t2844 = call i64 @"sx_f64_gt"(i64 %t2842, i64 %t2843)
  %t2845 = icmp ne i64 %t2844, 0
  br i1 %t2845, label %then49, label %else49
then49:
  %t2846 = load i64, ptr %local.alpha_cb.2542
  store i64 %t2846, ptr %local.max_alpha.2550
  store i64 5, ptr %local.dominant.2551
  br label %then49_end
then49_end:
  br label %endif49
else49:
  br label %else49_end
else49_end:
  br label %endif49
endif49:
  %t2847 = phi i64 [ 0, %then49_end ], [ 0, %else49_end ]
  %t2848 = load i64, ptr %local.cycle.2571
  %t2849 = icmp sgt i64 %t2848, 0
  %t2850 = zext i1 %t2849 to i64
  %t2851 = icmp ne i64 %t2850, 0
  br i1 %t2851, label %then50, label %else50
then50:
  %t2852 = load i64, ptr %local.dominant.2551
  %t2853 = load i64, ptr %local.prev_dominant.2552
  %t2854 = icmp ne i64 %t2852, %t2853
  %t2855 = zext i1 %t2854 to i64
  %t2856 = icmp ne i64 %t2855, 0
  br i1 %t2856, label %then51, label %else51
then51:
  %t2857 = load i64, ptr %local.changes.2553
  %t2858 = add i64 %t2857, 1
  store i64 %t2858, ptr %local.changes.2553
  store i64 0, ptr %local.found_stable.2555
  br label %then51_end
then51_end:
  br label %endif51
else51:
  %t2859 = load i64, ptr %local.found_stable.2555
  %t2860 = icmp eq i64 %t2859, 0
  %t2861 = zext i1 %t2860 to i64
  %t2862 = icmp ne i64 %t2861, 0
  br i1 %t2862, label %then52, label %else52
then52:
  %t2863 = load i64, ptr %local.cycle.2571
  store i64 %t2863, ptr %local.stable_from.2554
  store i64 1, ptr %local.found_stable.2555
  br label %then52_end
then52_end:
  br label %endif52
else52:
  br label %else52_end
else52_end:
  br label %endif52
endif52:
  %t2864 = phi i64 [ 0, %then52_end ], [ 0, %else52_end ]
  br label %else51_end
else51_end:
  br label %endif51
endif51:
  %t2865 = phi i64 [ 0, %then51_end ], [ %t2864, %else51_end ]
  br label %then50_end
then50_end:
  br label %endif50
else50:
  br label %else50_end
else50_end:
  br label %endif50
endif50:
  %t2866 = phi i64 [ %t2865, %then50_end ], [ 0, %else50_end ]
  %t2867 = load i64, ptr %local.cycle.2571
  %t2868 = load i64, ptr %local.cycle.2571
  %t2869 = sdiv i64 %t2868, 5
  %t2870 = mul i64 %t2869, 5
  %t2871 = sub i64 %t2867, %t2870
  store i64 %t2871, ptr %local.rem.2572
  %t2872 = load i64, ptr %local.rem.2572
  %t2873 = icmp eq i64 %t2872, 0
  %t2874 = zext i1 %t2873 to i64
  %t2875 = icmp ne i64 %t2874, 0
  br i1 %t2875, label %then53, label %else53
then53:
  %t2876 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.419)
  %t2877 = ptrtoint ptr %t2876 to i64
  %t2878 = inttoptr i64 %t2877 to ptr
  call void @intrinsic_print(ptr %t2878)
  %t2879 = load i64, ptr %local.cycle.2571
  call void @print_i64(i64 %t2879)
  %t2880 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.420)
  %t2881 = ptrtoint ptr %t2880 to i64
  %t2882 = inttoptr i64 %t2881 to ptr
  call void @intrinsic_print(ptr %t2882)
  %t2883 = load i64, ptr %local.max_alpha.2550
  %t2884 = call i64 @"print_f64"(i64 %t2883)
  %t2885 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.421)
  %t2886 = ptrtoint ptr %t2885 to i64
  %t2887 = inttoptr i64 %t2886 to ptr
  call void @intrinsic_print(ptr %t2887)
  %t2888 = load i64, ptr %local.dominant.2551
  call void @print_i64(i64 %t2888)
  %t2889 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.422)
  %t2890 = ptrtoint ptr %t2889 to i64
  %t2891 = inttoptr i64 %t2890 to ptr
  call void @intrinsic_print(ptr %t2891)
  %t2892 = load i64, ptr %local.alpha_ab.2537
  %t2893 = call i64 @"print_f64"(i64 %t2892)
  %t2894 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.423)
  %t2895 = ptrtoint ptr %t2894 to i64
  %t2896 = inttoptr i64 %t2895 to ptr
  call void @intrinsic_print(ptr %t2896)
  %t2897 = load i64, ptr %local.alpha_ac.2538
  %t2898 = call i64 @"print_f64"(i64 %t2897)
  %t2899 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.424)
  %t2900 = ptrtoint ptr %t2899 to i64
  %t2901 = inttoptr i64 %t2900 to ptr
  call void @intrinsic_print(ptr %t2901)
  %t2902 = load i64, ptr %local.alpha_ba.2539
  %t2903 = call i64 @"print_f64"(i64 %t2902)
  %t2904 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.425)
  %t2905 = ptrtoint ptr %t2904 to i64
  %t2906 = inttoptr i64 %t2905 to ptr
  call void @intrinsic_print(ptr %t2906)
  %t2907 = load i64, ptr %local.alpha_bc.2540
  %t2908 = call i64 @"print_f64"(i64 %t2907)
  %t2909 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.426)
  %t2910 = ptrtoint ptr %t2909 to i64
  %t2911 = inttoptr i64 %t2910 to ptr
  call void @intrinsic_print(ptr %t2911)
  %t2912 = load i64, ptr %local.alpha_ca.2541
  %t2913 = call i64 @"print_f64"(i64 %t2912)
  %t2914 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.427)
  %t2915 = ptrtoint ptr %t2914 to i64
  %t2916 = inttoptr i64 %t2915 to ptr
  call void @intrinsic_print(ptr %t2916)
  %t2917 = load i64, ptr %local.alpha_cb.2542
  %t2918 = call i64 @"print_f64"(i64 %t2917)
  %t2919 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.428)
  %t2920 = ptrtoint ptr %t2919 to i64
  %t2921 = inttoptr i64 %t2920 to ptr
  call void @intrinsic_println(ptr %t2921)
  br label %then53_end
then53_end:
  br label %endif53
else53:
  br label %else53_end
else53_end:
  br label %endif53
endif53:
  %t2922 = phi i64 [ 0, %then53_end ], [ 0, %else53_end ]
  %t2923 = load i64, ptr %local.dominant.2551
  store i64 %t2923, ptr %local.prev_dominant.2552
  %t2924 = load i64, ptr %local.cycle.2571
  %t2925 = add i64 %t2924, 1
  store i64 %t2925, ptr %local.cycle.2571
  br label %loop44
endloop44:
  %t2926 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.429)
  %t2927 = ptrtoint ptr %t2926 to i64
  %t2928 = inttoptr i64 %t2927 to ptr
  call void @intrinsic_println(ptr %t2928)
  %t2929 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.430)
  %t2930 = ptrtoint ptr %t2929 to i64
  %t2931 = inttoptr i64 %t2930 to ptr
  call void @intrinsic_print(ptr %t2931)
  %t2932 = load i64, ptr %local.changes.2553
  call void @print_i64(i64 %t2932)
  %t2933 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.431)
  %t2934 = ptrtoint ptr %t2933 to i64
  %t2935 = inttoptr i64 %t2934 to ptr
  call void @intrinsic_println(ptr %t2935)
  %t2936 = load i64, ptr %local.found_stable.2555
  %t2937 = icmp eq i64 %t2936, 1
  %t2938 = zext i1 %t2937 to i64
  %t2939 = icmp ne i64 %t2938, 0
  br i1 %t2939, label %then54, label %else54
then54:
  %t2940 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.432)
  %t2941 = ptrtoint ptr %t2940 to i64
  %t2942 = inttoptr i64 %t2941 to ptr
  call void @intrinsic_print(ptr %t2942)
  %t2943 = load i64, ptr %local.stable_from.2554
  call void @print_i64(i64 %t2943)
  %t2944 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.433)
  %t2945 = ptrtoint ptr %t2944 to i64
  %t2946 = inttoptr i64 %t2945 to ptr
  call void @intrinsic_println(ptr %t2946)
  br label %then54_end
then54_end:
  br label %endif54
else54:
  br label %else54_end
else54_end:
  br label %endif54
endif54:
  %t2947 = phi i64 [ 0, %then54_end ], [ 0, %else54_end ]
  %t2948 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.434)
  %t2949 = ptrtoint ptr %t2948 to i64
  %t2950 = inttoptr i64 %t2949 to ptr
  call void @intrinsic_println(ptr %t2950)
  %t2951 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.435)
  %t2952 = ptrtoint ptr %t2951 to i64
  %t2953 = inttoptr i64 %t2952 to ptr
  call void @intrinsic_println(ptr %t2953)
  %t2954 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.436)
  %t2955 = ptrtoint ptr %t2954 to i64
  %t2956 = inttoptr i64 %t2955 to ptr
  call void @intrinsic_print(ptr %t2956)
  %t2957 = load i64, ptr %local.dominant.2551
  call void @print_i64(i64 %t2957)
  %t2958 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.437)
  %t2959 = ptrtoint ptr %t2958 to i64
  %t2960 = inttoptr i64 %t2959 to ptr
  call void @intrinsic_print(ptr %t2960)
  %t2961 = load i64, ptr %local.max_alpha.2550
  %t2962 = call i64 @"print_f64"(i64 %t2961)
  %t2963 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.438)
  %t2964 = ptrtoint ptr %t2963 to i64
  %t2965 = inttoptr i64 %t2964 to ptr
  call void @intrinsic_println(ptr %t2965)
  %t2966 = load i64, ptr %local.alpha_ab.2537
  store i64 %t2966, ptr %local.min_alpha.2573
  store i64 0, ptr %local.min_pair.2574
  %t2967 = load i64, ptr %local.alpha_ac.2538
  %t2968 = load i64, ptr %local.min_alpha.2573
  %t2969 = call i64 @"sx_f64_lt"(i64 %t2967, i64 %t2968)
  %t2970 = icmp ne i64 %t2969, 0
  br i1 %t2970, label %then55, label %else55
then55:
  %t2971 = load i64, ptr %local.alpha_ac.2538
  store i64 %t2971, ptr %local.min_alpha.2573
  store i64 1, ptr %local.min_pair.2574
  br label %then55_end
then55_end:
  br label %endif55
else55:
  br label %else55_end
else55_end:
  br label %endif55
endif55:
  %t2972 = phi i64 [ 0, %then55_end ], [ 0, %else55_end ]
  %t2973 = load i64, ptr %local.alpha_ba.2539
  %t2974 = load i64, ptr %local.min_alpha.2573
  %t2975 = call i64 @"sx_f64_lt"(i64 %t2973, i64 %t2974)
  %t2976 = icmp ne i64 %t2975, 0
  br i1 %t2976, label %then56, label %else56
then56:
  %t2977 = load i64, ptr %local.alpha_ba.2539
  store i64 %t2977, ptr %local.min_alpha.2573
  store i64 2, ptr %local.min_pair.2574
  br label %then56_end
then56_end:
  br label %endif56
else56:
  br label %else56_end
else56_end:
  br label %endif56
endif56:
  %t2978 = phi i64 [ 0, %then56_end ], [ 0, %else56_end ]
  %t2979 = load i64, ptr %local.alpha_bc.2540
  %t2980 = load i64, ptr %local.min_alpha.2573
  %t2981 = call i64 @"sx_f64_lt"(i64 %t2979, i64 %t2980)
  %t2982 = icmp ne i64 %t2981, 0
  br i1 %t2982, label %then57, label %else57
then57:
  %t2983 = load i64, ptr %local.alpha_bc.2540
  store i64 %t2983, ptr %local.min_alpha.2573
  store i64 3, ptr %local.min_pair.2574
  br label %then57_end
then57_end:
  br label %endif57
else57:
  br label %else57_end
else57_end:
  br label %endif57
endif57:
  %t2984 = phi i64 [ 0, %then57_end ], [ 0, %else57_end ]
  %t2985 = load i64, ptr %local.alpha_ca.2541
  %t2986 = load i64, ptr %local.min_alpha.2573
  %t2987 = call i64 @"sx_f64_lt"(i64 %t2985, i64 %t2986)
  %t2988 = icmp ne i64 %t2987, 0
  br i1 %t2988, label %then58, label %else58
then58:
  %t2989 = load i64, ptr %local.alpha_ca.2541
  store i64 %t2989, ptr %local.min_alpha.2573
  store i64 4, ptr %local.min_pair.2574
  br label %then58_end
then58_end:
  br label %endif58
else58:
  br label %else58_end
else58_end:
  br label %endif58
endif58:
  %t2990 = phi i64 [ 0, %then58_end ], [ 0, %else58_end ]
  %t2991 = load i64, ptr %local.alpha_cb.2542
  %t2992 = load i64, ptr %local.min_alpha.2573
  %t2993 = call i64 @"sx_f64_lt"(i64 %t2991, i64 %t2992)
  %t2994 = icmp ne i64 %t2993, 0
  br i1 %t2994, label %then59, label %else59
then59:
  %t2995 = load i64, ptr %local.alpha_cb.2542
  store i64 %t2995, ptr %local.min_alpha.2573
  store i64 5, ptr %local.min_pair.2574
  br label %then59_end
then59_end:
  br label %endif59
else59:
  br label %else59_end
else59_end:
  br label %endif59
endif59:
  %t2996 = phi i64 [ 0, %then59_end ], [ 0, %else59_end ]
  %t2997 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.439)
  %t2998 = ptrtoint ptr %t2997 to i64
  %t2999 = inttoptr i64 %t2998 to ptr
  call void @intrinsic_print(ptr %t2999)
  %t3000 = load i64, ptr %local.min_pair.2574
  call void @print_i64(i64 %t3000)
  %t3001 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.440)
  %t3002 = ptrtoint ptr %t3001 to i64
  %t3003 = inttoptr i64 %t3002 to ptr
  call void @intrinsic_print(ptr %t3003)
  %t3004 = load i64, ptr %local.min_alpha.2573
  %t3005 = call i64 @"print_f64"(i64 %t3004)
  %t3006 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.441)
  %t3007 = ptrtoint ptr %t3006 to i64
  %t3008 = inttoptr i64 %t3007 to ptr
  call void @intrinsic_println(ptr %t3008)
  %t3009 = load i64, ptr %local.max_alpha.2550
  %t3010 = load i64, ptr %local.min_alpha.2573
  %t3011 = call i64 @f64_parse(ptr @.str.exp_convergence_ratios.442)
  %t3012 = call i64 @"sx_f64_add"(i64 %t3010, i64 %t3011)
  %t3013 = call i64 @"sx_f64_div"(i64 %t3009, i64 %t3012)
  store i64 %t3013, ptr %local.ratio_dom.2575
  %t3014 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.443)
  %t3015 = ptrtoint ptr %t3014 to i64
  %t3016 = inttoptr i64 %t3015 to ptr
  call void @intrinsic_print(ptr %t3016)
  %t3017 = load i64, ptr %local.ratio_dom.2575
  %t3018 = call i64 @"print_f64"(i64 %t3017)
  %t3019 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.444)
  %t3020 = ptrtoint ptr %t3019 to i64
  %t3021 = inttoptr i64 %t3020 to ptr
  call void @intrinsic_println(ptr %t3021)
  %t3022 = load i64, ptr %local.changes.2553
  %t3023 = icmp slt i64 %t3022, 5
  %t3024 = zext i1 %t3023 to i64
  %t3025 = icmp ne i64 %t3024, 0
  br i1 %t3025, label %then60, label %else60
then60:
  %t3026 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.445)
  %t3027 = ptrtoint ptr %t3026 to i64
  %t3028 = inttoptr i64 %t3027 to ptr
  call void @intrinsic_println(ptr %t3028)
  br label %then60_end
then60_end:
  br label %endif60
else60:
  %t3029 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.446)
  %t3030 = ptrtoint ptr %t3029 to i64
  %t3031 = inttoptr i64 %t3030 to ptr
  call void @intrinsic_println(ptr %t3031)
  br label %else60_end
else60_end:
  br label %endif60
endif60:
  %t3032 = phi i64 [ 0, %then60_end ], [ 0, %else60_end ]
  ret i64 0
}

define i64 @"simplex_main"() nounwind {
entry:
  %local.r1.3033 = alloca i64
  %local.r2.3034 = alloca i64
  %local.r3.3035 = alloca i64
  %local.r4.3036 = alloca i64
  %t3037 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.447)
  %t3038 = ptrtoint ptr %t3037 to i64
  %t3039 = inttoptr i64 %t3038 to ptr
  call void @intrinsic_println(ptr %t3039)
  %t3040 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.448)
  %t3041 = ptrtoint ptr %t3040 to i64
  %t3042 = inttoptr i64 %t3041 to ptr
  call void @intrinsic_println(ptr %t3042)
  %t3043 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.449)
  %t3044 = ptrtoint ptr %t3043 to i64
  %t3045 = inttoptr i64 %t3044 to ptr
  call void @intrinsic_println(ptr %t3045)
  %t3046 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.450)
  %t3047 = ptrtoint ptr %t3046 to i64
  %t3048 = inttoptr i64 %t3047 to ptr
  call void @intrinsic_println(ptr %t3048)
  %t3049 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.451)
  %t3050 = ptrtoint ptr %t3049 to i64
  %t3051 = inttoptr i64 %t3050 to ptr
  call void @intrinsic_println(ptr %t3051)
  %t3052 = call i64 @"run_exp1"()
  store i64 %t3052, ptr %local.r1.3033
  %t3053 = call i64 @"run_exp2"()
  store i64 %t3053, ptr %local.r2.3034
  %t3054 = call i64 @"run_exp3"()
  store i64 %t3054, ptr %local.r3.3035
  %t3055 = call i64 @"run_exp4"()
  store i64 %t3055, ptr %local.r4.3036
  %t3056 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.452)
  %t3057 = ptrtoint ptr %t3056 to i64
  %t3058 = inttoptr i64 %t3057 to ptr
  call void @intrinsic_println(ptr %t3058)
  %t3059 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.453)
  %t3060 = ptrtoint ptr %t3059 to i64
  %t3061 = inttoptr i64 %t3060 to ptr
  call void @intrinsic_println(ptr %t3061)
  %t3062 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.454)
  %t3063 = ptrtoint ptr %t3062 to i64
  %t3064 = inttoptr i64 %t3063 to ptr
  call void @intrinsic_println(ptr %t3064)
  %t3065 = call ptr @intrinsic_string_new(ptr @.str.exp_convergence_ratios.455)
  %t3066 = ptrtoint ptr %t3065 to i64
  %t3067 = inttoptr i64 %t3066 to ptr
  call void @intrinsic_println(ptr %t3067)
  ret i64 0
}


; String constants
@.str.exp_convergence_ratios.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.2 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_convergence_ratios.3 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.4 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.5 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_convergence_ratios.6 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.7 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.8 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.9 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.10 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.11 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.12 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.13 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.14 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.15 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.16 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.17 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.18 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.19 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.20 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.21 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.22 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.23 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.24 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.25 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.26 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.27 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.28 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.29 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.30 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.31 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.32 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.33 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.34 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_convergence_ratios.35 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.36 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.37 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.38 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.39 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.40 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.41 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.42 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.43 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.44 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.45 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.46 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.47 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_convergence_ratios.48 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.49 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.50 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.51 = private unnamed_addr constant [5 x i8] c"99.0\00"
@.str.exp_convergence_ratios.52 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.53 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.54 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.55 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.56 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_convergence_ratios.57 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_convergence_ratios.58 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_convergence_ratios.59 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_convergence_ratios.60 = private unnamed_addr constant [4 x i8] c"7.0\00"
@.str.exp_convergence_ratios.61 = private unnamed_addr constant [4 x i8] c"9.0\00"
@.str.exp_convergence_ratios.62 = private unnamed_addr constant [5 x i8] c"11.0\00"
@.str.exp_convergence_ratios.63 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.64 = private unnamed_addr constant [18 x i8] c"0.693147180559945\00"
@.str.exp_convergence_ratios.65 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_convergence_ratios.66 = private unnamed_addr constant [36 x i8] c"  EXP 1: CONVERGENCE RATIO ANALYSIS\00"
@.str.exp_convergence_ratios.67 = private unnamed_addr constant [45 x i8] c"  R(t) = D(t+1) / D(t) — does it converge?\00"
@.str.exp_convergence_ratios.68 = private unnamed_addr constant [53 x i8] c"  Targets: A=[3,1,-2,4] B=[-1,3,2,-3] C=[0.5,-2,4,0]\00"
@.str.exp_convergence_ratios.69 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_convergence_ratios.70 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.71 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.72 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.73 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.74 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.75 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.76 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.77 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.78 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.79 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.80 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.81 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.82 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.83 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.84 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.85 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.86 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.87 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.88 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_convergence_ratios.89 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_convergence_ratios.90 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_convergence_ratios.91 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.92 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.93 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_convergence_ratios.94 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.95 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_convergence_ratios.96 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_convergence_ratios.97 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.98 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.99 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_convergence_ratios.100 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.101 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.102 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.103 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_convergence_ratios.104 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.105 = private unnamed_addr constant [40 x i8] c"  Cycle   D(t)         R(t)=D(t)/D(t-1)\00"
@.str.exp_convergence_ratios.106 = private unnamed_addr constant [41 x i8] c"  -----   ----------   -----------------\00"
@.str.exp_convergence_ratios.107 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.108 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.109 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.110 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.111 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.112 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.113 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.114 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.115 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.116 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.117 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.118 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.119 = private unnamed_addr constant [10 x i8] c"0.0000001\00"
@.str.exp_convergence_ratios.120 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.121 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.122 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_convergence_ratios.123 = private unnamed_addr constant [8 x i8] c"       \00"
@.str.exp_convergence_ratios.124 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_convergence_ratios.125 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.126 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_convergence_ratios.127 = private unnamed_addr constant [7 x i8] c"      \00"
@.str.exp_convergence_ratios.128 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_convergence_ratios.129 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.130 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.131 = private unnamed_addr constant [34 x i8] c"  Average R over last 20 cycles: \00"
@.str.exp_convergence_ratios.132 = private unnamed_addr constant [5 x i8] c"20.0\00"
@.str.exp_convergence_ratios.133 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.134 = private unnamed_addr constant [13 x i8] c"1.6180339887\00"
@.str.exp_convergence_ratios.135 = private unnamed_addr constant [13 x i8] c"0.6180339887\00"
@.str.exp_convergence_ratios.136 = private unnamed_addr constant [13 x i8] c"0.3678794412\00"
@.str.exp_convergence_ratios.137 = private unnamed_addr constant [13 x i8] c"0.3183098862\00"
@.str.exp_convergence_ratios.138 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.139 = private unnamed_addr constant [33 x i8] c"  Comparison to known constants:\00"
@.str.exp_convergence_ratios.140 = private unnamed_addr constant [27 x i8] c"    R_avg               = \00"
@.str.exp_convergence_ratios.141 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.142 = private unnamed_addr constant [27 x i8] c"    1/phi (0.618...)    = \00"
@.str.exp_convergence_ratios.143 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.144 = private unnamed_addr constant [27 x i8] c"    1/e   (0.368...)    = \00"
@.str.exp_convergence_ratios.145 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.146 = private unnamed_addr constant [27 x i8] c"    1/pi  (0.318...)    = \00"
@.str.exp_convergence_ratios.147 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.148 = private unnamed_addr constant [19 x i8] c"    |R - 1/phi| = \00"
@.str.exp_convergence_ratios.149 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.150 = private unnamed_addr constant [19 x i8] c"    |R - 1/e|   = \00"
@.str.exp_convergence_ratios.151 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.152 = private unnamed_addr constant [19 x i8] c"    |R - 1/pi|  = \00"
@.str.exp_convergence_ratios.153 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.154 = private unnamed_addr constant [10 x i8] c"(no data)\00"
@.str.exp_convergence_ratios.155 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.156 = private unnamed_addr constant [16 x i8] c"  Final alphas:\00"
@.str.exp_convergence_ratios.157 = private unnamed_addr constant [11 x i8] c"    A->B: \00"
@.str.exp_convergence_ratios.158 = private unnamed_addr constant [9 x i8] c"  A->C: \00"
@.str.exp_convergence_ratios.159 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.160 = private unnamed_addr constant [11 x i8] c"    B->A: \00"
@.str.exp_convergence_ratios.161 = private unnamed_addr constant [9 x i8] c"  B->C: \00"
@.str.exp_convergence_ratios.162 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.163 = private unnamed_addr constant [11 x i8] c"    C->A: \00"
@.str.exp_convergence_ratios.164 = private unnamed_addr constant [9 x i8] c"  C->B: \00"
@.str.exp_convergence_ratios.165 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.166 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.167 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.168 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.169 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.170 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.171 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.172 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.173 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.174 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.175 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.176 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.177 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.178 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.179 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.180 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.181 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.182 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.183 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_convergence_ratios.184 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.185 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.186 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.187 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.188 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.189 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.190 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.191 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.192 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.193 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.194 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.195 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.196 = private unnamed_addr constant [10 x i8] c"0.0000001\00"
@.str.exp_convergence_ratios.197 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.198 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.199 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_convergence_ratios.200 = private unnamed_addr constant [28 x i8] c"  EXP 2: RATIO UNIVERSALITY\00"
@.str.exp_convergence_ratios.201 = private unnamed_addr constant [56 x i8] c"  Does R converge to the same constant across problems?\00"
@.str.exp_convergence_ratios.202 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_convergence_ratios.203 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.204 = private unnamed_addr constant [39 x i8] c"  Problem 1: Mild conflict (spread ~3)\00"
@.str.exp_convergence_ratios.205 = private unnamed_addr constant [46 x i8] c"    A=[2,0,-1,1] B=[-1,2,1,-2] C=[0.5,-1,2,0]\00"
@.str.exp_convergence_ratios.206 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.207 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.208 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.209 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.210 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_convergence_ratios.211 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_convergence_ratios.212 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.213 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_convergence_ratios.214 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.215 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_convergence_ratios.216 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.217 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.218 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.219 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.220 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_convergence_ratios.221 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.222 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.223 = private unnamed_addr constant [22 x i8] c"    Avg R (last 20): \00"
@.str.exp_convergence_ratios.224 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.225 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.226 = private unnamed_addr constant [41 x i8] c"  Problem 2: Strong conflict (spread ~6)\00"
@.str.exp_convergence_ratios.227 = private unnamed_addr constant [44 x i8] c"    A=[5,1,-4,6] B=[-3,5,3,-5] C=[1,-4,7,0]\00"
@.str.exp_convergence_ratios.228 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.229 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_convergence_ratios.230 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_convergence_ratios.231 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.232 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_convergence_ratios.233 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_convergence_ratios.234 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.235 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_convergence_ratios.236 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_convergence_ratios.237 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_convergence_ratios.238 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.239 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_convergence_ratios.240 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_convergence_ratios.241 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.242 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_convergence_ratios.243 = private unnamed_addr constant [4 x i8] c"7.0\00"
@.str.exp_convergence_ratios.244 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.245 = private unnamed_addr constant [22 x i8] c"    Avg R (last 20): \00"
@.str.exp_convergence_ratios.246 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.247 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.248 = private unnamed_addr constant [43 x i8] c"  Problem 3: Original targets (from Exp 1)\00"
@.str.exp_convergence_ratios.249 = private unnamed_addr constant [46 x i8] c"    A=[3,1,-2,4] B=[-1,3,2,-3] C=[0.5,-2,4,0]\00"
@.str.exp_convergence_ratios.250 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.251 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_convergence_ratios.252 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_convergence_ratios.253 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.254 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.255 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_convergence_ratios.256 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.257 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_convergence_ratios.258 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_convergence_ratios.259 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.260 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.261 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_convergence_ratios.262 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.263 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.264 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.265 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_convergence_ratios.266 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.267 = private unnamed_addr constant [22 x i8] c"    Avg R (last 20): \00"
@.str.exp_convergence_ratios.268 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.269 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.270 = private unnamed_addr constant [22 x i8] c"  Universality check:\00"
@.str.exp_convergence_ratios.271 = private unnamed_addr constant [17 x i8] c"    |R1 - R2| = \00"
@.str.exp_convergence_ratios.272 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.273 = private unnamed_addr constant [17 x i8] c"    |R1 - R3| = \00"
@.str.exp_convergence_ratios.274 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.275 = private unnamed_addr constant [17 x i8] c"    |R2 - R3| = \00"
@.str.exp_convergence_ratios.276 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.277 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_convergence_ratios.278 = private unnamed_addr constant [61 x i8] c"    RESULT: Ratios are CLOSE — possible universal constant\00"
@.str.exp_convergence_ratios.279 = private unnamed_addr constant [60 x i8] c"    RESULT: Ratios DIFFER — R depends on problem geometry\00"
@.str.exp_convergence_ratios.280 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.281 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_convergence_ratios.282 = private unnamed_addr constant [39 x i8] c"  EXP 3: ENTROPY OF INTERACTION MATRIX\00"
@.str.exp_convergence_ratios.283 = private unnamed_addr constant [52 x i8] c"  H(M) = -sum(p_ij * ln(p_ij))  as matrix converges\00"
@.str.exp_convergence_ratios.284 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_convergence_ratios.285 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.286 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.287 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.288 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.289 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.290 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.291 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.292 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.293 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.294 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.295 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.296 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.297 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.298 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.299 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.300 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.301 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.302 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.303 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.304 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_convergence_ratios.305 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_convergence_ratios.306 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_convergence_ratios.307 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.308 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.309 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_convergence_ratios.310 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.311 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_convergence_ratios.312 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_convergence_ratios.313 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.314 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.315 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_convergence_ratios.316 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.317 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.318 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.319 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_convergence_ratios.320 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.321 = private unnamed_addr constant [55 x i8] c"  Cycle   Drift        Entropy      dH (H_t - H_{t-1})\00"
@.str.exp_convergence_ratios.322 = private unnamed_addr constant [56 x i8] c"  -----   ----------   ----------   -------------------\00"
@.str.exp_convergence_ratios.323 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.324 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.325 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.326 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.327 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.328 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.329 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.330 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.331 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.332 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.333 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.334 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.335 = private unnamed_addr constant [9 x i8] c"0.000001\00"
@.str.exp_convergence_ratios.336 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.337 = private unnamed_addr constant [9 x i8] c"0.000001\00"
@.str.exp_convergence_ratios.338 = private unnamed_addr constant [9 x i8] c"0.000001\00"
@.str.exp_convergence_ratios.339 = private unnamed_addr constant [9 x i8] c"0.000001\00"
@.str.exp_convergence_ratios.340 = private unnamed_addr constant [9 x i8] c"0.000001\00"
@.str.exp_convergence_ratios.341 = private unnamed_addr constant [9 x i8] c"0.000001\00"
@.str.exp_convergence_ratios.342 = private unnamed_addr constant [9 x i8] c"0.000001\00"
@.str.exp_convergence_ratios.343 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_convergence_ratios.344 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_convergence_ratios.345 = private unnamed_addr constant [7 x i8] c"      \00"
@.str.exp_convergence_ratios.346 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_convergence_ratios.347 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_convergence_ratios.348 = private unnamed_addr constant [3 x i8] c"--\00"
@.str.exp_convergence_ratios.349 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.350 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.351 = private unnamed_addr constant [37 x i8] c"  Entropy monotonically decreasing? \00"
@.str.exp_convergence_ratios.352 = private unnamed_addr constant [2 x i8] c"/\00"
@.str.exp_convergence_ratios.353 = private unnamed_addr constant [27 x i8] c" cycles had H_t <= H_{t-1}\00"
@.str.exp_convergence_ratios.354 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.355 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_convergence_ratios.356 = private unnamed_addr constant [46 x i8] c"  Max possible entropy (uniform, 6 entries): \00"
@.str.exp_convergence_ratios.357 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.358 = private unnamed_addr constant [18 x i8] c"  Final entropy: \00"
@.str.exp_convergence_ratios.359 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.360 = private unnamed_addr constant [18 x i8] c"  Final drift:   \00"
@.str.exp_convergence_ratios.361 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.362 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_convergence_ratios.363 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.364 = private unnamed_addr constant [56 x i8] c"  RESULT: Low drift + low entropy => matrix specialised\00"
@.str.exp_convergence_ratios.365 = private unnamed_addr constant [60 x i8] c"  RESULT: Low drift + high entropy => matrix stayed uniform\00"
@.str.exp_convergence_ratios.366 = private unnamed_addr constant [45 x i8] c"  RESULT: Matrix still drifting at 60 cycles\00"
@.str.exp_convergence_ratios.367 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.368 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_convergence_ratios.369 = private unnamed_addr constant [53 x i8] c"  EXP 4: DOMINANT PAIR TRACKING (Eigenvalue Analogy)\00"
@.str.exp_convergence_ratios.370 = private unnamed_addr constant [40 x i8] c"  Which alpha is largest at each cycle?\00"
@.str.exp_convergence_ratios.371 = private unnamed_addr constant [39 x i8] c"  Pairs: 0=AB 1=AC 2=BA 3=BC 4=CA 5=CB\00"
@.str.exp_convergence_ratios.372 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_convergence_ratios.373 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.374 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.375 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.376 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.377 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.378 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.379 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.380 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.381 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.382 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.383 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.384 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.385 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.386 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.387 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.388 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_convergence_ratios.389 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_convergence_ratios.390 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_convergence_ratios.391 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.392 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.393 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_convergence_ratios.394 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.395 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_convergence_ratios.396 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_convergence_ratios.397 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.398 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.399 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_convergence_ratios.400 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_convergence_ratios.401 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.402 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.403 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_convergence_ratios.404 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.405 = private unnamed_addr constant [49 x i8] c"  Cycle   max_alpha   dominant_pair   all_alphas\00"
@.str.exp_convergence_ratios.406 = private unnamed_addr constant [49 x i8] c"  -----   ---------   -------------   ----------\00"
@.str.exp_convergence_ratios.407 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.408 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.409 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.410 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.411 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.412 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.413 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.414 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.415 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.416 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.417 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_convergence_ratios.418 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_convergence_ratios.419 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_convergence_ratios.420 = private unnamed_addr constant [7 x i8] c"      \00"
@.str.exp_convergence_ratios.421 = private unnamed_addr constant [9 x i8] c"   pair=\00"
@.str.exp_convergence_ratios.422 = private unnamed_addr constant [11 x i8] c"          \00"
@.str.exp_convergence_ratios.423 = private unnamed_addr constant [2 x i8] c" \00"
@.str.exp_convergence_ratios.424 = private unnamed_addr constant [2 x i8] c" \00"
@.str.exp_convergence_ratios.425 = private unnamed_addr constant [2 x i8] c" \00"
@.str.exp_convergence_ratios.426 = private unnamed_addr constant [2 x i8] c" \00"
@.str.exp_convergence_ratios.427 = private unnamed_addr constant [2 x i8] c" \00"
@.str.exp_convergence_ratios.428 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.429 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.430 = private unnamed_addr constant [32 x i8] c"  Total dominant-pair changes: \00"
@.str.exp_convergence_ratios.431 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.432 = private unnamed_addr constant [36 x i8] c"  Dominant pair stable from cycle: \00"
@.str.exp_convergence_ratios.433 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.434 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.435 = private unnamed_addr constant [62 x i8] c"  Pair labels: 0=A->B, 1=A->C, 2=B->A, 3=B->C, 4=C->A, 5=C->B\00"
@.str.exp_convergence_ratios.436 = private unnamed_addr constant [24 x i8] c"  Final dominant pair: \00"
@.str.exp_convergence_ratios.437 = private unnamed_addr constant [13 x i8] c" with alpha=\00"
@.str.exp_convergence_ratios.438 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.439 = private unnamed_addr constant [19 x i8] c"  Weakest pair:   \00"
@.str.exp_convergence_ratios.440 = private unnamed_addr constant [13 x i8] c" with alpha=\00"
@.str.exp_convergence_ratios.441 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.442 = private unnamed_addr constant [9 x i8] c"0.000001\00"
@.str.exp_convergence_ratios.443 = private unnamed_addr constant [30 x i8] c"  Dominance ratio (max/min): \00"
@.str.exp_convergence_ratios.444 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.445 = private unnamed_addr constant [48 x i8] c"  RESULT: Dominant pair is STABLE (few changes)\00"
@.str.exp_convergence_ratios.446 = private unnamed_addr constant [50 x i8] c"  RESULT: Dominant pair FLUCTUATES (many changes)\00"
@.str.exp_convergence_ratios.447 = private unnamed_addr constant [65 x i8] c"################################################################\00"
@.str.exp_convergence_ratios.448 = private unnamed_addr constant [65 x i8] c"#  CONVERGENCE RATIO SERIES EXPERIMENT                         #\00"
@.str.exp_convergence_ratios.449 = private unnamed_addr constant [65 x i8] c"#  Does D(t+1)/D(t) converge to a universal constant?          #\00"
@.str.exp_convergence_ratios.450 = private unnamed_addr constant [65 x i8] c"################################################################\00"
@.str.exp_convergence_ratios.451 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.452 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_convergence_ratios.453 = private unnamed_addr constant [65 x i8] c"################################################################\00"
@.str.exp_convergence_ratios.454 = private unnamed_addr constant [66 x i8] c"#  ALL EXPERIMENTS COMPLETE                                     #\00"
@.str.exp_convergence_ratios.455 = private unnamed_addr constant [65 x i8] c"################################################################\00"
