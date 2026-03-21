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
  %t1 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"zeta_re"(i64 %sigma, i64 %t, i64 %nterms) nounwind {
entry:
  %local.sum.9 = alloca i64
  %local.n.10 = alloca i64
  %local.nf.11 = alloca i64
  %local.mag.12 = alloca i64
  %local.sigma = alloca i64
  store i64 %sigma, ptr %local.sigma
  %local.t = alloca i64
  store i64 %t, ptr %local.t
  %local.nterms = alloca i64
  store i64 %nterms, ptr %local.nterms
  %t13 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.2)
  store i64 %t13, ptr %local.sum.9
  store i64 1, ptr %local.n.10
  br label %loop1
loop1:
  %t14 = load i64, ptr %local.n.10
  %t15 = load i64, ptr %local.nterms
  %t16 = icmp sle i64 %t14, %t15
  %t17 = zext i1 %t16 to i64
  %t18 = icmp ne i64 %t17, 0
  br i1 %t18, label %body1, label %endloop1
body1:
  %t19 = load i64, ptr %local.n.10
  %t20 = call i64 @"sx_int_to_f64"(i64 %t19)
  store i64 %t20, ptr %local.nf.11
  %t21 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.3)
  %t22 = load i64, ptr %local.sigma
  %t23 = load i64, ptr %local.nf.11
  %t24 = call i64 @"ln_f64"(i64 %t23)
  %t25 = call i64 @"sx_f64_mul"(i64 %t22, i64 %t24)
  %t26 = call i64 @"sx_f64_sub"(i64 %t21, i64 %t25)
  %t27 = call i64 @"exp_f64"(i64 %t26)
  store i64 %t27, ptr %local.mag.12
  %t28 = load i64, ptr %local.sum.9
  %t29 = load i64, ptr %local.mag.12
  %t30 = load i64, ptr %local.t
  %t31 = load i64, ptr %local.nf.11
  %t32 = call i64 @"ln_f64"(i64 %t31)
  %t33 = call i64 @"sx_f64_mul"(i64 %t30, i64 %t32)
  %t34 = call i64 @"cos_f64"(i64 %t33)
  %t35 = call i64 @"sx_f64_mul"(i64 %t29, i64 %t34)
  %t36 = call i64 @"sx_f64_add"(i64 %t28, i64 %t35)
  store i64 %t36, ptr %local.sum.9
  %t37 = load i64, ptr %local.n.10
  %t38 = add i64 %t37, 1
  store i64 %t38, ptr %local.n.10
  br label %loop1
endloop1:
  %t39 = load i64, ptr %local.sum.9
  ret i64 %t39
}

define i64 @"zeta_im"(i64 %sigma, i64 %t, i64 %nterms) nounwind {
entry:
  %local.sum.40 = alloca i64
  %local.n.41 = alloca i64
  %local.nf.42 = alloca i64
  %local.mag.43 = alloca i64
  %local.sigma = alloca i64
  store i64 %sigma, ptr %local.sigma
  %local.t = alloca i64
  store i64 %t, ptr %local.t
  %local.nterms = alloca i64
  store i64 %nterms, ptr %local.nterms
  %t44 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.4)
  store i64 %t44, ptr %local.sum.40
  store i64 1, ptr %local.n.41
  br label %loop2
loop2:
  %t45 = load i64, ptr %local.n.41
  %t46 = load i64, ptr %local.nterms
  %t47 = icmp sle i64 %t45, %t46
  %t48 = zext i1 %t47 to i64
  %t49 = icmp ne i64 %t48, 0
  br i1 %t49, label %body2, label %endloop2
body2:
  %t50 = load i64, ptr %local.n.41
  %t51 = call i64 @"sx_int_to_f64"(i64 %t50)
  store i64 %t51, ptr %local.nf.42
  %t52 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.5)
  %t53 = load i64, ptr %local.sigma
  %t54 = load i64, ptr %local.nf.42
  %t55 = call i64 @"ln_f64"(i64 %t54)
  %t56 = call i64 @"sx_f64_mul"(i64 %t53, i64 %t55)
  %t57 = call i64 @"sx_f64_sub"(i64 %t52, i64 %t56)
  %t58 = call i64 @"exp_f64"(i64 %t57)
  store i64 %t58, ptr %local.mag.43
  %t59 = load i64, ptr %local.sum.40
  %t60 = load i64, ptr %local.mag.43
  %t61 = load i64, ptr %local.t
  %t62 = load i64, ptr %local.nf.42
  %t63 = call i64 @"ln_f64"(i64 %t62)
  %t64 = call i64 @"sx_f64_mul"(i64 %t61, i64 %t63)
  %t65 = call i64 @"sin_f64"(i64 %t64)
  %t66 = call i64 @"sx_f64_mul"(i64 %t60, i64 %t65)
  %t67 = call i64 @"sx_f64_sub"(i64 %t59, i64 %t66)
  store i64 %t67, ptr %local.sum.40
  %t68 = load i64, ptr %local.n.41
  %t69 = add i64 %t68, 1
  store i64 %t69, ptr %local.n.41
  br label %loop2
endloop2:
  %t70 = load i64, ptr %local.sum.40
  ret i64 %t70
}

define i64 @"zeta_mag"(i64 %sigma, i64 %t, i64 %nterms) nounwind {
entry:
  %local.re.71 = alloca i64
  %local.im.72 = alloca i64
  %local.sigma = alloca i64
  store i64 %sigma, ptr %local.sigma
  %local.t = alloca i64
  store i64 %t, ptr %local.t
  %local.nterms = alloca i64
  store i64 %nterms, ptr %local.nterms
  %t73 = load i64, ptr %local.sigma
  %t74 = load i64, ptr %local.t
  %t75 = load i64, ptr %local.nterms
  %t76 = call i64 @"zeta_re"(i64 %t73, i64 %t74, i64 %t75)
  store i64 %t76, ptr %local.re.71
  %t77 = load i64, ptr %local.sigma
  %t78 = load i64, ptr %local.t
  %t79 = load i64, ptr %local.nterms
  %t80 = call i64 @"zeta_im"(i64 %t77, i64 %t78, i64 %t79)
  store i64 %t80, ptr %local.im.72
  %t81 = load i64, ptr %local.re.71
  %t82 = load i64, ptr %local.re.71
  %t83 = call i64 @"sx_f64_mul"(i64 %t81, i64 %t82)
  %t84 = load i64, ptr %local.im.72
  %t85 = load i64, ptr %local.im.72
  %t86 = call i64 @"sx_f64_mul"(i64 %t84, i64 %t85)
  %t87 = call i64 @"sx_f64_add"(i64 %t83, i64 %t86)
  %t88 = call i64 @"sqrt_f64"(i64 %t87)
  ret i64 %t88
}

define i64 @"zeta_iratio"(i64 %sigma, i64 %t, i64 %nterms) nounwind {
entry:
  %local.sum_re.89 = alloca i64
  %local.sum_im.90 = alloca i64
  %local.sum_norms.91 = alloca i64
  %local.n.92 = alloca i64
  %local.nf.93 = alloca i64
  %local.mag.94 = alloca i64
  %local.re.95 = alloca i64
  %local.im.96 = alloca i64
  %local.sum_sq.97 = alloca i64
  %local.sigma = alloca i64
  store i64 %sigma, ptr %local.sigma
  %local.t = alloca i64
  store i64 %t, ptr %local.t
  %local.nterms = alloca i64
  store i64 %nterms, ptr %local.nterms
  %t98 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.6)
  store i64 %t98, ptr %local.sum_re.89
  %t99 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.7)
  store i64 %t99, ptr %local.sum_im.90
  %t100 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.8)
  store i64 %t100, ptr %local.sum_norms.91
  store i64 1, ptr %local.n.92
  br label %loop3
loop3:
  %t101 = load i64, ptr %local.n.92
  %t102 = load i64, ptr %local.nterms
  %t103 = icmp sle i64 %t101, %t102
  %t104 = zext i1 %t103 to i64
  %t105 = icmp ne i64 %t104, 0
  br i1 %t105, label %body3, label %endloop3
body3:
  %t106 = load i64, ptr %local.n.92
  %t107 = call i64 @"sx_int_to_f64"(i64 %t106)
  store i64 %t107, ptr %local.nf.93
  %t108 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.9)
  %t109 = load i64, ptr %local.sigma
  %t110 = load i64, ptr %local.nf.93
  %t111 = call i64 @"ln_f64"(i64 %t110)
  %t112 = call i64 @"sx_f64_mul"(i64 %t109, i64 %t111)
  %t113 = call i64 @"sx_f64_sub"(i64 %t108, i64 %t112)
  %t114 = call i64 @"exp_f64"(i64 %t113)
  store i64 %t114, ptr %local.mag.94
  %t115 = load i64, ptr %local.mag.94
  %t116 = load i64, ptr %local.t
  %t117 = load i64, ptr %local.nf.93
  %t118 = call i64 @"ln_f64"(i64 %t117)
  %t119 = call i64 @"sx_f64_mul"(i64 %t116, i64 %t118)
  %t120 = call i64 @"cos_f64"(i64 %t119)
  %t121 = call i64 @"sx_f64_mul"(i64 %t115, i64 %t120)
  store i64 %t121, ptr %local.re.95
  %t122 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.10)
  %t123 = load i64, ptr %local.mag.94
  %t124 = load i64, ptr %local.t
  %t125 = load i64, ptr %local.nf.93
  %t126 = call i64 @"ln_f64"(i64 %t125)
  %t127 = call i64 @"sx_f64_mul"(i64 %t124, i64 %t126)
  %t128 = call i64 @"sin_f64"(i64 %t127)
  %t129 = call i64 @"sx_f64_mul"(i64 %t123, i64 %t128)
  %t130 = call i64 @"sx_f64_sub"(i64 %t122, i64 %t129)
  store i64 %t130, ptr %local.im.96
  %t131 = load i64, ptr %local.sum_re.89
  %t132 = load i64, ptr %local.re.95
  %t133 = call i64 @"sx_f64_add"(i64 %t131, i64 %t132)
  store i64 %t133, ptr %local.sum_re.89
  %t134 = load i64, ptr %local.sum_im.90
  %t135 = load i64, ptr %local.im.96
  %t136 = call i64 @"sx_f64_add"(i64 %t134, i64 %t135)
  store i64 %t136, ptr %local.sum_im.90
  %t137 = load i64, ptr %local.sum_norms.91
  %t138 = load i64, ptr %local.re.95
  %t139 = load i64, ptr %local.re.95
  %t140 = call i64 @"sx_f64_mul"(i64 %t138, i64 %t139)
  %t141 = call i64 @"sx_f64_add"(i64 %t137, i64 %t140)
  %t142 = load i64, ptr %local.im.96
  %t143 = load i64, ptr %local.im.96
  %t144 = call i64 @"sx_f64_mul"(i64 %t142, i64 %t143)
  %t145 = call i64 @"sx_f64_add"(i64 %t141, i64 %t144)
  store i64 %t145, ptr %local.sum_norms.91
  %t146 = load i64, ptr %local.n.92
  %t147 = add i64 %t146, 1
  store i64 %t147, ptr %local.n.92
  br label %loop3
endloop3:
  %t148 = load i64, ptr %local.sum_re.89
  %t149 = load i64, ptr %local.sum_re.89
  %t150 = call i64 @"sx_f64_mul"(i64 %t148, i64 %t149)
  %t151 = load i64, ptr %local.sum_im.90
  %t152 = load i64, ptr %local.sum_im.90
  %t153 = call i64 @"sx_f64_mul"(i64 %t151, i64 %t152)
  %t154 = call i64 @"sx_f64_add"(i64 %t150, i64 %t153)
  store i64 %t154, ptr %local.sum_sq.97
  %t155 = load i64, ptr %local.sum_norms.91
  %t156 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.11)
  %t157 = call i64 @"sx_f64_lt"(i64 %t155, i64 %t156)
  %t158 = icmp ne i64 %t157, 0
  br i1 %t158, label %then4, label %else4
then4:
  %t159 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.12)
  ret i64 %t159
else4:
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t160 = phi i64 [ 0, %else4_end ]
  %t161 = load i64, ptr %local.sum_sq.97
  %t162 = load i64, ptr %local.sum_norms.91
  %t163 = call i64 @"sx_f64_sub"(i64 %t161, i64 %t162)
  %t164 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.13)
  %t165 = load i64, ptr %local.sum_norms.91
  %t166 = call i64 @"sx_f64_mul"(i64 %t164, i64 %t165)
  %t167 = call i64 @"sx_f64_div"(i64 %t163, i64 %t166)
  ret i64 %t167
}

define i64 @"exp1_critical_line"() nounwind {
entry:
  %local.t.168 = alloca i64
  %local.mag.169 = alloca i64
  %local.ir.170 = alloca i64
  %t171 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.14)
  %t172 = ptrtoint ptr %t171 to i64
  %t173 = inttoptr i64 %t172 to ptr
  call void @intrinsic_println(ptr %t173)
  %t174 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.15)
  %t175 = ptrtoint ptr %t174 to i64
  %t176 = inttoptr i64 %t175 to ptr
  call void @intrinsic_println(ptr %t176)
  %t177 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.16)
  %t178 = ptrtoint ptr %t177 to i64
  %t179 = inttoptr i64 %t178 to ptr
  call void @intrinsic_println(ptr %t179)
  %t180 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.17)
  %t181 = ptrtoint ptr %t180 to i64
  %t182 = inttoptr i64 %t181 to ptr
  call void @intrinsic_println(ptr %t182)
  %t183 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.18)
  %t184 = ptrtoint ptr %t183 to i64
  %t185 = inttoptr i64 %t184 to ptr
  call void @intrinsic_println(ptr %t185)
  %t186 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.19)
  store i64 %t186, ptr %local.t.168
  br label %loop5
loop5:
  %t187 = load i64, ptr %local.t.168
  %t188 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.20)
  %t189 = call i64 @"sx_f64_le"(i64 %t187, i64 %t188)
  %t190 = icmp ne i64 %t189, 0
  br i1 %t190, label %body5, label %endloop5
body5:
  %t191 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.21)
  %t192 = load i64, ptr %local.t.168
  %t193 = call i64 @"zeta_mag"(i64 %t191, i64 %t192, i64 100)
  store i64 %t193, ptr %local.mag.169
  %t194 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.22)
  %t195 = load i64, ptr %local.t.168
  %t196 = call i64 @"zeta_iratio"(i64 %t194, i64 %t195, i64 100)
  store i64 %t196, ptr %local.ir.170
  %t197 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.23)
  %t198 = ptrtoint ptr %t197 to i64
  %t199 = inttoptr i64 %t198 to ptr
  call void @intrinsic_print(ptr %t199)
  %t200 = load i64, ptr %local.t.168
  %t201 = call i64 @"print_f64"(i64 %t200)
  %t202 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.24)
  %t203 = ptrtoint ptr %t202 to i64
  %t204 = inttoptr i64 %t203 to ptr
  call void @intrinsic_print(ptr %t204)
  %t205 = load i64, ptr %local.mag.169
  %t206 = call i64 @"print_f64"(i64 %t205)
  %t207 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.25)
  %t208 = ptrtoint ptr %t207 to i64
  %t209 = inttoptr i64 %t208 to ptr
  call void @intrinsic_print(ptr %t209)
  %t210 = load i64, ptr %local.ir.170
  %t211 = call i64 @"print_f64"(i64 %t210)
  %t212 = load i64, ptr %local.mag.169
  %t213 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.26)
  %t214 = call i64 @"sx_f64_lt"(i64 %t212, i64 %t213)
  %t215 = icmp ne i64 %t214, 0
  br i1 %t215, label %then6, label %else6
then6:
  %t216 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.27)
  %t217 = ptrtoint ptr %t216 to i64
  %t218 = inttoptr i64 %t217 to ptr
  call void @intrinsic_println(ptr %t218)
  br label %then6_end
then6_end:
  br label %endif6
else6:
  %t219 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.28)
  %t220 = ptrtoint ptr %t219 to i64
  %t221 = inttoptr i64 %t220 to ptr
  call void @intrinsic_println(ptr %t221)
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t222 = phi i64 [ 0, %then6_end ], [ 0, %else6_end ]
  %t223 = load i64, ptr %local.t.168
  %t224 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.29)
  %t225 = call i64 @"sx_f64_add"(i64 %t223, i64 %t224)
  store i64 %t225, ptr %local.t.168
  br label %loop5
endloop5:
  %t226 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.30)
  %t227 = ptrtoint ptr %t226 to i64
  %t228 = inttoptr i64 %t227 to ptr
  call void @intrinsic_println(ptr %t228)
  %t229 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.31)
  %t230 = ptrtoint ptr %t229 to i64
  %t231 = inttoptr i64 %t230 to ptr
  call void @intrinsic_println(ptr %t231)
  %t232 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.32)
  %t233 = ptrtoint ptr %t232 to i64
  %t234 = inttoptr i64 %t233 to ptr
  call void @intrinsic_println(ptr %t234)
  %t235 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.33)
  %t236 = call i64 @"exp1_spot"(i64 %t235)
  %t237 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.34)
  %t238 = call i64 @"exp1_spot"(i64 %t237)
  %t239 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.35)
  %t240 = call i64 @"exp1_spot"(i64 %t239)
  %t241 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.36)
  %t242 = call i64 @"exp1_spot"(i64 %t241)
  %t243 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.37)
  %t244 = call i64 @"exp1_spot"(i64 %t243)
  %t245 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.38)
  %t246 = ptrtoint ptr %t245 to i64
  %t247 = inttoptr i64 %t246 to ptr
  call void @intrinsic_println(ptr %t247)
  %t248 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.39)
  %t249 = ptrtoint ptr %t248 to i64
  %t250 = inttoptr i64 %t249 to ptr
  call void @intrinsic_println(ptr %t250)
  %t251 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.40)
  %t252 = ptrtoint ptr %t251 to i64
  %t253 = inttoptr i64 %t252 to ptr
  call void @intrinsic_println(ptr %t253)
  %t254 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.41)
  %t255 = ptrtoint ptr %t254 to i64
  %t256 = inttoptr i64 %t255 to ptr
  call void @intrinsic_println(ptr %t256)
  %t257 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.42)
  %t258 = ptrtoint ptr %t257 to i64
  %t259 = inttoptr i64 %t258 to ptr
  call void @intrinsic_println(ptr %t259)
  ret i64 0
}

define i64 @"exp1_spot"(i64 %t) nounwind {
entry:
  %local.mag.260 = alloca i64
  %local.ir.261 = alloca i64
  %local.dev.262 = alloca i64
  %local.t = alloca i64
  store i64 %t, ptr %local.t
  %t263 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.43)
  %t264 = load i64, ptr %local.t
  %t265 = call i64 @"zeta_mag"(i64 %t263, i64 %t264, i64 100)
  store i64 %t265, ptr %local.mag.260
  %t266 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.44)
  %t267 = load i64, ptr %local.t
  %t268 = call i64 @"zeta_iratio"(i64 %t266, i64 %t267, i64 100)
  store i64 %t268, ptr %local.ir.261
  %t269 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.45)
  %t270 = ptrtoint ptr %t269 to i64
  %t271 = inttoptr i64 %t270 to ptr
  call void @intrinsic_print(ptr %t271)
  %t272 = load i64, ptr %local.t
  %t273 = call i64 @"print_f64"(i64 %t272)
  %t274 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.46)
  %t275 = ptrtoint ptr %t274 to i64
  %t276 = inttoptr i64 %t275 to ptr
  call void @intrinsic_print(ptr %t276)
  %t277 = load i64, ptr %local.mag.260
  %t278 = call i64 @"print_f64"(i64 %t277)
  %t279 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.47)
  %t280 = ptrtoint ptr %t279 to i64
  %t281 = inttoptr i64 %t280 to ptr
  call void @intrinsic_print(ptr %t281)
  %t282 = load i64, ptr %local.ir.261
  %t283 = call i64 @"print_f64"(i64 %t282)
  %t284 = load i64, ptr %local.ir.261
  %t285 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.48)
  %t286 = call i64 @"sx_f64_add"(i64 %t284, i64 %t285)
  %t287 = call i64 @"abs_f64"(i64 %t286)
  store i64 %t287, ptr %local.dev.262
  %t288 = load i64, ptr %local.dev.262
  %t289 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.49)
  %t290 = call i64 @"sx_f64_lt"(i64 %t288, i64 %t289)
  %t291 = icmp ne i64 %t290, 0
  br i1 %t291, label %then7, label %else7
then7:
  %t292 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.50)
  %t293 = ptrtoint ptr %t292 to i64
  %t294 = inttoptr i64 %t293 to ptr
  call void @intrinsic_println(ptr %t294)
  br label %then7_end
then7_end:
  br label %endif7
else7:
  %t295 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.51)
  %t296 = ptrtoint ptr %t295 to i64
  %t297 = inttoptr i64 %t296 to ptr
  call void @intrinsic_println(ptr %t297)
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t298 = phi i64 [ 0, %then7_end ], [ 0, %else7_end ]
  ret i64 0
}

define i64 @"exp2_off_critical"() nounwind {
entry:
  %local.sigma.299 = alloca i64
  %local.mag.300 = alloca i64
  %local.ir.301 = alloca i64
  %local.dev.302 = alloca i64
  %local.mag100.303 = alloca i64
  %local.ir100.304 = alloca i64
  %t305 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.52)
  %t306 = ptrtoint ptr %t305 to i64
  %t307 = inttoptr i64 %t306 to ptr
  call void @intrinsic_println(ptr %t307)
  %t308 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.53)
  %t309 = ptrtoint ptr %t308 to i64
  %t310 = inttoptr i64 %t309 to ptr
  call void @intrinsic_println(ptr %t310)
  %t311 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.54)
  %t312 = ptrtoint ptr %t311 to i64
  %t313 = inttoptr i64 %t312 to ptr
  call void @intrinsic_println(ptr %t313)
  %t314 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.55)
  %t315 = ptrtoint ptr %t314 to i64
  %t316 = inttoptr i64 %t315 to ptr
  call void @intrinsic_println(ptr %t316)
  %t317 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.56)
  %t318 = ptrtoint ptr %t317 to i64
  %t319 = inttoptr i64 %t318 to ptr
  call void @intrinsic_println(ptr %t319)
  %t320 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.57)
  %t321 = ptrtoint ptr %t320 to i64
  %t322 = inttoptr i64 %t321 to ptr
  call void @intrinsic_println(ptr %t322)
  %t323 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.58)
  store i64 %t323, ptr %local.sigma.299
  br label %loop8
loop8:
  %t324 = load i64, ptr %local.sigma.299
  %t325 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.59)
  %t326 = call i64 @"sx_f64_le"(i64 %t324, i64 %t325)
  %t327 = icmp ne i64 %t326, 0
  br i1 %t327, label %body8, label %endloop8
body8:
  %t328 = load i64, ptr %local.sigma.299
  %t329 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.60)
  %t330 = call i64 @"zeta_mag"(i64 %t328, i64 %t329, i64 30)
  store i64 %t330, ptr %local.mag.300
  %t331 = load i64, ptr %local.sigma.299
  %t332 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.61)
  %t333 = call i64 @"zeta_iratio"(i64 %t331, i64 %t332, i64 30)
  store i64 %t333, ptr %local.ir.301
  %t334 = load i64, ptr %local.ir.301
  %t335 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.62)
  %t336 = call i64 @"sx_f64_add"(i64 %t334, i64 %t335)
  %t337 = call i64 @"abs_f64"(i64 %t336)
  store i64 %t337, ptr %local.dev.302
  %t338 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.63)
  %t339 = ptrtoint ptr %t338 to i64
  %t340 = inttoptr i64 %t339 to ptr
  call void @intrinsic_print(ptr %t340)
  %t341 = load i64, ptr %local.sigma.299
  %t342 = call i64 @"print_f64"(i64 %t341)
  %t343 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.64)
  %t344 = ptrtoint ptr %t343 to i64
  %t345 = inttoptr i64 %t344 to ptr
  call void @intrinsic_print(ptr %t345)
  %t346 = load i64, ptr %local.mag.300
  %t347 = call i64 @"print_f64"(i64 %t346)
  %t348 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.65)
  %t349 = ptrtoint ptr %t348 to i64
  %t350 = inttoptr i64 %t349 to ptr
  call void @intrinsic_print(ptr %t350)
  %t351 = load i64, ptr %local.ir.301
  %t352 = call i64 @"print_f64"(i64 %t351)
  %t353 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.66)
  %t354 = ptrtoint ptr %t353 to i64
  %t355 = inttoptr i64 %t354 to ptr
  call void @intrinsic_print(ptr %t355)
  %t356 = load i64, ptr %local.dev.302
  %t357 = call i64 @"print_f64"(i64 %t356)
  %t358 = load i64, ptr %local.dev.302
  %t359 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.67)
  %t360 = call i64 @"sx_f64_lt"(i64 %t358, i64 %t359)
  %t361 = icmp ne i64 %t360, 0
  br i1 %t361, label %then9, label %else9
then9:
  %t362 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.68)
  %t363 = ptrtoint ptr %t362 to i64
  %t364 = inttoptr i64 %t363 to ptr
  call void @intrinsic_println(ptr %t364)
  br label %then9_end
then9_end:
  br label %endif9
else9:
  %t365 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.69)
  %t366 = ptrtoint ptr %t365 to i64
  %t367 = inttoptr i64 %t366 to ptr
  call void @intrinsic_println(ptr %t367)
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t368 = phi i64 [ 0, %then9_end ], [ 0, %else9_end ]
  %t369 = load i64, ptr %local.sigma.299
  %t370 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.70)
  %t371 = call i64 @"sx_f64_add"(i64 %t369, i64 %t370)
  store i64 %t371, ptr %local.sigma.299
  br label %loop8
endloop8:
  %t372 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.71)
  %t373 = ptrtoint ptr %t372 to i64
  %t374 = inttoptr i64 %t373 to ptr
  call void @intrinsic_println(ptr %t374)
  %t375 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.72)
  %t376 = ptrtoint ptr %t375 to i64
  %t377 = inttoptr i64 %t376 to ptr
  call void @intrinsic_println(ptr %t377)
  %t378 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.73)
  %t379 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.74)
  %t380 = call i64 @"zeta_mag"(i64 %t378, i64 %t379, i64 100)
  store i64 %t380, ptr %local.mag100.303
  %t381 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.75)
  %t382 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.76)
  %t383 = call i64 @"zeta_iratio"(i64 %t381, i64 %t382, i64 100)
  store i64 %t383, ptr %local.ir100.304
  %t384 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.77)
  %t385 = ptrtoint ptr %t384 to i64
  %t386 = inttoptr i64 %t385 to ptr
  call void @intrinsic_print(ptr %t386)
  %t387 = load i64, ptr %local.mag100.303
  %t388 = call i64 @"print_f64"(i64 %t387)
  %t389 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.78)
  %t390 = ptrtoint ptr %t389 to i64
  %t391 = inttoptr i64 %t390 to ptr
  call void @intrinsic_print(ptr %t391)
  %t392 = load i64, ptr %local.ir100.304
  %t393 = call i64 @"print_f64"(i64 %t392)
  %t394 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.79)
  %t395 = ptrtoint ptr %t394 to i64
  %t396 = inttoptr i64 %t395 to ptr
  call void @intrinsic_println(ptr %t396)
  %t397 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.80)
  %t398 = ptrtoint ptr %t397 to i64
  %t399 = inttoptr i64 %t398 to ptr
  call void @intrinsic_println(ptr %t399)
  %t400 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.81)
  %t401 = ptrtoint ptr %t400 to i64
  %t402 = inttoptr i64 %t401 to ptr
  call void @intrinsic_println(ptr %t402)
  %t403 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.82)
  %t404 = ptrtoint ptr %t403 to i64
  %t405 = inttoptr i64 %t404 to ptr
  call void @intrinsic_println(ptr %t405)
  %t406 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.83)
  %t407 = ptrtoint ptr %t406 to i64
  %t408 = inttoptr i64 %t407 to ptr
  call void @intrinsic_println(ptr %t408)
  ret i64 0
}

define i64 @"exp3_fine_sweep"() nounwind {
entry:
  %local.t.409 = alloca i64
  %local.min_dev.410 = alloca i64
  %local.min_t.411 = alloca i64
  %local.min_mag_dev.412 = alloca i64
  %local.min_mag_t.413 = alloca i64
  %local.mag.414 = alloca i64
  %local.ir.415 = alloca i64
  %local.dev.416 = alloca i64
  %t417 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.84)
  %t418 = ptrtoint ptr %t417 to i64
  %t419 = inttoptr i64 %t418 to ptr
  call void @intrinsic_println(ptr %t419)
  %t420 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.85)
  %t421 = ptrtoint ptr %t420 to i64
  %t422 = inttoptr i64 %t421 to ptr
  call void @intrinsic_println(ptr %t422)
  %t423 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.86)
  %t424 = ptrtoint ptr %t423 to i64
  %t425 = inttoptr i64 %t424 to ptr
  call void @intrinsic_println(ptr %t425)
  %t426 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.87)
  %t427 = ptrtoint ptr %t426 to i64
  %t428 = inttoptr i64 %t427 to ptr
  call void @intrinsic_println(ptr %t428)
  %t429 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.88)
  %t430 = ptrtoint ptr %t429 to i64
  %t431 = inttoptr i64 %t430 to ptr
  call void @intrinsic_println(ptr %t431)
  %t432 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.89)
  store i64 %t432, ptr %local.t.409
  %t433 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.90)
  store i64 %t433, ptr %local.min_dev.410
  %t434 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.91)
  store i64 %t434, ptr %local.min_t.411
  %t435 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.92)
  store i64 %t435, ptr %local.min_mag_dev.412
  %t436 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.93)
  store i64 %t436, ptr %local.min_mag_t.413
  br label %loop10
loop10:
  %t437 = load i64, ptr %local.t.409
  %t438 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.94)
  %t439 = call i64 @"sx_f64_le"(i64 %t437, i64 %t438)
  %t440 = icmp ne i64 %t439, 0
  br i1 %t440, label %body10, label %endloop10
body10:
  %t441 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.95)
  %t442 = load i64, ptr %local.t.409
  %t443 = call i64 @"zeta_mag"(i64 %t441, i64 %t442, i64 30)
  store i64 %t443, ptr %local.mag.414
  %t444 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.96)
  %t445 = load i64, ptr %local.t.409
  %t446 = call i64 @"zeta_iratio"(i64 %t444, i64 %t445, i64 30)
  store i64 %t446, ptr %local.ir.415
  %t447 = load i64, ptr %local.ir.415
  %t448 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.97)
  %t449 = call i64 @"sx_f64_add"(i64 %t447, i64 %t448)
  %t450 = call i64 @"abs_f64"(i64 %t449)
  store i64 %t450, ptr %local.dev.416
  %t451 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.98)
  %t452 = ptrtoint ptr %t451 to i64
  %t453 = inttoptr i64 %t452 to ptr
  call void @intrinsic_print(ptr %t453)
  %t454 = load i64, ptr %local.t.409
  %t455 = call i64 @"print_f64"(i64 %t454)
  %t456 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.99)
  %t457 = ptrtoint ptr %t456 to i64
  %t458 = inttoptr i64 %t457 to ptr
  call void @intrinsic_print(ptr %t458)
  %t459 = load i64, ptr %local.mag.414
  %t460 = call i64 @"print_f64"(i64 %t459)
  %t461 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.100)
  %t462 = ptrtoint ptr %t461 to i64
  %t463 = inttoptr i64 %t462 to ptr
  call void @intrinsic_print(ptr %t463)
  %t464 = load i64, ptr %local.ir.415
  %t465 = call i64 @"print_f64"(i64 %t464)
  %t466 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.101)
  %t467 = ptrtoint ptr %t466 to i64
  %t468 = inttoptr i64 %t467 to ptr
  call void @intrinsic_print(ptr %t468)
  %t469 = load i64, ptr %local.dev.416
  %t470 = call i64 @"print_f64"(i64 %t469)
  %t471 = load i64, ptr %local.dev.416
  %t472 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.102)
  %t473 = call i64 @"sx_f64_lt"(i64 %t471, i64 %t472)
  %t474 = icmp ne i64 %t473, 0
  br i1 %t474, label %then11, label %else11
then11:
  %t475 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.103)
  %t476 = ptrtoint ptr %t475 to i64
  %t477 = inttoptr i64 %t476 to ptr
  call void @intrinsic_println(ptr %t477)
  br label %then11_end
then11_end:
  br label %endif11
else11:
  %t478 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.104)
  %t479 = ptrtoint ptr %t478 to i64
  %t480 = inttoptr i64 %t479 to ptr
  call void @intrinsic_println(ptr %t480)
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t481 = phi i64 [ 0, %then11_end ], [ 0, %else11_end ]
  %t482 = load i64, ptr %local.dev.416
  %t483 = load i64, ptr %local.min_dev.410
  %t484 = call i64 @"sx_f64_lt"(i64 %t482, i64 %t483)
  %t485 = icmp ne i64 %t484, 0
  br i1 %t485, label %then12, label %else12
then12:
  %t486 = load i64, ptr %local.dev.416
  store i64 %t486, ptr %local.min_dev.410
  %t487 = load i64, ptr %local.t.409
  store i64 %t487, ptr %local.min_t.411
  br label %then12_end
then12_end:
  br label %endif12
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t488 = phi i64 [ 0, %then12_end ], [ 0, %else12_end ]
  %t489 = load i64, ptr %local.mag.414
  %t490 = load i64, ptr %local.min_mag_dev.412
  %t491 = call i64 @"sx_f64_lt"(i64 %t489, i64 %t490)
  %t492 = icmp ne i64 %t491, 0
  br i1 %t492, label %then13, label %else13
then13:
  %t493 = load i64, ptr %local.mag.414
  store i64 %t493, ptr %local.min_mag_dev.412
  %t494 = load i64, ptr %local.t.409
  store i64 %t494, ptr %local.min_mag_t.413
  br label %then13_end
then13_end:
  br label %endif13
else13:
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t495 = phi i64 [ 0, %then13_end ], [ 0, %else13_end ]
  %t496 = load i64, ptr %local.t.409
  %t497 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.105)
  %t498 = call i64 @"sx_f64_add"(i64 %t496, i64 %t497)
  store i64 %t498, ptr %local.t.409
  br label %loop10
endloop10:
  %t499 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.106)
  %t500 = ptrtoint ptr %t499 to i64
  %t501 = inttoptr i64 %t500 to ptr
  call void @intrinsic_println(ptr %t501)
  %t502 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.107)
  %t503 = ptrtoint ptr %t502 to i64
  %t504 = inttoptr i64 %t503 to ptr
  call void @intrinsic_print(ptr %t504)
  %t505 = load i64, ptr %local.min_t.411
  %t506 = call i64 @"print_f64"(i64 %t505)
  %t507 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.108)
  %t508 = ptrtoint ptr %t507 to i64
  %t509 = inttoptr i64 %t508 to ptr
  call void @intrinsic_print(ptr %t509)
  %t510 = load i64, ptr %local.min_dev.410
  %t511 = call i64 @"print_f64"(i64 %t510)
  %t512 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.109)
  %t513 = ptrtoint ptr %t512 to i64
  %t514 = inttoptr i64 %t513 to ptr
  call void @intrinsic_println(ptr %t514)
  %t515 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.110)
  %t516 = ptrtoint ptr %t515 to i64
  %t517 = inttoptr i64 %t516 to ptr
  call void @intrinsic_print(ptr %t517)
  %t518 = load i64, ptr %local.min_mag_t.413
  %t519 = call i64 @"print_f64"(i64 %t518)
  %t520 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.111)
  %t521 = ptrtoint ptr %t520 to i64
  %t522 = inttoptr i64 %t521 to ptr
  call void @intrinsic_print(ptr %t522)
  %t523 = load i64, ptr %local.min_mag_dev.412
  %t524 = call i64 @"print_f64"(i64 %t523)
  %t525 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.112)
  %t526 = ptrtoint ptr %t525 to i64
  %t527 = inttoptr i64 %t526 to ptr
  call void @intrinsic_println(ptr %t527)
  %t528 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.113)
  %t529 = ptrtoint ptr %t528 to i64
  %t530 = inttoptr i64 %t529 to ptr
  call void @intrinsic_println(ptr %t530)
  %t531 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.114)
  %t532 = ptrtoint ptr %t531 to i64
  %t533 = inttoptr i64 %t532 to ptr
  call void @intrinsic_println(ptr %t533)
  %t534 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.115)
  %t535 = ptrtoint ptr %t534 to i64
  %t536 = inttoptr i64 %t535 to ptr
  call void @intrinsic_println(ptr %t536)
  %t537 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.116)
  %t538 = call i64 @"exp3_compare"(i64 %t537)
  %t539 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.117)
  %t540 = call i64 @"exp3_compare"(i64 %t539)
  %t541 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.118)
  %t542 = call i64 @"exp3_compare"(i64 %t541)
  %t543 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.119)
  %t544 = ptrtoint ptr %t543 to i64
  %t545 = inttoptr i64 %t544 to ptr
  call void @intrinsic_println(ptr %t545)
  %t546 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.120)
  %t547 = ptrtoint ptr %t546 to i64
  %t548 = inttoptr i64 %t547 to ptr
  call void @intrinsic_println(ptr %t548)
  %t549 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.121)
  %t550 = ptrtoint ptr %t549 to i64
  %t551 = inttoptr i64 %t550 to ptr
  call void @intrinsic_println(ptr %t551)
  %t552 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.122)
  %t553 = ptrtoint ptr %t552 to i64
  %t554 = inttoptr i64 %t553 to ptr
  call void @intrinsic_println(ptr %t554)
  %t555 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.123)
  %t556 = ptrtoint ptr %t555 to i64
  %t557 = inttoptr i64 %t556 to ptr
  call void @intrinsic_println(ptr %t557)
  ret i64 0
}

define i64 @"exp3_compare"(i64 %t) nounwind {
entry:
  %local.mag.558 = alloca i64
  %local.ir.559 = alloca i64
  %local.dev.560 = alloca i64
  %local.t = alloca i64
  store i64 %t, ptr %local.t
  %t561 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.124)
  %t562 = load i64, ptr %local.t
  %t563 = call i64 @"zeta_mag"(i64 %t561, i64 %t562, i64 30)
  store i64 %t563, ptr %local.mag.558
  %t564 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.125)
  %t565 = load i64, ptr %local.t
  %t566 = call i64 @"zeta_iratio"(i64 %t564, i64 %t565, i64 30)
  store i64 %t566, ptr %local.ir.559
  %t567 = load i64, ptr %local.ir.559
  %t568 = call i64 @f64_parse(ptr @.str.exp_riemann_zeta.126)
  %t569 = call i64 @"sx_f64_add"(i64 %t567, i64 %t568)
  %t570 = call i64 @"abs_f64"(i64 %t569)
  store i64 %t570, ptr %local.dev.560
  %t571 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.127)
  %t572 = ptrtoint ptr %t571 to i64
  %t573 = inttoptr i64 %t572 to ptr
  call void @intrinsic_print(ptr %t573)
  %t574 = load i64, ptr %local.t
  %t575 = call i64 @"print_f64"(i64 %t574)
  %t576 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.128)
  %t577 = ptrtoint ptr %t576 to i64
  %t578 = inttoptr i64 %t577 to ptr
  call void @intrinsic_print(ptr %t578)
  %t579 = load i64, ptr %local.mag.558
  %t580 = call i64 @"print_f64"(i64 %t579)
  %t581 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.129)
  %t582 = ptrtoint ptr %t581 to i64
  %t583 = inttoptr i64 %t582 to ptr
  call void @intrinsic_print(ptr %t583)
  %t584 = load i64, ptr %local.ir.559
  %t585 = call i64 @"print_f64"(i64 %t584)
  %t586 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.130)
  %t587 = ptrtoint ptr %t586 to i64
  %t588 = inttoptr i64 %t587 to ptr
  call void @intrinsic_print(ptr %t588)
  %t589 = load i64, ptr %local.dev.560
  %t590 = call i64 @"print_f64"(i64 %t589)
  %t591 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.131)
  %t592 = ptrtoint ptr %t591 to i64
  %t593 = inttoptr i64 %t592 to ptr
  call void @intrinsic_println(ptr %t593)
  ret i64 0
}

define i64 @"simplex_main"() nounwind {
entry:
  %t594 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.132)
  %t595 = ptrtoint ptr %t594 to i64
  %t596 = inttoptr i64 %t595 to ptr
  call void @intrinsic_println(ptr %t596)
  %t597 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.133)
  %t598 = ptrtoint ptr %t597 to i64
  %t599 = inttoptr i64 %t598 to ptr
  call void @intrinsic_println(ptr %t599)
  %t600 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.134)
  %t601 = ptrtoint ptr %t600 to i64
  %t602 = inttoptr i64 %t601 to ptr
  call void @intrinsic_println(ptr %t602)
  %t603 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.135)
  %t604 = ptrtoint ptr %t603 to i64
  %t605 = inttoptr i64 %t604 to ptr
  call void @intrinsic_println(ptr %t605)
  %t606 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.136)
  %t607 = ptrtoint ptr %t606 to i64
  %t608 = inttoptr i64 %t607 to ptr
  call void @intrinsic_println(ptr %t608)
  %t609 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.137)
  %t610 = ptrtoint ptr %t609 to i64
  %t611 = inttoptr i64 %t610 to ptr
  call void @intrinsic_println(ptr %t611)
  %t612 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.138)
  %t613 = ptrtoint ptr %t612 to i64
  %t614 = inttoptr i64 %t613 to ptr
  call void @intrinsic_println(ptr %t614)
  %t615 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.139)
  %t616 = ptrtoint ptr %t615 to i64
  %t617 = inttoptr i64 %t616 to ptr
  call void @intrinsic_println(ptr %t617)
  %t618 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.140)
  %t619 = ptrtoint ptr %t618 to i64
  %t620 = inttoptr i64 %t619 to ptr
  call void @intrinsic_println(ptr %t620)
  %t621 = call i64 @"exp1_critical_line"()
  %t622 = call i64 @"exp2_off_critical"()
  %t623 = call i64 @"exp3_fine_sweep"()
  %t624 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.141)
  %t625 = ptrtoint ptr %t624 to i64
  %t626 = inttoptr i64 %t625 to ptr
  call void @intrinsic_println(ptr %t626)
  %t627 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.142)
  %t628 = ptrtoint ptr %t627 to i64
  %t629 = inttoptr i64 %t628 to ptr
  call void @intrinsic_println(ptr %t629)
  %t630 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.143)
  %t631 = ptrtoint ptr %t630 to i64
  %t632 = inttoptr i64 %t631 to ptr
  call void @intrinsic_println(ptr %t632)
  %t633 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.144)
  %t634 = ptrtoint ptr %t633 to i64
  %t635 = inttoptr i64 %t634 to ptr
  call void @intrinsic_println(ptr %t635)
  %t636 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.145)
  %t637 = ptrtoint ptr %t636 to i64
  %t638 = inttoptr i64 %t637 to ptr
  call void @intrinsic_println(ptr %t638)
  %t639 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.146)
  %t640 = ptrtoint ptr %t639 to i64
  %t641 = inttoptr i64 %t640 to ptr
  call void @intrinsic_println(ptr %t641)
  %t642 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.147)
  %t643 = ptrtoint ptr %t642 to i64
  %t644 = inttoptr i64 %t643 to ptr
  call void @intrinsic_println(ptr %t644)
  %t645 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.148)
  %t646 = ptrtoint ptr %t645 to i64
  %t647 = inttoptr i64 %t646 to ptr
  call void @intrinsic_println(ptr %t647)
  %t648 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.149)
  %t649 = ptrtoint ptr %t648 to i64
  %t650 = inttoptr i64 %t649 to ptr
  call void @intrinsic_println(ptr %t650)
  %t651 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.150)
  %t652 = ptrtoint ptr %t651 to i64
  %t653 = inttoptr i64 %t652 to ptr
  call void @intrinsic_println(ptr %t653)
  %t654 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.151)
  %t655 = ptrtoint ptr %t654 to i64
  %t656 = inttoptr i64 %t655 to ptr
  call void @intrinsic_println(ptr %t656)
  %t657 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.152)
  %t658 = ptrtoint ptr %t657 to i64
  %t659 = inttoptr i64 %t658 to ptr
  call void @intrinsic_println(ptr %t659)
  %t660 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.153)
  %t661 = ptrtoint ptr %t660 to i64
  %t662 = inttoptr i64 %t661 to ptr
  call void @intrinsic_println(ptr %t662)
  %t663 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.154)
  %t664 = ptrtoint ptr %t663 to i64
  %t665 = inttoptr i64 %t664 to ptr
  call void @intrinsic_println(ptr %t665)
  %t666 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.155)
  %t667 = ptrtoint ptr %t666 to i64
  %t668 = inttoptr i64 %t667 to ptr
  call void @intrinsic_println(ptr %t668)
  %t669 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.156)
  %t670 = ptrtoint ptr %t669 to i64
  %t671 = inttoptr i64 %t670 to ptr
  call void @intrinsic_println(ptr %t671)
  %t672 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.157)
  %t673 = ptrtoint ptr %t672 to i64
  %t674 = inttoptr i64 %t673 to ptr
  call void @intrinsic_println(ptr %t674)
  %t675 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.158)
  %t676 = ptrtoint ptr %t675 to i64
  %t677 = inttoptr i64 %t676 to ptr
  call void @intrinsic_println(ptr %t677)
  %t678 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.159)
  %t679 = ptrtoint ptr %t678 to i64
  %t680 = inttoptr i64 %t679 to ptr
  call void @intrinsic_println(ptr %t680)
  %t681 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.160)
  %t682 = ptrtoint ptr %t681 to i64
  %t683 = inttoptr i64 %t682 to ptr
  call void @intrinsic_println(ptr %t683)
  %t684 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.161)
  %t685 = ptrtoint ptr %t684 to i64
  %t686 = inttoptr i64 %t685 to ptr
  call void @intrinsic_println(ptr %t686)
  %t687 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.162)
  %t688 = ptrtoint ptr %t687 to i64
  %t689 = inttoptr i64 %t688 to ptr
  call void @intrinsic_println(ptr %t689)
  %t690 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.163)
  %t691 = ptrtoint ptr %t690 to i64
  %t692 = inttoptr i64 %t691 to ptr
  call void @intrinsic_println(ptr %t692)
  %t693 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.164)
  %t694 = ptrtoint ptr %t693 to i64
  %t695 = inttoptr i64 %t694 to ptr
  call void @intrinsic_println(ptr %t695)
  %t696 = call ptr @intrinsic_string_new(ptr @.str.exp_riemann_zeta.165)
  %t697 = ptrtoint ptr %t696 to i64
  %t698 = inttoptr i64 %t697 to ptr
  call void @intrinsic_println(ptr %t698)
  ret i64 0
}


; String constants
@.str.exp_riemann_zeta.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_riemann_zeta.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_riemann_zeta.2 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_riemann_zeta.3 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_riemann_zeta.4 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_riemann_zeta.5 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_riemann_zeta.6 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_riemann_zeta.7 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_riemann_zeta.8 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_riemann_zeta.9 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_riemann_zeta.10 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_riemann_zeta.11 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_riemann_zeta.12 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_riemann_zeta.13 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_riemann_zeta.14 = private unnamed_addr constant [59 x i8] c"=== Exp 1: I-Ratio Along the Critical Line (sigma=0.5) ===\00"
@.str.exp_riemann_zeta.15 = private unnamed_addr constant [38 x i8] c"  Sweep t from 10 to 50, N=100 terms.\00"
@.str.exp_riemann_zeta.16 = private unnamed_addr constant [57 x i8] c"  Known zeros near t = 14.13, 21.02, 25.01, 30.42, 32.94\00"
@.str.exp_riemann_zeta.17 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_riemann_zeta.18 = private unnamed_addr constant [45 x i8] c"  t       |Z_100|     I_ratio     near_zero?\00"
@.str.exp_riemann_zeta.19 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_riemann_zeta.20 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_riemann_zeta.21 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_riemann_zeta.22 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_riemann_zeta.23 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_riemann_zeta.24 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_riemann_zeta.25 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_riemann_zeta.26 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_riemann_zeta.27 = private unnamed_addr constant [18 x i8] c"    <-- small |Z|\00"
@.str.exp_riemann_zeta.28 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_riemann_zeta.29 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_riemann_zeta.30 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_riemann_zeta.31 = private unnamed_addr constant [47 x i8] c"  Spot checks at known zero locations (N=100):\00"
@.str.exp_riemann_zeta.32 = private unnamed_addr constant [32 x i8] c"  t         |Z_100|     I_ratio\00"
@.str.exp_riemann_zeta.33 = private unnamed_addr constant [6 x i8] c"14.13\00"
@.str.exp_riemann_zeta.34 = private unnamed_addr constant [6 x i8] c"21.02\00"
@.str.exp_riemann_zeta.35 = private unnamed_addr constant [6 x i8] c"25.01\00"
@.str.exp_riemann_zeta.36 = private unnamed_addr constant [6 x i8] c"30.42\00"
@.str.exp_riemann_zeta.37 = private unnamed_addr constant [6 x i8] c"32.94\00"
@.str.exp_riemann_zeta.38 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_riemann_zeta.39 = private unnamed_addr constant [55 x i8] c"  CAVEAT: Partial sums are NOT the true zeta function.\00"
@.str.exp_riemann_zeta.40 = private unnamed_addr constant [63 x i8] c"  N=100 is a crude approximation. |Z| may not reach 0 exactly.\00"
@.str.exp_riemann_zeta.41 = private unnamed_addr constant [52 x i8] c"  The I-ratio signal is what we are characterising.\00"
@.str.exp_riemann_zeta.42 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_riemann_zeta.43 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_riemann_zeta.44 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_riemann_zeta.45 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_riemann_zeta.46 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_riemann_zeta.47 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_riemann_zeta.48 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_riemann_zeta.49 = private unnamed_addr constant [5 x i8] c"0.02\00"
@.str.exp_riemann_zeta.50 = private unnamed_addr constant [20 x i8] c"   *** I ~ -0.5 ***\00"
@.str.exp_riemann_zeta.51 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_riemann_zeta.52 = private unnamed_addr constant [55 x i8] c"=== Exp 2: I-Ratio Off the Critical Line (t=14.13) ===\00"
@.str.exp_riemann_zeta.53 = private unnamed_addr constant [57 x i8] c"  Fix t=14.13 (near first zero). Sweep sigma 0.3 to 0.7.\00"
@.str.exp_riemann_zeta.54 = private unnamed_addr constant [51 x i8] c"  At sigma=0.5 should be near zero; elsewhere not.\00"
@.str.exp_riemann_zeta.55 = private unnamed_addr constant [27 x i8] c"  N=30 terms (fast sweep).\00"
@.str.exp_riemann_zeta.56 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_riemann_zeta.57 = private unnamed_addr constant [50 x i8] c"  sigma   |Z_30|      I_ratio     delta_from_-0.5\00"
@.str.exp_riemann_zeta.58 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_riemann_zeta.59 = private unnamed_addr constant [5 x i8] c"0.71\00"
@.str.exp_riemann_zeta.60 = private unnamed_addr constant [6 x i8] c"14.13\00"
@.str.exp_riemann_zeta.61 = private unnamed_addr constant [6 x i8] c"14.13\00"
@.str.exp_riemann_zeta.62 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_riemann_zeta.63 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_riemann_zeta.64 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_riemann_zeta.65 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_riemann_zeta.66 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_riemann_zeta.67 = private unnamed_addr constant [5 x i8] c"0.02\00"
@.str.exp_riemann_zeta.68 = private unnamed_addr constant [23 x i8] c"  <-- near equilibrium\00"
@.str.exp_riemann_zeta.69 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_riemann_zeta.70 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_riemann_zeta.71 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_riemann_zeta.72 = private unnamed_addr constant [42 x i8] c"  N=100 spot check at sigma=0.5, t=14.13:\00"
@.str.exp_riemann_zeta.73 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_riemann_zeta.74 = private unnamed_addr constant [6 x i8] c"14.13\00"
@.str.exp_riemann_zeta.75 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_riemann_zeta.76 = private unnamed_addr constant [6 x i8] c"14.13\00"
@.str.exp_riemann_zeta.77 = private unnamed_addr constant [15 x i8] c"    |Z_100| = \00"
@.str.exp_riemann_zeta.78 = private unnamed_addr constant [14 x i8] c"   I_ratio = \00"
@.str.exp_riemann_zeta.79 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_riemann_zeta.80 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_riemann_zeta.81 = private unnamed_addr constant [47 x i8] c"  If I-ratio dips to -0.5 only near sigma=0.5,\00"
@.str.exp_riemann_zeta.82 = private unnamed_addr constant [48 x i8] c"  then I-ratio distinguishes the critical line.\00"
@.str.exp_riemann_zeta.83 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_riemann_zeta.84 = private unnamed_addr constant [58 x i8] c"=== Exp 3: Zero Detection — Fine Sweep t=13.0..16.0 ===\00"
@.str.exp_riemann_zeta.85 = private unnamed_addr constant [35 x i8] c"  sigma=0.5, step=0.1, N=30 terms.\00"
@.str.exp_riemann_zeta.86 = private unnamed_addr constant [41 x i8] c"  Does I -> -0.5 precisely at t ~ 14.13?\00"
@.str.exp_riemann_zeta.87 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_riemann_zeta.88 = private unnamed_addr constant [42 x i8] c"  t       |Z_30|      I_ratio     |I+0.5|\00"
@.str.exp_riemann_zeta.89 = private unnamed_addr constant [5 x i8] c"13.0\00"
@.str.exp_riemann_zeta.90 = private unnamed_addr constant [6 x i8] c"999.0\00"
@.str.exp_riemann_zeta.91 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_riemann_zeta.92 = private unnamed_addr constant [6 x i8] c"999.0\00"
@.str.exp_riemann_zeta.93 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_riemann_zeta.94 = private unnamed_addr constant [6 x i8] c"16.01\00"
@.str.exp_riemann_zeta.95 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_riemann_zeta.96 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_riemann_zeta.97 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_riemann_zeta.98 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_riemann_zeta.99 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_riemann_zeta.100 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_riemann_zeta.101 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_riemann_zeta.102 = private unnamed_addr constant [5 x i8] c"0.02\00"
@.str.exp_riemann_zeta.103 = private unnamed_addr constant [6 x i8] c"  ***\00"
@.str.exp_riemann_zeta.104 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_riemann_zeta.105 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_riemann_zeta.106 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_riemann_zeta.107 = private unnamed_addr constant [41 x i8] c"  Best I-ratio (closest to -0.5) at t = \00"
@.str.exp_riemann_zeta.108 = private unnamed_addr constant [13 x i8] c"  |I+0.5| = \00"
@.str.exp_riemann_zeta.109 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_riemann_zeta.110 = private unnamed_addr constant [23 x i8] c"  Smallest |Z| at t = \00"
@.str.exp_riemann_zeta.111 = private unnamed_addr constant [9 x i8] c"  |Z| = \00"
@.str.exp_riemann_zeta.112 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_riemann_zeta.113 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_riemann_zeta.114 = private unnamed_addr constant [31 x i8] c"  Sharpness comparison (N=30):\00"
@.str.exp_riemann_zeta.115 = private unnamed_addr constant [44 x i8] c"  Evaluating at t=14.1 vs t=14.2 vs t=14.5:\00"
@.str.exp_riemann_zeta.116 = private unnamed_addr constant [5 x i8] c"14.1\00"
@.str.exp_riemann_zeta.117 = private unnamed_addr constant [5 x i8] c"14.2\00"
@.str.exp_riemann_zeta.118 = private unnamed_addr constant [5 x i8] c"14.5\00"
@.str.exp_riemann_zeta.119 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_riemann_zeta.120 = private unnamed_addr constant [50 x i8] c"  A sharper dip in I-ratio than |Z| would suggest\00"
@.str.exp_riemann_zeta.121 = private unnamed_addr constant [45 x i8] c"  I-ratio is a more sensitive zero detector.\00"
@.str.exp_riemann_zeta.122 = private unnamed_addr constant [50 x i8] c"  CAVEAT: N=30 partial sums are very approximate.\00"
@.str.exp_riemann_zeta.123 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_riemann_zeta.124 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_riemann_zeta.125 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_riemann_zeta.126 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_riemann_zeta.127 = private unnamed_addr constant [7 x i8] c"    t=\00"
@.str.exp_riemann_zeta.128 = private unnamed_addr constant [7 x i8] c"  |Z|=\00"
@.str.exp_riemann_zeta.129 = private unnamed_addr constant [5 x i8] c"  I=\00"
@.str.exp_riemann_zeta.130 = private unnamed_addr constant [11 x i8] c"  |I+0.5|=\00"
@.str.exp_riemann_zeta.131 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_riemann_zeta.132 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_riemann_zeta.133 = private unnamed_addr constant [54 x i8] c"  RIEMANN ZETA: I-RATIO ANALYSIS OF ZERO DISTRIBUTION\00"
@.str.exp_riemann_zeta.134 = private unnamed_addr constant [53 x i8] c"  Characterising zeta zeros via force-balance metric\00"
@.str.exp_riemann_zeta.135 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_riemann_zeta.136 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_riemann_zeta.137 = private unnamed_addr constant [55 x i8] c"  WARNING: This is numerical exploration, NOT a proof.\00"
@.str.exp_riemann_zeta.138 = private unnamed_addr constant [64 x i8] c"  Partial sums Z_N(s) approximate zeta(s) poorly for Re(s)=0.5.\00"
@.str.exp_riemann_zeta.139 = private unnamed_addr constant [31 x i8] c"  Results are indicative only.\00"
@.str.exp_riemann_zeta.140 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_riemann_zeta.141 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_riemann_zeta.142 = private unnamed_addr constant [10 x i8] c"  SUMMARY\00"
@.str.exp_riemann_zeta.143 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_riemann_zeta.144 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_riemann_zeta.145 = private unnamed_addr constant [67 x i8] c"  The I-ratio measures force balance among zeta partial sum terms.\00"
@.str.exp_riemann_zeta.146 = private unnamed_addr constant [65 x i8] c"  At a true zero, all terms cancel: I -> -0.5 (perfect balance).\00"
@.str.exp_riemann_zeta.147 = private unnamed_addr constant [55 x i8] c"  Away from zeros, terms have net resultant: I > -0.5.\00"
@.str.exp_riemann_zeta.148 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_riemann_zeta.149 = private unnamed_addr constant [20 x i8] c"  Key observations:\00"
@.str.exp_riemann_zeta.150 = private unnamed_addr constant [65 x i8] c"  1. I-ratio dips near known zero locations on the critical line\00"
@.str.exp_riemann_zeta.151 = private unnamed_addr constant [61 x i8] c"  2. I-ratio distinguishes sigma=0.5 from other sigma values\00"
@.str.exp_riemann_zeta.152 = private unnamed_addr constant [65 x i8] c"  3. The dip width characterises how sharply zeros are localised\00"
@.str.exp_riemann_zeta.153 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_riemann_zeta.154 = private unnamed_addr constant [18 x i8] c"  HONEST CAVEATS:\00"
@.str.exp_riemann_zeta.155 = private unnamed_addr constant [63 x i8] c"  - Partial sums converge poorly at sigma=0.5 (critical strip)\00"
@.str.exp_riemann_zeta.156 = private unnamed_addr constant [48 x i8] c"  - N=30..100 is far from the asymptotic regime\00"
@.str.exp_riemann_zeta.157 = private unnamed_addr constant [56 x i8] c"  - This does NOT prove RH or anything about zeta zeros\00"
@.str.exp_riemann_zeta.158 = private unnamed_addr constant [55 x i8] c"  - The I-ratio is a diagnostic, not a proof technique\00"
@.str.exp_riemann_zeta.159 = private unnamed_addr constant [63 x i8] c"  - True zeta requires analytic continuation, not partial sums\00"
@.str.exp_riemann_zeta.160 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_riemann_zeta.161 = private unnamed_addr constant [23 x i8] c"  WHAT THIS DOES SHOW:\00"
@.str.exp_riemann_zeta.162 = private unnamed_addr constant [64 x i8] c"  - The I-ratio framework extends naturally to complex analysis\00"
@.str.exp_riemann_zeta.163 = private unnamed_addr constant [62 x i8] c"  - Force-balance at -0.5 corresponds to cancellation (zeros)\00"
@.str.exp_riemann_zeta.164 = private unnamed_addr constant [61 x i8] c"  - The metric could guide numerical zero-finding algorithms\00"
@.str.exp_riemann_zeta.165 = private unnamed_addr constant [61 x i8] c"============================================================\00"
